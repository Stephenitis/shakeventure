require 'net/http'
require 'net/https'

module Api
  class AdventuresController < ApplicationController
    respond_to :json, :html

    def show
    end

    def update 
      if params['category']
        filters = ''
        values = set_values_from_params(params)
        filters = stringify_values(values)
      end

      # Return all experiences from Xola api based on form filters and sample one
      response = Net::HTTP.get_response(URI("https://dev.xola.com/api/experiences#{filters}"))

      experience_hash = ActiveSupport::JSON.decode(response.body)
      experiences = experience_hash['data']
      # experiences.select! { |experience| experience['duration'].between?(somerange)}
      experience = experiences.sample
      @image = "https://dev.xola.com"+nested_hash_finder(experience,"photo")["src"]
      @name = experience['name']
      @desc = experience['desc']
      @price = "$ " + delimit_num(experience['price']).to_s
      @miles = delimit_num(experience['price']*13 + rand(500))

      render partial: 'shared/experience', layout: false, locals: {experience: @experience, image: @image}
    end
  
    private

    def set_values_from_params(params)
      values = {}
      # values['location'] = params['location'] || 'City, State'
      # values['price_range'] = params['price_range']

      values['category'] = collect_categories(params['category'])
      values['price'] = params['price_range']
      values['geo'] = "37.774929,-122.419416,30"
      values
    end

    def stringify_values(values)
      string = '?'
      values.each_pair do |key, value|
        string_to_add = "#{key}=#{value}"
        string << string_to_add
      end
      string
    end

    def collect_categories(category_params)
      categories = []
      category_params.each_value do |cat|
        cat.upcase.constantize.each do |xola_cat|
          categories << xola_cat
        end
      end
      categories.join(',')
    end

    def nested_hash_finder(obj,key)
      if obj.respond_to?(:key?) && obj.key?(key)
        obj[key]
      elsif obj.respond_to?(:each)
        r = nil
        obj.find{ |*a| r=nested_hash_finder(a.last,key) }
        r
      end
    end

    def lat_long(city, distance=70)
      lat_long = []
      s = Geocoder.search(city)
      lat_long << s[0].latitude << s[0].longitude
      lat_long.join(',') + ",#{distance}"
    end

    def delimit_num(num)
      num.to_s.reverse.gsub(/...(?=.)/,'\&,').reverse
    end

  end
end

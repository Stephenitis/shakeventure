require 'net/http'
require 'net/https'

module Api
  class AdventuresController < ApplicationController
    respond_to :json, :html

    def show
<<<<<<< HEAD
       # Return all experiences from Xola api based on form filters and sample one
      response = Net::HTTP.get_response(URI("https://dev.xola.com/api/experiences?limit=1&category=Wilderness%20Training"))
      @experiences = response.body
      @experience_hash =  ActiveSupport::JSON.decode(@experiences)
      @image = nested_hash_finder(@experience_hash,"src").sample
=======
    end

    def update 
      if params['category']
        filters = ''
        values = set_values_from_params(params)
        filters = stringify_values(values)
      end

      response = Net::HTTP.get_response(URI("https://dev.xola.com/api/experiences#{filters}"))
      # Return all experiences from Xola api based on form filters and sample one
      experience_hash = ActiveSupport::JSON.decode(response.body)
      @experience = experience_hash['data'].sample
      @image = "https://dev.xola.com"+nested_hash_finder(@experience,"photo")["src"]

      render partial: 'shared/experience', layout: false, locals: {experience: @experience, image: @image}
    end
  
    private

    def set_values_from_params(params)
      values = {}
      # values['location'] = params['location'] || 'City, State'
      # values['price_range'] = params['price_range']

      values['category'] = collect_categories(params['category'])
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
>>>>>>> f33a2d31d5197243a0577168490452cd585e51d0
    end

  end
end



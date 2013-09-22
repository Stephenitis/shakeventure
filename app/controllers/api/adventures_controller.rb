require 'net/http'
require 'net/https'

module Api
  class AdventuresController < ApplicationController
    respond_to :json

    def show
      string = ''
      string = set_values_from_params(params).stringify_values if params['category']
      p string
      # Return all experiences from Xola api based on form filters and sample one
      response = Net::HTTP.get_response(URI("https://dev.xola.com/api/experiences?category=Wilderness%20Training"))
      @experiences = response.body
      p params
      p '*' * 50
    end
    private

    def set_values_from_params(params)
      p 'I"M HERE'
      p params
      values = {}
      # values['location'] = params['location'] || 'City, State'
      # values['price_range'] = params['price_range']

      values['category'] = collect_categories(params['category'])
    end

    def stringify_values
      string = '?'
      self.each_pair do |key, value|
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

  end
end
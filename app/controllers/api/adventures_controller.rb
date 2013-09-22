require 'net/http'
require 'net/https'

module Api
  class AdventuresController < ApplicationController
    include ApplicationHelper
    respond_to :json

    def show
       # Return all experiences from Xola api based on form filters and sample one
      response = Net::HTTP.get_response(URI("https://dev.xola.com/api/experiences?limit=1&category=Wilderness%20Training"))
      @experiences = response.body
      @experience_hash =  ActiveSupport::JSON.decode(@experiences)
      @image = nested_hash_finder(@experience_hash,"src")
    end

  end
end
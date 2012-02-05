require 'sinatra/base'

module Dredge
  class Server < Sinatra::Base
    helpers do
      def models
        Dredge.models
      end

      def model
        params[:model].singularize.capitalize.constantize
      end

      def results
        model.all
      end
    end

    get '/' do
      erb :index
    end

    get "/results/:model" do
      results.to_json
    end
  end
end

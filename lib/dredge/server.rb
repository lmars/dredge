require 'sinatra/base'

module Dredge
  class Server < Sinatra::Base
    helpers do
      def models
        Dredge.models
      end
    end

    get '/' do
      erb :index
    end
  end
end

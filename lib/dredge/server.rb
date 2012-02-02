require 'sinatra/base'

module Dredge
  class Server < Sinatra::Base
    get '/' do
      erb :index
    end
  end
end

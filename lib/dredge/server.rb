require 'sinatra/base'

module Dredge
  class Server < Sinatra::Base
    enable :sessions

    set :root, File.expand_path('../server', __FILE__)

    helpers do
      def models
        Dredge.models
      end
    end

    get '/dredge' do
      session[:model] = params[:model].constantize if params[:model]

      @fields = {}
      models.each do |model|
        model.column_names.each do |column_name|
          @fields["fields[#{model}][#{column_name}]"] = column_name
        end
      end

      if params[:fields]
        session[:fields] = []
        params[:fields].each_pair do |model, fields|
          fields.each_pair do |field, value|
            session[:fields] << @fields["fields[#{model}][#{field}]"]
          end
        end
      end

      @results = []
      if session[:model] && session[:fields]
        @results = session[:model].all.map do |record|
          session[:fields].inject({}) do |result, column|
            result[column] = record.send(column)
            result
          end
        end
      end

      erb :index
    end

    get '/dredge/filters' do
      @filters = {}
      models.each do |model|
        model.column_names.each do |column_name|
          @filters["#{model}##{column_name}"] = column_name
        end
      end

      if params[:filter]
        filter = params[:filter].split('#')
        session[:filter] = {
          :model => filter[0],
          :column => filter[1]
        }
      end
      erb :filters
    end
  end
end

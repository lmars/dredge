require 'sinatra/base'

module Dredge
  class Server < Sinatra::Base
    set :root, File.expand_path('../server', __FILE__)

    get '/dredge' do
      @fields = {}
      Dredge.models.each do |model|
        model.column_names.each do |column_name|
          @fields["fields[#{model}][#{column_name}]"] = column_name
        end
      end

      @columns = []
      if params[:fields]
        params[:fields].each_pair do |model, fields|
          fields.each_pair do |field, value|
            @columns << @fields["fields[#{model}][#{field}]"]
          end
        end
      end

      erb :index
    end
  end
end

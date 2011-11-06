require 'active_record'

ActiveRecord::Base.establish_connection :adapter => 'sqlite3', :database => File.expand_path('../activerecord/test.sqlite3', __FILE__)
ActiveRecord::Migration.verbose = false
ActiveRecord::Migrator.migrate(File.expand_path('../activerecord/migrations', __FILE__))

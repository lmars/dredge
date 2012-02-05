require 'active_record'

ActiveRecord::Base.establish_connection(:adapter => 'sqlite3', :database => 'test/test.db')

ActiveRecord::Migration.verbose = false
ActiveRecord::Migrator.migrate('test/migrations', nil)

require 'database_cleaner'
require 'database_cleaner/cucumber'
DatabaseCleaner.strategy = :truncation

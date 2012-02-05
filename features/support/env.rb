require 'dredge'

require 'capybara/cucumber'
Capybara.app = Dredge::Server.new

require 'capybara/webkit'
Capybara.javascript_driver = :webkit

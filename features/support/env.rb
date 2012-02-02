require 'dredge'

require 'capybara/cucumber'
Capybara.app = Dredge::Server.new

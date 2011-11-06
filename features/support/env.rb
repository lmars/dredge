require 'capybara/cucumber'
require 'dredge'

Capybara.app = Dredge::Server

$:.unshift File.dirname(__FILE__)
require 'activerecord'

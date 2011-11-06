require File.expand_path('../lib/dredge/version', __FILE__)

Gem::Specification.new do |s|
  s.name      = 'dredge'
  s.version   = Dredge::VERSION
  s.date      = Time.now.strftime('%Y-%m-%d')
  s.summary   = 'Dredge is an ActiveRecord based data analysis tool'
  s.homepage  = 'https://github.com/lmars/dredge'
  s.email     = 'lewismarshall86@gmail.com'
  s.authors   = ['Lewis Marshall']

  s.add_dependency 'activerecord'
  s.add_dependency 'activesupport'
  s.add_dependency 'sinatra'

  s.description = <<description
    Dredge is a gem providing an intuitive interface to extract data from a Rails application.
description
end

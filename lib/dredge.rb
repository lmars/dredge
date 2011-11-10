require 'set'

module Dredge
  class << self
    attr_accessor :models
  end
  self.models = Set.new

  autoload :Server, 'dredge/server'
end

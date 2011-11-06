module Dredge
  class << self
    attr_accessor :models
  end
  self.models = []

  autoload :Server, 'dredge/server'
end

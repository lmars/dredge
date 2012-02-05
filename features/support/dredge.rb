def add_models
  add_model 'User'
  add_model 'Group'
end

def add_model(model = 'User')
  Dredge.models << model
  model
end

def create_records(model = 'User')
  (1..3).map { Factory.create model.downcase }
end

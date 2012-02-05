Given /^dredge has some models$/ do
  add_models
end

Given /^dredge has a model$/ do
  @model = add_model
end

Given /^some data exists for the model$/ do
  @records = create_records(@model)
end

Then /^I should be able to select a model from a list$/ do
  visit(root_path)

  check_model_links_appear
end

Then /^I should be able to see the data$/ do
  visit(root_path)

  choose_model(@model)

  check_records_appear(@records)
end

Given /^dredge has some models$/ do
  add_models
end

Then /^I should be able to select a model from a list$/ do
  visit(root_path)

  check_model_links_appear
end

Given %r{I am on the dredge filter page} do
  visit(dredge_filter_path)
end

When %r{I select a (\w+) column filter} do |klass|
  select_filter_for(klass)
  click_button('Add')
end

When %r{I choose to filter by equality on the selected column} do
  choose_equality_filter
  insert_a_filter_value
  click_button('Apply')
end

Then %r{I should be able to select some (\w+) column filters} do |klass|
  page.should have_filters_for(klass)
end

Then %r{I should be asked how I want to filter the selected column} do
  page.should have_filter_operator_fields
  page.should have_filter_value_field
end

# pending a refactor
Then %r{I should see some filtered results} do
end

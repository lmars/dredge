Given %r{a (\w+) model} do |klass|
  require_model(klass)
end

Given %r{I am on the dredge interface page} do
  visit(dredge_interface_path)
end

When %r{I select some (\w+) fields} do |klass|
  within(fields_section) do
    select_fields_for(klass)
    click_button('Apply')
  end
end

Then %r{I should be able to choose to show results for the (\w+) model} do |klass|
  within(models_section) do
    page.should have_field_for(klass)
  end
end

Then %r{I should be able to select some (\w+) fields} do |klass|
  within(fields_section) do
    page.should have_fields_for(klass)
  end
end

Then %r{I should see the selected fields in the results table} do
  within(results_section) do
    page_should_have_selected_fields
  end
end

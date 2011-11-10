Given %r{a (\w+) model} do |klass|
  require_model(klass)
end

Given %r{I am on the dredge interface page} do
  visit(dredge_interface_path)
end

Given %r{I have chosen to show results for the (\w+) model} do |klass|
  step "I choose to show results for the #{klass} model"
end

Given %r{there are (no|some) (\w+) records in the system} do |no_or_some, klass|
  if no_or_some == 'no'
    delete_records_for(klass)
  else
    add_records_for(klass)
  end
end

When %r{I select some (\w+) fields} do |klass|
  within(fields_section) do
    select_fields_for(klass)
    click_button('Apply')
  end
end

When %r{I choose to show results for the (\w+) model} do |klass|
  within(models_section) do
    choose_field_for(klass)
    click_button('Apply')
  end
end

Then %r{I should be able to choose to show results for the (\w+) model} do |klass|
  within(models_section) do
    page.should have_field_for(klass)
  end
end

Then %r{I should( not)? be able to select some (\w+) fields} do |negative, klass|
  within(fields_section) do
    if negative
      page.should_not have_fields_for(klass)
    else
      page.should have_fields_for(klass)
    end
  end
end

Then %r{I should see the selected fields in the results table} do
  within(results_section) do
    page_should_have_selected_fields
  end
end

Then %r{I should be told there are no results} do
  within(results_section) do
    page_should_have_no_results
  end
end

Then %r{I should see some (\w+) data in the results table} do |klass|
  within(results_section) do
    page_should_have_results_for(klass)
  end
end

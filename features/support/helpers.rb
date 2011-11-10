def dredge_interface_path
  '/dredge'
end

def require_model(klass)
  require "activerecord/models/#{klass.underscore}"
  Dredge.models << klass.constantize
end

def add_records_for(klass)
  3.times { FactoryGirl.create(:"#{klass.underscore}") }
end

def delete_records_for(klass)
  klass.constantize.delete_all
end

def select_fields_for(klass)
  @selected_fields = []
  all(%{input[type="checkbox"][name^="fields[#{klass}]"]}).each do |field|
    @selected_fields << field
    check(field[:name])
  end
end

def choose_field_for(klass)
  choose("model-#{klass}")
end

def have_field_for(klass)
  have_selector(%{input[type="radio"][value="#{klass}"]})
end

def have_fields_for(klass)
  have_selector(%{input[type="checkbox"][name^="fields[#{klass}]"]})
end

def page_should_have_selected_fields
  @selected_fields.each do |field|
    page.should have_content(field[:value])
  end
end

def page_should_have_no_results
  page.should have_css('table tbody tr', :count => 1)
  page.should have_content('No results')
end

def page_should_have_results_for(klass)
  klass = klass.constantize

  page.should have_css('table tbody tr', :count => klass.count)

  klass.all.each do |record|
    record.attributes.each_pair do |attribute, value|
      page.should have_content(value)
    end
  end
end

def models_section
  '#models'
end

def fields_section
  '#fields'
end

def results_section
  '#results'
end

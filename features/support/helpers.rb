def dredge_interface_path
  '/dredge'
end

def require_model(klass)
  require "activerecord/models/#{klass.underscore}"
  Dredge.models << klass.constantize
end

def select_fields_for(klass)
  @selected_fields = []
  all(%{input[type="checkbox"][name^="fields[#{klass}]"]}).each do |field|
    @selected_fields << field
    check(field[:name])
  end
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

def models_section
  '#models'
end

def fields_section
  '#fields'
end

def results_section
  '#results'
end

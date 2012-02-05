def root_path
  '/'
end

def choose_model(model)
  within('section#models') do
    click_link(model)
  end
end

def check_model_links_appear
  within('section#models') do
    Dredge.models.each do |model|
      page.should have_link(model)
    end
  end
end

def check_records_appear(records)
  within('section#results table tbody') do
    records.each do |record|
      record.attributes.each_pair do |attribute, value|
        page.should have_content(value)
      end
    end
  end
end

def root_path
  '/'
end

def check_model_links_appear
  within('section#models') do
    Dredge.models.each do |model|
      page.should have_link(model)
    end
  end
end

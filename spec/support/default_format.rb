RSpec.configure do |config|
  config.before(:each, type: :controller) do
    request.content_type = 'application/json' if defined? request
  end
end

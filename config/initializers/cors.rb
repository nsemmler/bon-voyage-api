# Be sure to restart your server when you modify this file.

# Avoid CORS issues when API is called from the frontend app.
# Handle Cross-Origin Resource Sharing (CORS) in order to accept cross-origin AJAX requests.

# Read more: https://github.com/cyu/rack-cors

Rails.application.config.middleware.insert_before 0, Rack::Cors do
  allow do
    origins [
      'https://bonvoyage.surge.sh',
      'http://bonvoyage.surge.sh',
      'https://voyage-capstone.herokuapp.com',
      'http://voyage-capstone.herokuapp.com',
      'https://localhost:3001',
      'http://localhost:3001'
    ]

    resource '*',
      headers: %w(Authorization),
      methods: :any,
      expose: %w(Authorization)
  end
end

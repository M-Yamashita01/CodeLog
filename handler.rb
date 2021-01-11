require 'sinatra'
require 'json'
set :port, ENV['FUNCTIONS_CUSTOMHANDLER_PORT'] || 3000

before do
  content_type :json
end

get '/api/hello' do
  puts '------api/helo------'
  content_type :json
  name = params[:name]
  data = {name: name ? 
    "Hello, #{name}" : 
    'Pass a name in the query string for a personalized response.'}
  data.to_json
end

get '/api/codelog' do
  data = {
    text: 'Hello, World'
  }
  data.to_json
end

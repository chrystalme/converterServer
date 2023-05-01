# frozen_string_literal: true

require 'minitest/autorun'
require 'rack/test'
require_relative '../json_to_csv_converter'
require_relative '../convert_handler'
require_relative './handler_test'

class ApiTest < Minitest::Test
  include Rack::Test::Methods

  def app
    Rack::Builder.new do
      map '/convert' do
        run HandlerTest.new(PORT: 8000)
      end
    end.to_app
    # lambda { |env| [200, {'content-type' => 'text/plain'}, ['All responses are OK']] }
  end

  def test_api_endpoint
    json_payload = [
      { "name": 'Greg', "age": 45, "gender": 'male', "email": 'geereg@example.com' },
      { "name": 'Jenny', "age": 35, "gender": 'female', "email": 'jehny@example.com' }
    ]
    exported_csv = "name,age,gender,email\nGreg,45,male,geereg@example.com\nJenny,35,female,jehny@example.com\n"

    post '/convert', json_payload.to_json, { 'Content-Type' => 'application/json' }

    assert last_response.ok?
    assert_equal 'text/csv', last_response['Content-Type']
    assert_equal exported_csv, last_response.body
  end
end

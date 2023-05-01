require 'minitest/autorun'
require 'rack/test'
require_relative '../json_to_csv_converter'
require_relative '../convert_handler'

class ApiTest < Minitest::Test
  include Rack::Test::Methods

  def app
    @handler = ConvertHandler.new
    # lambda { |env| [200, {'content-type' => 'text/plain'}, ['All responses are OK']] }
  end

  def test_api_endpoint
    PAYLOAD = [
      {"name": "Greg", "age": 45, "gender": "male", "email": "geereg@example.com"},
      {"name": "Jenny", "age": 35, "gender": "female", "email": "jehny@example.com"},
    ]
    exported_csv = "name,age,gender,email\nGreg,45,male,geereg@example.com\nJenny,35,female,jehny@example.com\n"
    
    request_body = PAYLOAD.to_json
    request = Struct.new(request_body)
    response = Struct.new(nil, nil, nil)
    @handler = do_POST(request, response)

    assert_equal 200, response.status
    assert_equal 'text/csv', response['Content-Type']
    assert_equal exported_csv, response.body

  
  end
end
# frozen_string_literal: true

require 'minitest/autorun'
require 'json'
require_relative '../json_to_csv_converter'

class JsonToCsvConverterTest < Minitest::Test
  def test_json_converter
    json_payload = [
      { "name": 'Greg', "age": 45, "gender": 'male', "email": 'geereg@example.com' },
      { "name": 'Jenny', "age": 35, "gender": 'female', "email": 'jehny@example.com' }
    ]
    csv_data = JsonToCsvConverter.convert(json_payload)
    expected_csv = "name,age,gender,email\nGreg,45,male,geereg@example.com\nJenny,35,female,jehny@example.com\n"
    assert_equal expected_csv, csv_data
  end
end

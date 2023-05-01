# frozen_string_literal: true

require 'webrick'
require 'json'
require_relative 'json_to_csv_converter'

class ConvertHandler < WEBrick::HTTPServlet::AbstractServlet
  def do_POST(request, response)
    # Set response headers
    response.status = 200
    response['Content-Type'] = 'text/csv'

    # Parse JSON request body
    json_payload = JSON.parse(request.body)

    csv_data = JsonToCsvConverter.convert(json_payload)

    # Write CSV data to response body
    response.body = csv_data
  end
end

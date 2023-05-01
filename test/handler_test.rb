# frozen_string_literal: true

require 'webrick'
require_relative '../json_to_csv_converter'

class HandlerTest < WEBrick::HTTPServlet::AbstractServlet
    def call(env)
    req = Rack::Request.new(env)

    if req.post? && req.path == '/convert'
      data = JSON.parse(req.body.read)
      csv = JsonToCsvConverter.convert(data)
      [200, { 'Content-Type' => 'text/csv' }, [csv]]
    else
      [404, { 'Content-Type' => 'text/plain' }, ['Not found']]
    end
  end
end
require 'webrick'
require_relative 'json_to_csv_converter.rb'
require_relative 'convert_handler.rb'

server = WEBrick::HTTPServer.new(Port: 8000)
server.mount '/convert', ConvertHandler
trap('INT') { server.shutdown }
server.start


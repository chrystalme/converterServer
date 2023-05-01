# frozen_string_literal: true

require 'webrick'
require_relative 'convert_handler'

server = WEBrick::HTTPServer.new(Port: 8000)
server.mount '/convert', ConvertHandler
trap('INT') { server.shutdown }
server.start

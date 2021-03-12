require 'webrick'

root = File.expand_path '../data-pro-web'
server = WEBrick::HTTPServer.new :Port => 8000, :DocumentRoot => root
server.start
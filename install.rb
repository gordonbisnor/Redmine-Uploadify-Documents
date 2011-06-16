require 'fileutils'

file = '/flash_session_cookie_middleware.rb'

middleware = File.dirname(__FILE__) + '/../../../app/middleware' + file

FileUtils.cp File.dirname(__FILE__) + file, middleware unless File.exist?(middleware)

puts IO.read(File.join(File.dirname(__FILE__), 'README'))
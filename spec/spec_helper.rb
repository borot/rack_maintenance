APP_ROOT = File.expand_path(File.dirname(__FILE__) + '/..')
$:.unshift "#{APP_ROOT}/lib"

require 'rspec'
require 'rack'
require 'rack/maintenance'
require 'mock_app'

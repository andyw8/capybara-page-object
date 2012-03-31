require 'rubygems'
require 'bundler'
require 'pp'
begin
  Bundler.setup(:default, :development)
rescue Bundler::BundlerError => e
  $stderr.puts e.message
  $stderr.puts "Run `bundle install` to install missing gems"
  exit e.status_code
end
require 'test/unit'
require 'shoulda'

$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '..', 'lib'))
$LOAD_PATH.unshift(File.dirname(__FILE__))
require 'capybara-page-object'

class Test::Unit::TestCase
end

def load_fixture(model)
  filename = model.to_s.split('::').last.downcase + '.html'
  html = File.open(File.dirname(__FILE__) + '/fixtures/' + filename).read
  model.new(Capybara.string(html))
end

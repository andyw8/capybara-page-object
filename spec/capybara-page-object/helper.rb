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
require 'rspec'

$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '..', 'lib'))
$LOAD_PATH.unshift(File.dirname(__FILE__))

unless ENV["SKIP_COVERAGE"]
  require 'simplecov'

  SimpleCov.start
  SimpleCov.at_exit do
    SimpleCov.result.format!
    if SimpleCov.result.covered_percent < 100
      `open coverage/index.html`
     end
  end
end

require 'capybara-page-object'

# -*- encoding : utf-8 -*-
require 'rubygems'
require 'spork'

def configure_code_coverage
  if ENV["COVERAGE"] and not ENV['DRB']
    require 'simplecov'
    SimpleCov.start
    SimpleCov.at_exit do
      SimpleCov.result.format!
      if SimpleCov.result.covered_percent < 100
        `open coverage/index.html`
      end
    end
  end
end

# ----------------------------------------------------------------------------------------------------------------------
# Spork prefork
# Loading more in this block will cause your tests to run faster. However, if you change any
# configuration or code from libraries loaded here, you'll need to restart spork for it take effect.
# ----------------------------------------------------------------------------------------------------------------------

Spork.prefork do

  $LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '..', 'lib'))

  configure_code_coverage

  require 'rspec'
  require 'capybara-page-object'


  # ----- RSpec configuration

  RSpec.configure do |config|

    config.mock_with :rspec

    # ----- filters
    config.treat_symbols_as_metadata_keys_with_true_values = true
    config.alias_example_to :fit, :focused
    config.fail_fast = false
    config.filter_run :focused
    config.run_all_when_everything_filtered = true

  end

end


# ----------------------------------------------------------------------------------------------------------------------
# Spork each_run
# This code will be run each time you run your specs.
# ----------------------------------------------------------------------------------------------------------------------

Spork.each_run do

  configure_code_coverage

  # ----- files reload
  lib_path = File.expand_path('../../lib', __FILE__)
  Dir["#{lib_path}/**/*.rb"].each do |file|
    load file
  end

end

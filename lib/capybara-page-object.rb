require 'rubygems'
require 'capybara'
require File.dirname(__FILE__) + '/page'
require File.dirname(__FILE__) + '/element'

module Capybara
  module Node
    module Finders
      include Extractors::PageLevel
    end
  end
end

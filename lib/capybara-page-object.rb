require 'capybara'
require File.dirname(__FILE__) + '/node'
require File.dirname(__FILE__) + '/element'
require File.dirname(__FILE__) + '/html5_data'

module Capybara
  module Node
    class Simple
      include Extractor::PageLevel
      include CapybaraPageObject::HTML5Data
    end
  end
end

require 'capybara'
require File.dirname(__FILE__) + '/page'
require File.dirname(__FILE__) + '/element'
require File.dirname(__FILE__) + '/html5_data'

module Capybara
  module Node
    module Finders
      include Extractor::PageLevel
      include CapybaraPageObject::HTML5Data
    end
  end
end

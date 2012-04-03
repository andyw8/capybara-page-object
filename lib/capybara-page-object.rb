require 'capybara'
require 'node'
require 'element'
require 'html5_data'

module Capybara
  module Node
    class Simple
      include Extractor::PageLevel
      include CapybaraPageObject::HTML5Data
    end
  end
end

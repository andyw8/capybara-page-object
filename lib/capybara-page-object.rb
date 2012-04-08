require 'capybara'
require 'node'
require 'element'
require 'html5_data'
require 'page'

module Capybara
  module Node
    class Simple
      include CapybaraPageObject::HTML5Data
    end
  end
end

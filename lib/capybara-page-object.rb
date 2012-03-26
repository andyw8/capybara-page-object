require 'rubygems'
require 'capybara'
require File.dirname(__FILE__) + '/extractors/common'
require File.dirname(__FILE__) + '/extractors/page_level'
require File.dirname(__FILE__) + '/form'
require File.dirname(__FILE__) + '/image'
require File.dirname(__FILE__) + '/page'
require File.dirname(__FILE__) + '/table'

module Capybara
  module Node
    module Finders
      include Extractors::PageLevel
    end
  end
end

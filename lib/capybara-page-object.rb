require 'rubygems'
require 'capybara'
require_relative 'extractors/common'
require_relative 'extractors/page_level'
require_relative 'page'
require_relative 'table'
require_relative 'image'

module Capybara
  module Node
    module Finders
      include Extractors::PageLevel
    end
  end
end

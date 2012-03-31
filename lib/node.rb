require File.dirname(__FILE__) + '/collections'
require File.dirname(__FILE__) + '/navigation'
require File.dirname(__FILE__) + '/key_value'
require File.dirname(__FILE__) + '/html5_data'
require File.dirname(__FILE__) + '/extractor/common'
require File.dirname(__FILE__) + '/extractor/page_level'

module CapybaraPageObject
  class Node
    include Extractor::Common
    include Extractor::PageLevel
    include CapybaraPageObject::Collections
    include CapybaraPageObject::Navigation
    include CapybaraPageObject::HTML5Data
    include Extractor::PageLevel

    attr_accessor :source

    def initialize(source=nil)
      source ||= Capybara.current_session
      @source = source
    end

    def self.from_string(string)
      new(Capybara.string(string))
    end
    
    def respond_to?(sym)
       source.respond_to?(sym) || super(sym)
     end

    def method_missing(sym, *args, &block)
      if source.respond_to?(sym)
        source.send(sym)
      else
        super(sym, *args, &block)
      end
    end
  end

  class MissingPath < RuntimeError
  end
end

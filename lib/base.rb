require File.dirname(__FILE__) + '/collections'
require File.dirname(__FILE__) + '/navigation'
require File.dirname(__FILE__) + '/key_value'
require File.dirname(__FILE__) + '/html5_data'
require File.dirname(__FILE__) + '/extractors/common'
require File.dirname(__FILE__) + '/extractors/page_level'

module CapybaraPageObject
  class Base
    include Extractors::Common
    include Extractors::PageLevel
    include CapybaraPageObject::Collections
    include CapybaraPageObject::Navigation
    include CapybaraPageObject::HTML5Data

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

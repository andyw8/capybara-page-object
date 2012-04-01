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
    
    def classes
      classes_list = root_node[:class] or return []
      classes_list.split(' ')
    end
    
    def children(opts={})
      factory = opts[:factory]
      return all(child_node) unless factory
      r = []
      all(child_node).each do |li|
        r << factory.new(li)
      end
      r
    end
    
    private
    
    def element_names
      raise "You need to override element_names"
    end
    
    def root_node
      # TODO still don't fully understand why we need both approaches
      element_names.each do |element_name|
        if source.native.name == element_name
          return source.native
        elsif source.has_css?(element_name)
          return find(element_name)
        end
      end
      raise "No element matches for #{element_names.join(', ')}"
    end
  end

  class MissingPath < RuntimeError
  end
end

require 'collections'
require 'navigation'
require 'key_value'
require 'html5_data'
require 'extractor/common'
require 'extractor/page_level'

module CapybaraPageObject
  class Node < Capybara::Node::Element
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
      new(Capybara.string(string).find(:xpath, '.'))
    end

    def respond_to?(sym)
      source.respond_to?(sym) || super(sym)
    end

    # TODO why is this needed?
    def text
      root_node.text
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

    private

    def element_names
      raise "You need to override element_names"
    end

    def root_node
      # TODO still don't fully understand why we need both approaches
      element_names.each do |element_name|
        if source.has_css?(element_name)
          return find(element_name)
        end
      end
      pp source
      raise "No element matches for #{element_names.join(', ')}"
    end
  end

  class MissingPath < RuntimeError
  end
end

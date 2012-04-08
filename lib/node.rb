require 'collections'
require 'navigation'
require 'key_value'
require 'html5_data'
require 'delegators'

module CapybaraPageObject
  class Node < Capybara::Node::Element
    include Delegators
    include CapybaraPageObject::Collections
    include CapybaraPageObject::Navigation
    include CapybaraPageObject::HTML5Data

    attr_accessor :source

    def initialize(source=nil)
      source ||= Capybara.current_session
      @source = source
    end

    def self.from_string(string, root_element=nil)
      if root_element
        new(Capybara.string(string).find(root_element))
      else
         new(Capybara.string(string))
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

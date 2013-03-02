# -*- encoding : utf-8 -*-
require 'capybara-page-object/node'
require 'capybara-page-object/collections'

module CapybaraPageObject

  module InstanceMethods
    def path(*args)
      raise MissingPath, "You need to override #path in #{self.class}"
    end

    def root_path
      '/'
    end

    def full_path
      root_path + path
    end

    def visit_path(attr)
      target = full_path
      if attr.kind_of?(String)
        target += '/' + attr
      elsif attr.kind_of?(Integer)
        target += '/' + attr.to_s
      elsif attr.kind_of?(Hash)
        # to mitigate API breakage, segments are interpolated from symbol keys
        segment_ids = path.scan(/:(\w+)/).flatten.map(&:to_sym)
        raise MissingPathSegment unless (segment_ids - attr.keys).empty?
        interpolated_path = path.gsub(/:(\w+)/) { attr[$1.to_sym] }
        query_parameters = attr.delete_if { |k, v| segment_ids.include?(k) }.map { |k, v| "#{k}=#{v}" }

        target = root_path
        target += interpolated_path
        target += '?' + query_parameters.join('&') if query_parameters.any?
      elsif attr != nil
        raise ArgumentError, 'Expected a String, Integer or Hash'
      end
      source.visit target
    end
  end

  module ClassMethods
    def from_string(string, target)
      new(Capybara.string(string).find(target))
    end

    def current?
      page = new
      page.source.current_path == page.full_path
    end

    def visit(attr=nil)
      page = new
      page.visit_path(attr)
      page
    end
  end

  class Page < CapybaraPageObject::Node
    # TODO why doesn't this work when in the module?
    def tables
      all('table').each_with_object({}) do |e, hash|
        t = CapybaraPageObject::Table.new(e)
        hash[t.key] = t
      end
    end

    def forms
      all('form').each_with_object({}) do |e, hash|
        f = CapybaraPageObject::Form.new(e)
        hash[f.key] = f
      end
    end

    def self.path(p)
      define_method(:path) { p }
    end

    def self.component(name, &block)
      define_method(name, &block)
    end

    include CapybaraPageObject::Collections
    include CapybaraPageObject::InstanceMethods
    extend CapybaraPageObject::ClassMethods
  end

  class MissingPath < RuntimeError
  end

  class MissingPathSegment < RuntimeError
  end
end

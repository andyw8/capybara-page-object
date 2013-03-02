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
        # to avoid API breakage, we only consider hash, the keys of which:
        # - are symbols
        # - match exactly with the segments of the path
        if attr.keys == path.scan(/:(\w+)/).flatten.map(&:to_sym)
          target = root_path + path.gsub(/:(\w+)/) {attr[$1.to_sym] }
        else
          pairs = attr.map { |k, v| "#{k}=#{v}" }
          target += '?' + pairs.join('&') if pairs.any?
        end
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
end

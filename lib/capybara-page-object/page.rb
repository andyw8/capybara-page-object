module CapybaraPageObject

  module InstanceMethods
    def path(*args)
      raise MissingPath, "You need to override #path in #{self.class}"
    end

    def prefix
      '/'
    end

    def visit_path(attr)
      target = prefix + path
      if attr.kind_of?(String)
        target += attr
      elsif attr.kind_of?(Hash)
        pairs = attr.map { |k, v| "#{k}=#{v}" }
        target += '?' + pairs.join('&') if pairs.any?
      elsif attr != nil
        raise ArgumentError
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
      page.source.current_path == page.prefix + page.path
    end

    def visit(attr={})
      page = new
      page.visit_path(attr)
      page
    end
  end

  class Page < CapybaraPageObject::Node
    include CapybaraPageObject::Collections
    include CapybaraPageObject::InstanceMethods
    extend CapybaraPageObject::ClassMethods
  end

  class MissingPath < RuntimeError
  end
end
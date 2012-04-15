module CapybaraPageObject
  class Page < CapybaraPageObject::Node
    include CapybaraPageObject::Collections
    
    def self.from_string(string, target)
      new(Capybara.string(string).find(target))
    end

    def path(*args)
      raise MissingPath, "You need to override #path in #{self.class}"
    end

    def prefix
      '/'
    end

    def self.current?
      page = new
      page.source.current_path == page.prefix + page.path
    end

    def self.visit(attr={}, source=nil)
      page = new(source)
      page.visit_path(attr)
      page
    end

    def visit_path(attr)
      target = prefix + path
      if attr.kind_of?(String)
        target += attr
      elsif attr.kind_of?(Hash)
        pairs = []
        attr.each do |k, v|
          pairs << "#{k}=#{v}"
        end
        target += '?' + pairs.join('&') if pairs.any?
      elsif attr != nil
        raise ArgumentError
      end
      source.visit target
    end    
  end

  class MissingPath < RuntimeError
  end
end
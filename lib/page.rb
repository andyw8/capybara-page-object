module CapybaraPageObject
  class Page < CapybaraPageObject::Node
    include CapybaraPageObject::Collections
    
    def self.from_string(string, target)
      new(Capybara.string(string).find(target))
    end

    def path(*args)
      raise MissingPath, "You need to override #path in #{self.class}"
    end
    
    def refresh
      visit
    end

    def prefix
      ''
    end

    def self.visit(attr={}, source=nil)
      x = new(source)
      x.visit_path(attr)
      x
    end

    def visit_path(attr)
      target = prefix + path
      if attr
        pairs = []
        attr.each do |k, v|
          pairs << "#{k}=#{v}"
        end
        target += '?' + pairs.join('&') if pairs.any?
      end
      if target == source.current_path
        raise "Detected repeat of page load - use #reload instead"
      end
      source.visit target
    end    
  end
end
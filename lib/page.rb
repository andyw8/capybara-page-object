module CapybaraPageObject
  class Page < CapybaraPageObject::Node
    
    def initialize(attr={}, source=nil)
      super(source)
      @attr = attr
      visit
      self
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

    private

    def visit
      target = prefix + path
      if @attr
        pairs = []
        @attr.each do |k, v|
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
module CapybaraPageObject
  module Navigation
    def path(*args)
      raise MissingPath, "You need to override #path in #{self.class}"
    end

    def prefix
      ''
    end

    def visit
      source.visit prefix + path
      self
    end
  end
end

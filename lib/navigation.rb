module CapybaraPageObject
  module Navigation
    def path(*args)
      raise MissingPath, "You need to override this"
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

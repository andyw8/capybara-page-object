module CapybaraPageObject
  class Base
    include Extractors::Common
    include Extractors::PageLevel

    attr_accessor :source

    def initialize(source=nil)
      source ||= Capybara.current_session
      @source = source
    end

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

  class MissingPath < RuntimeError
  end
end

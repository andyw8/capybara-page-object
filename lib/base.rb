module CapybaraPageObject
  class Base
    include Extractors::Common

    attr_accessor :source

    def initialize(source=nil)
      source ||= Capybara.current_session
      @source = source
    end

    def path(*args)
      raise PageObjectMissingPath, "You need to override this"
    end

    def visit
      source.visit path
    end
  end

  class MissingPath < RuntimeError
  end
end
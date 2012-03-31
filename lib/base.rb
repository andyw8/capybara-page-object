module CapybaraPageObject
  class Base
    include Extractors::Common
    include Extractors::PageLevel

    attr_accessor :source

    def initialize(source=nil)
      source ||= Capybara.current_session
      @source = source
    end

    def self.from_string(string)
      new(Capybara.string(string))
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
    
    def respond_to?(sym)
       source.respond_to?(sym) || super(sym)
     end

    def method_missing(sym, *args, &block)
      if source.respond_to?(sym)
        source.send(sym)
      else
        super(sym, *args, &block)
      end
    end
  end

  class MissingPath < RuntimeError
  end
end

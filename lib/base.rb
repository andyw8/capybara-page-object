module CapybaraPageObject
  class Base
    include Extractors::Common

    attr_accessor :source

    def initialize(source)
      @source = source
    end
  end
end

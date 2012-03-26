require File.dirname(__FILE__) + '/base'

module CapybaraPageObject
  class Page < CapybaraPageObject::Base
    include Extractors::PageLevel

    def initialize(source)
      if source
        @source = source
      else
        @source = Capybara.current_session
      end
    end
  end
end

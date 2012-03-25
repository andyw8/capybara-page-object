require_relative 'base'

module CapybaraPageObject
  class Image < CapybaraPageObject::Base
    def src
      source.find('img')[:src]
    end

    def alt
      source.find('img')[:alt].strip
    end
  end
end

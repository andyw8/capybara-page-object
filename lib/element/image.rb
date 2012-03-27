module CapybaraPageObject
  class Image < CapybaraPageObject::Base
    # FIXME must be something better than source.find
    def src
      source.find('img')[:src]
    end

    def alt
      source.find('img')[:alt].strip
    end
  end
end

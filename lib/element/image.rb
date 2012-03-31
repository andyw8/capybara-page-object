module CapybaraPageObject
  class Image < CapybaraPageObject::Base
    def alt
      source.find('img')[:alt].strip
    end
    
    def key
      alt
    end
  end
end

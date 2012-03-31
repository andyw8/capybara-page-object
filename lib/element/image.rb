module CapybaraPageObject
  class Image < CapybaraPageObject::Page
    def alt
      source.find('img')[:alt].strip
    end
    
    def key
      alt
    end
  end
end

module CapybaraPageObject
  class Image < CapybaraPageObject::Node
    def alt
      find('img')[:alt].strip
    end
    
    def key
      alt
    end
  end
end

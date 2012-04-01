module CapybaraPageObject
  class Image < CapybaraPageObject::Node
    
    def element_name
      'img'
    end
    
    def alt
      root_node[:alt].strip
    end
    
    def key
      alt
    end
  end
end

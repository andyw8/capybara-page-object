module CapybaraPageObject
  class Image < CapybaraPageObject::Node
    
    def element_names
      ['img']
    end
    
    def alt
      root_node[:alt].strip
    end
    
    def key
      alt
    end
    
    def value
      URI(root_node[:src])
    end
  end
end

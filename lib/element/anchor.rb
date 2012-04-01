module CapybaraPageObject
  class Anchor < CapybaraPageObject::Node
    
    def element_names
      ['a']
    end
    
    def href
      root_node[:href]
    end
    
    def uri
      URI(href)
    end
  end
end

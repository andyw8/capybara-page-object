module CapybaraPageObject
  class Anchor < CapybaraPageObject::Node
    def element_names
      ['a']
    end
    
    def link
      URI(root_node[:href])
    end
  end
end

module CapybaraPageObject
  class Select < CapybaraPageObject::Node
    
    def element_names
      ['select']
    end
    
    def key
      root_node[:name]
    end

    def value
      root_node.value
    end
  end
end

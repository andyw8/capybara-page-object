module CapybaraPageObject
  class Meta < CapybaraPageObject::Node
    
    def element_name
      'meta'
    end
    
    def key
      root_node[:name]
    end
    
    def value
      root_node[:content]
    end
  end
end

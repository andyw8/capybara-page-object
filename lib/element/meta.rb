module CapybaraPageObject
  class Meta < CapybaraPageObject::Node
    
    def element_names
      ['meta']
    end
    
    def key
      root_node[:name]
    end
    
    def value
      root_node[:content]
    end
  end
end

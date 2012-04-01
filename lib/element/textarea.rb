module CapybaraPageObject
  class Textarea < CapybaraPageObject::Node
    
    def element_names
      ['textarea']
    end
    
    def key
      root_node[:name]
    end
    
    def value
      text
    end
  end
end

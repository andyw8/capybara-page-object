module CapybaraPageObject
  class List < CapybaraPageObject::Node
    
    # TODO what about OL, DL ?
    def element_names
      ['ul', 'ol']
    end

    def child_node
      'li'
    end
    
    def items(*args)
      children(*args)
    end
    
    def key
      root_node[:id]
    end
  end
end

module CapybaraPageObject
  class List < CapybaraPageObject::Node
    
    # TODO what about DL ?
    def element_names
      ['ul', 'ol']
    end

    def child_node
      'li'
    end
    
    def items(*args)
      children(*args)
    end
  end
end

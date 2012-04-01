module CapybaraPageObject
  class List < CapybaraPageObject::Node
    
    # TODO what about OL, DL ?
    def element_name
      'ul'
    end
    
    def child_node
      'li'
    end
    
    def items(opts={})
      factory = opts[:factory]
      if factory
        r = []
        all(child_node).each do |li|
          r << factory.new(li)
        end
        r
      else
        all child_node
      end
    end
    
    def key
      root_node[:id]
    end
  end
end

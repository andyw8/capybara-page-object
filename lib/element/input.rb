module CapybaraPageObject
  class Input < CapybaraPageObject::Node

    CHECKABLE = ['radio', 'checkbox']

    def element_names
      ['input']
    end

    def blank?
      '' == value
    end
    
    # TODO find a way to delegate this
    def value
      root_node.value
    end

    def checkable?
      type = root_node[:type]
      type && CHECKABLE.include?(type)
    end
  end
end

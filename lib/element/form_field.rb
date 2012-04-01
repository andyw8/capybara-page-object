module CapybaraPageObject
  class FormField < CapybaraPageObject::Node

    CHECKABLE = ['radio', 'checkbox']
    BUTTON_TYPES = ['submit', 'reset', 'button']

    def key
      root_node[:name]
    end

    def element_names
      ['input', 'select', 'textarea']
    end

    def blank?
      '' == value
    end

    def value
      if root_node.native.name == 'textarea'
        root_node.text
      else
        root_node.value
      end
    end

    def checkable?
      type = root_node[:type]
      type && CHECKABLE.include?(type)
    end
    
    def untyped?
      root_node[:type].nil?
    end
    
    def typed?
      !untyped?
    end
    
    def button?
      typed? && BUTTON_TYPES.include?(root_node[:type])
    end
  end
end

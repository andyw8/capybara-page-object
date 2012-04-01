module CapybaraPageObject
  class FormField < CapybaraPageObject::Node

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
  end
end

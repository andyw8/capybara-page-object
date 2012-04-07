module CapybaraPageObject
  class FormField < CapybaraPageObject::Node

    def element_names
      ['input', 'select', 'textarea']
    end

    def key
      root_node[:name]
    end

    def value
      root_node.value
    end

    def blank?
      value.nil? || '' == value
    end
  end
end

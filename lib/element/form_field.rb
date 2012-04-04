module CapybaraPageObject
  class FormField < CapybaraPageObject::Node

    def key
      root_node[:name]
    end

    def element_names
      ['input', 'select', 'textarea']
    end

    def blank?
      value.nil? || '' == value
    end

    def value
      root_node.value
    end
  end
end

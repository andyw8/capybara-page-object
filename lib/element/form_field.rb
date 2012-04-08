module CapybaraPageObject
  class FormField < CapybaraPageObject::Node
    def key
      source[:name]
    end

    def value
      source.value
    end

    def blank?
      value.nil? || '' == value
    end
  end
end

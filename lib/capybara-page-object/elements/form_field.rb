module CapybaraPageObject
  class FormField < CapybaraPageObject::Element
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

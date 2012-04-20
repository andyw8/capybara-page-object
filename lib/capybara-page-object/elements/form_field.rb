module CapybaraPageObject
  class FormField < CapybaraPageObject::Element
    field(:key) { source[:name] }
    field(:value) { source.value }

    def blank?
      value.nil? || '' == value
    end
  end
end

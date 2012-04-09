module CapybaraPageObject
  class Textarea < CapybaraPageObject::Element
    include TextBasedInput
    def blank?
      '' == text
    end
  end
end

require 'element/text_based_input'

module CapybaraPageObject
  class Textarea < CapybaraPageObject::Node
    include TextBasedInput
    def blank?
      '' == text
    end
  end
end

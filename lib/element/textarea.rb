require 'element/text_based_input'

module CapybaraPageObject
  class Textarea < CapybaraPageObject::Node
    include TextBasedInput
    
    def element_names
      ['textarea']
    end

    def blank?
      '' == text
    end
  end
end

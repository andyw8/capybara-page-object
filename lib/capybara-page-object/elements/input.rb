# -*- encoding : utf-8 -*-
module CapybaraPageObject
  class Input < CapybaraPageObject::FormField  
    include TextBasedInput
    
    BUTTON_TYPES = ['submit', 'reset', 'button']
    CHECKABLE_TYPES = ['radio', 'checkbox']

    # TODO this doesn't belong here
    def checked?
      source.checked?
    end

    def untyped?
      source[:type].nil?
    end

    def button?
      BUTTON_TYPES.include?(source[:type])
    end

    def checkable?
      type = source[:type]
      type && CHECKABLE_TYPES.include?(type)
    end
  end
end

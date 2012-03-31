module CapybaraPageObject
  class Input < CapybaraPageObject::Base

    CHECKABLE = ['radio', 'checkbox']

    def blank?
      '' == value
    end
    
    # TODO find a way to delegate this
    def value
      source.find('input').value
    end

    def checkable?
      type = find('input')[:type]
      type && CHECKABLE.include?(type)
    end
  end
end

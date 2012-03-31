module CapybaraPageObject
  class Input < CapybaraPageObject::Node

    CHECKABLE = ['radio', 'checkbox']

    def blank?
      '' == value
    end
    
    # TODO find a way to delegate this
    def value
      find('input').value
    end

    def checkable?
      type = find('input')[:type]
      type && CHECKABLE.include?(type)
    end
  end
end

module CapybaraPageObject
  class Input < CapybaraPageObject::Base

    CHECKABLE = ['radio', 'checkbox']

    # TODO shouldn't need this forwarding
    def value
      find('input').value
    end

    def blank?
      '' == value
    end

    def checkable?
      type = find('input')[:type]
      type && CHECKABLE.include?(type)
    end
  end
end

module CapybaraPageObject
  class Input < CapybaraPageObject::Base
    # TODO shouldn't need this forwarding
    def value
      find('input').value
    end
    
    def blank?
      '' == value
    end
  end
end

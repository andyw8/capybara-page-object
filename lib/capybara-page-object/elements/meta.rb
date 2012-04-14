module CapybaraPageObject
  class Meta < CapybaraPageObject::Element
    def key
      source[:name]
    end
    
    def value
      source[:content]
    end
  end
end

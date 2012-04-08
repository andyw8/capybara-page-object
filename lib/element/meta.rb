module CapybaraPageObject
  class Meta < CapybaraPageObject::Node
    def key
      source[:name]
    end
    
    def value
      source[:content]
    end
  end
end

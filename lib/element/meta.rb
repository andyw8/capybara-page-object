module CapybaraPageObject
  class Meta < CapybaraPageObject::Node
    def key
      find('meta')[:name]
    end
    
    def value
      find('meta')[:content]
    end
  end
end

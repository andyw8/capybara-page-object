module CapybaraPageObject
  class Meta < CapybaraPageObject::Node
    def key
      source.find('meta')[:name]
    end
    
    def value
      source.find('meta')[:content]
    end
  end
end

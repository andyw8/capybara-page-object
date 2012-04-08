module CapybaraPageObject
  class Select < CapybaraPageObject::Node
    def key
      source[:name]
    end

    def value
      source.value
    end
  end
end

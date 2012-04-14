module CapybaraPageObject
  class List < CapybaraPageObject::Element
    def items(*args)
      all('li').map { |e| ListItem.new(e) }
    end
  end
end

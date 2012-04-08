module CapybaraPageObject
  class List < CapybaraPageObject::Node
    def items(*args)
      all('li').map { |e| ListItem.new(e) }
    end
  end
end

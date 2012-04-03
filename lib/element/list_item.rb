module CapybaraPageObject
  class ListItem < CapybaraPageObject::Node
    def element_names
      ['li']
    end
  end
end

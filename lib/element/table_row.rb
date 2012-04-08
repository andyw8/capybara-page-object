module CapybaraPageObject
  class TableRow < CapybaraPageObject::Node
    def element_names
      ['tr']
    end
  end
end

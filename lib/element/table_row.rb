module CapybaraPageObject
  class TableRow < CapybaraPageObject::Node
    def header?
      source.all('th').any?
    end
  end
end

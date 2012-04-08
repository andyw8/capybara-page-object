module CapybaraPageObject
  class ListItem < CapybaraPageObject::Node
    def text
      source.text.strip
    end
  end
end

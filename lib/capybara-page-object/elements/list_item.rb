# -*- encoding : utf-8 -*-
module CapybaraPageObject
  class ListItem < CapybaraPageObject::Element
    def text
      source.text.strip
    end
  end
end

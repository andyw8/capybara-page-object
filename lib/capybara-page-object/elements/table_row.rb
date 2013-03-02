# -*- encoding : utf-8 -*-
module CapybaraPageObject
  class TableRow < CapybaraPageObject::Element
    def header?
      source.all('th').any?
    end
  end
end

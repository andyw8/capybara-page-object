# -*- encoding : utf-8 -*-
module CapybaraPageObject
  class Meta < CapybaraPageObject::Element
    field(:key) { source[:name] }
    field(:value) { source[:content] }
  end
end

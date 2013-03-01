# -*- encoding : utf-8 -*-
module CapybaraPageObject
  module Collections
    def key
      source[:id]
    end

    def value
      text
    end
  end
end

module CapybaraPageObject
  class Anchor < CapybaraPageObject::Element
    def link
      source[:href]
    end

    def uri
      URI link
    end
  end
end

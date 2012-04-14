module CapybaraPageObject
  class Anchor < CapybaraPageObject::Element
    def link
      URI(source[:href])
    end
  end
end

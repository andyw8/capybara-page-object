module CapybaraPageObject
  class Anchor < CapybaraPageObject::Node
    def link
      URI(source[:href])
    end
  end
end

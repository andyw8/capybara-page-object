module CapybaraPageObject
  class Anchor < CapybaraPageObject::Element
    field(:link) { source[:href] }
    field(:uri) { URI link }
  end
end

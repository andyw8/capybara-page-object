module CapybaraPageObject
  class Image < CapybaraPageObject::Element
    field(:key) { alt }
    field(:value) { URI(source[:src]) }
    field(:alt){ source[:alt].strip }
  end
end

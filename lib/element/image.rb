module CapybaraPageObject
  class Image < CapybaraPageObject::Node
    def key
      alt
    end

    def value
      URI(source[:src])
    end

    def alt
      source[:alt].strip
    end
  end
end

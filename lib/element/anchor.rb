module CapybaraPageObject
  class Anchor < CapybaraPageObject::Node
    # FIXME must be something better than source.find
    def href
      source.find('a')[:href]
    end
    
    def uri
      URI(href)
    end
  end
end

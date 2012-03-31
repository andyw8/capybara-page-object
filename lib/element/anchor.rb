module CapybaraPageObject
  class Anchor < CapybaraPageObject::Node
    # FIXME must be something better than finding each element
    def href
      find('a')[:href]
    end
    
    def uri
      URI(href)
    end
  end
end

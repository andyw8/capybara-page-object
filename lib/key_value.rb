module CapybaraPageObject
  module Collections
    def key
      # TODO this is ugly
      source.find('body').native.children.first.attributes['id'].value
    end

    def value
      source.text
    end
  end
end

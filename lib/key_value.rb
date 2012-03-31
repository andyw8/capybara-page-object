module CapybaraPageObject
  module Collections
    def key
      # TODO this is ugly
      find('body').native.children.first.attributes['id'].value
    end

    def value
      text
    end
  end
end

module CapybaraPageObject
  module Collections
    def key
      element_names.each do |element_name|
        return source.find(element_name)[:id] if source.has_css?(element_name)
      end
      return source.native[:id] # TODO this is dodgy?
    end

    def value
      text
    end
  end
end

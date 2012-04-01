module CapybaraPageObject
  module Collections
    def key
      root_node[:id]
    end

    def value
      text
    end
  end
end

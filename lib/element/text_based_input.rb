# TODO where should this file be?
module CapybaraPageObject
  module TextBasedInput
    def clear!
      source.fill_in key, :with => ''
    end

    def value=(value)
      source.fill_in key, :with => value
    end

    def key
      root_node[:name]
    end
  end
end

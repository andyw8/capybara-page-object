# -*- encoding : utf-8 -*-
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
      source[:name]
    end
  end
end

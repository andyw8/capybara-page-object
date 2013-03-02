# -*- encoding : utf-8 -*-
module CapybaraPageObject
  module HTML5Data
    def data
      source.native.attributes.each_with_object({}) do |(k, v), hash|
        next unless k.start_with?('data-')
        hash[k.gsub('data-', '')] = v.value
      end
    end
  end
end

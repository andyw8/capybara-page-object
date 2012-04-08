module CapybaraPageObject
  module HTML5Data
    def data
      r = {}
      
      source.native.attributes.each do |k, v|
        next unless k.start_with?('data-')
        r[k.gsub('data-', '')] = v.value
      end
      r
    end
  end
end

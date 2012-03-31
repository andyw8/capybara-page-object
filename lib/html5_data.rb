module CapybaraPageObject
  module HTML5Data
    def data
      r = {}
      if native.respond_to?(:attributes)
        native.attributes.each do |k, v|
          next unless k.start_with?('data-')
          r[k.gsub('data-', '')] = v.value
        end
      end
      r      
    end
  end
end

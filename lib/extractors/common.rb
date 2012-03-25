module Extractors
  
  module Common
    def extract(element, attr={}, page_object_class=nil)
      by = attr[:by]
      keys = attr[:keys]
      if keys
        r = []
        all(element).each do |t|
          r << t[keys]
        end
        r
      elsif by
        r = {}
        all(element).each do |t|
          if page_object_class
            r[t[by]] = page_object_class.new(t)
          else
            r[t[by]] = t
          end
        end
        r
      else
        if page_object_class
          all(element).collect{ |e| page_object_class.new(e) }
        else
          all(element).collect
        end
      end
    end
    
    def data
      r = {}
      native.attributes.each do |k, v|
        next unless k.start_with?('data-')
        r[k.gsub('data-', '')] = v.value
      end
      r      
    end
  
    def all(*args)
      source.all(*args)
    end
  
    def find(*args)
      source.find(*args)
    end
    
  end
end
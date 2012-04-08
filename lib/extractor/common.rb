module Extractor
  
  # TODO get rid of extract
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

    # TODO use method_missing o handle these?
    def all(*args)
      source.all(*args)
    end
  
    def find(*args)
      source.find(*args)
    end
    
  end
end
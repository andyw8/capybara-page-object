module Extractor  
  module Common
    # TODO why doesn't method_missing work?
    def all(*args)
      source.all(*args)
    end
  
    def find(*args)
      source.find(*args)
    end
  end
end
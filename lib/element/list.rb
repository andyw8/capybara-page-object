module CapybaraPageObject
  class List < CapybaraPageObject::Base
    def items(opts={})
      factory = opts[:factory]
      if factory
        r = []
        all('li').each do |li|
          r << factory.new(li)
        end
        r
      else
        all('li')
      end
    end
  end
end

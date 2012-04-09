module CapybaraPageObject
  class Form < CapybaraPageObject::Element
    def fields
      r = {}
      r.merge! inputs
      r.merge! selects
      r.merge! textareas
    end

    def buttons
      r = []
      all('input').each do |element|
        input = Input.new(element)
        next unless input.button?
        r << element
      end
      all('button').each do |button|
        r << button
      end
      r
    end

    def respond_to?(sym)
      fields.has_key?(sym.to_s) || super(sym)
    end

    def method_missing(sym, *args, &block)
      return fields[sym.to_s] if fields.has_key?(sym.to_s)
      super(sym, *args, &block)
    end
    
    private
    
    def inputs
      all('input').each_with_object do |input_tag, hash|
        input = Input.new(input_tag)
        next if input.button?
        if input.checkable?
          hash[input.key] = !! input.checked?
        else
          hash[input.key] = input_tag.value
        end
      end
    end

    def textareas
      all('textarea').inject({}) do |result, element|
        textarea = Textarea.new(element)
        result.merge textarea.key => textarea.value
      end
    end

    def selects
      all('select').inject({}) do |result, element|
        select = Select.new(element)
        result.merge select.key => select.value
      end
    end
  end
end

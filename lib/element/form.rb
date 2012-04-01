module CapybaraPageObject
  class Form < CapybaraPageObject::Node
    
    CHECKABLE = ['radio', 'checkbox']

    def fields
      r = {}
      r.merge! inputs
      r.merge! selects
      r.merge! textareas
    end

    def buttons
      r = []
      all('input').each do |input_tag|
        input = FormField.new(input_tag)
        next unless input.button?
        r << input_tag
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
      r = {}
      all('input').each do |input_tag|
        input = CapybaraPageObject::FormField.new(input_tag)
        next if input.button?
        if input.checkable?
          r[input.key] = !! input.checked?
        else
          r[input.key] = input_tag.value
        end
      end
      r
    end

    def textareas
      all('textarea').inject({}) do |result, textarea|
        result.merge textarea[:name] => textarea.value
      end
    end
    
    def selects
      all('select').inject({}) do |result, select|
        result.merge select[:name] => select.value
      end
    end
  end
end


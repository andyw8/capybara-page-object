module CapybaraPageObject
  class Form < CapybaraPageObject::Node

    def fields
      r = {}
      r.merge! inputs
      r.merge! selects
      r.merge! textareas
    end

    def buttons
      r = []
      all('input').each do |element|
        form_field = FormField.new(element)
        next unless form_field.button?
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
      r = {}
      all('input').each do |input_tag|
        form_field = FormField.new(input_tag)
        next if form_field.button?
        if form_field.checkable?
          r[form_field.key] = !! form_field.checked?
        else
          r[form_field.key] = input_tag.value
        end
      end
      r
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
        # TODO why is select.value not working here?
        result.merge select.key => element.value
      end
    end
  end
end

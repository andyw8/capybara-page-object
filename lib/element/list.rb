module CapybaraPageObject
  class List < CapybaraPageObject::Node
    
    # TODO what about DL ?
    def element_names
      ['ul', 'ol']
    end

    def items(*args)
      all('li').map { |e| ListItem.new(e) }
    end
  end
end

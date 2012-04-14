module CapybaraPageObject
  class Head < CapybaraPageObject::Element
    def title
      find('title').text
    end

    def meta_description
      find('meta[@name="description"]')['content']
    end

    def meta_keywords
      find('meta[@name="keywords"]')['content'].split(',').collect(&:strip)
    end
  end
end
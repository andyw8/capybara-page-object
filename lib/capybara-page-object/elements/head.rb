# -*- encoding : utf-8 -*-
module CapybaraPageObject
  class Head < CapybaraPageObject::Element
    field(:title) { find('title').text }
    field(:meta_description) { find('meta[@name="description"]')['content'] }
    field(:meta_keywords) { find('meta[@name="keywords"]')['content'].split(',').collect(&:strip) }
  end
end

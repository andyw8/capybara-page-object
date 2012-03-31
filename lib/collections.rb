module CapybaraPageObject
  module Collections
    def tables(attr={})
      extract('table', attr, CapybaraPageObject::Table)
    end

    def forms(attr={})
      extract('form', attr)
    end
  end
end
module CapybaraPageObject
  module Collections
    def tables(attr={})
      all('table').each_with_object({}) do |e, hash|
        t = CapybaraPageObject::Table.new(e)
        hash[t.key] = t
      end
    end

    def forms(attr={})
      all('form').each_with_object({}) do |e, hash|
        f = CapybaraPageObject::Form.new(e)
        hash[f.key] = f
      end
    end
  end
end

module CapybaraPageObject
  class Table < CapybaraPageObject::Node
    def rows
      all('tr').each_with_object({}) do |e, hash|
        tr = CapybaraPageObject::TableRow.new(e)
        hash[tr.key] = tr
      end
    end

    def headers
      all('th').each_with_object({}) do |e, hash|
        th = CapybaraPageObject::TableHeader.new(e)
        hash[th.key] = th
      end
    end
  end
end

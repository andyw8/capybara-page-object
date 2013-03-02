# -*- encoding : utf-8 -*-
require 'spec_helper'

describe "CapybaraPageObject::TableRow" do
  context "#header?" do
    it "return true if the row contains a header cell" do
      html = "<tr><th>a</th><td>b</td></tr>"
      row = CapybaraPageObject::TableRow.from_string html, 'tr'
      row.header?.should be_true
    end
  end

  context "#header?" do
    it "returns false if the row contains no header cells" do
      html = "<tr><td>a</td><td>b</td></tr>"
      row = CapybaraPageObject::TableRow.from_string html, 'tr'
      row.header?.should be_false
    end
  end
end

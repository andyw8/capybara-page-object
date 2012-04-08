require 'helper'

describe "ListItem" do
  before do
    s = <<-EOF
    <li id="foo">
      <span class="description">iPhone</span>
      <span class="price">$500</span>
    </li>
    EOF
    @list_item = CapybaraPageObject::ListItem.from_string s, 'li'
  end

  context "#text" do
    it "return the tag's innter HTML content stripped of whitespace" do
      @list_item.text.should == "iPhone\n      $500"
    end
  end
end

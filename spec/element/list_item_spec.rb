require 'helper'

describe "ListItem" do
  before do
    @list_item = CapybaraPageObject::ListItem.from_string <<-EOF
    <li id="foo">
      <span class="description">iPhone</span>
      <span class="price">$500</span>
    </li>
    EOF
  end

  # TODO better way of handling whitespace
  context "#text" do
    it "return the text of the list" do
      @list_item.text.strip.should == "iPhone\n      $500"
    end
  end
  
  context "#key" do
    it "return the id attribute" do
      @list_item.key.should == 'foo'
    end
  end
end

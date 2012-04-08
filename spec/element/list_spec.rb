require 'helper'

module CapybaraPageObject
  class MyListItem < CapybaraPageObject::Node
    def value
      find('.description').text.strip
    end
  end
end

describe "List" do
  before do
    html = <<-EOF
    <ul id="products">
      <li>
        <span class="description">iPhone</span>
        <span class="price">$500</span>
      </li>
      <li>
        <span class="description">iPad</span>
        <span class="price">$800</span>
      </li>
    </ul>
    EOF
    @list = CapybaraPageObject::List.from_string html, 'ul'
  end

  context "#items" do
    it "return the list items" do
      @list.should have(2).items
    end
  end

  context "#key" do
    it "be the id" do
      @list.key.should == 'products'
    end
    
    it "should handle ordered list (ol)" do
      list = CapybaraPageObject::List.from_string '<ol id="ordered"></ol>', 'ol'
      list.key.should == 'ordered'
    end
  end
end

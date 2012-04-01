require File.dirname(__FILE__) + '/../helper'

module CapybaraPageObject
  class MyListItem < CapybaraPageObject::Node
    def value
      find('.description').text.strip
    end
  end
end

describe "List" do
  before do
    @list = CapybaraPageObject::List.from_string <<-EOF
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
  end

  context "#items" do
    it "return the list items" do
      @list.should have(2).items
    end
    
    it "accept a custom list item object" do
      @list.items({:factory => CapybaraPageObject::MyListItem}).first.value.should == "iPhone"
    end
  end
  
  context "#key" do
    it "be the id" do
      @list.key.should == 'products'
    end
    
    it "should handle ordered list (ol)" do
      list = CapybaraPageObject::List.from_string '<ol id="ordered"></ol>'
      list.key.should == 'ordered'
    end
  end
end

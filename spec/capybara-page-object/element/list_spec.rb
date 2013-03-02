require 'spec_helper'

module CapybaraPageObject
  class MyListItem < CapybaraPageObject::Node
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
end

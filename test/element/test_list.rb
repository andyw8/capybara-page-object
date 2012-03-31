require File.dirname(__FILE__) + '/../helper'

module CapybaraPageObject
  class MyListItem < CapybaraPageObject::Base
    def value
      source.find('.description').text.strip
    end
  end
end

class TestList < Test::Unit::TestCase
  context "List" do
    setup do
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
      should "return the list items" do
        assert_equal 2, @list.items.size
      end
      
      should "accept a custom list item object" do
        assert_equal "iPhone", @list.items({:factory => CapybaraPageObject::MyListItem}).first.value
      end
    end
    
    context "#key" do
      should "be the id" do
        assert_equal 'products', @list.key
      end
    end
  end
end

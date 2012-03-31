require File.dirname(__FILE__) + '/helper'
require 'capybara'

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
      @list = load_fixture(CapybaraPageObject::List)
    end

    context "#items" do
      should "return the list items" do
        assert_equal 2, @list.items.size
      end
      
      should "accept a custom list item object" do
        assert_equal "iPhone", @list.items({:factory => CapybaraPageObject::MyListItem}).first.value
      end
    end
  end
end

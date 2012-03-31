require File.dirname(__FILE__) + '/../helper'
require 'capybara'

class TestListitem < Test::Unit::TestCase
  context "Listitem" do
    setup do
      @listitem = load_fixture(CapybaraPageObject::Listitem)
    end

    context "#text" do
      should "return the text of the list" do
        assert_equal "iPhone\n  $500", @listitem.text.strip
      end
    end
  end
end

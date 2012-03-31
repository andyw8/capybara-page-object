require File.dirname(__FILE__) + '/../helper'

class TestListitem < Test::Unit::TestCase
  context "Listitem" do
    setup do
      @listitem = CapybaraPageObject::Listitem.from_string <<-EOF
      <li>
        <span class="description">iPhone</span>
        <span class="price">$500</span>
      </li>
      EOF
    end

    # TODO better way of handling whitespace
    context "#text" do
      should "return the text of the list" do
        assert_equal "iPhone\n        $500", @listitem.text.strip
      end
    end
  end
end

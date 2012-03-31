require File.dirname(__FILE__) + '/../helper'

describe "Listitem" do
  before do
    @listitem = CapybaraPageObject::Listitem.from_string <<-EOF
    <li>
      <span class="description">iPhone</span>
      <span class="price">$500</span>
    </li>
    EOF
  end

  # TODO better way of handling whitespace
  context "#text" do
    it "return the text of the list" do
      @listitem.text.strip.should == "iPhone\n      $500"
    end
  end
end

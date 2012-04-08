require 'helper'

describe "Select" do
  before do
    @select = CapybaraPageObject::Select.from_string '<select name="foo"></select>', 'select'
  end
  
  it "can be instantiated" do
    @select.should_not be_nil
  end
end

require 'helper'

describe "Select" do
  before do
    @select = CapybaraPageObject::Select.from_string '<select name="foo"></select>', 'select'
  end

  context "#key" do
    it "returns the name attribute" do
      @select.key.should == 'foo'
    end
  end
  
  context "#value" do
    it "returns an single item for a non-multiple select" do
      html = <<-EOM
      <select name="colour">
        <option>red</option>
        <option selected>blue</option>
      </select>
      EOM
      s = CapybaraPageObject::Select.from_string html, 'select'
      s.value.should == 'blue'
    end
    
    it "returns an array for amultiple select" do
      html = <<-EOM
      <select name="countries" multiple>
        <option>france</option>
        <option selected>spain</option>
        <option selected>germany</option>
      </select>
      EOM
      s = CapybaraPageObject::Select.from_string html, 'select'
      s.value.should == ['spain', 'germany']
    end
  end
end

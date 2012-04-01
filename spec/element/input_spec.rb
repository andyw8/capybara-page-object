require File.dirname(__FILE__) + '/../helper'

describe "Input" do
  before do
    @input = CapybaraPageObject::Input.from_string '<input value="hello">'
  end

  it "value" do
    @input.value.should == 'hello'
  end

  it "blank" do
    @input.blank?.should_not be_true
  end

  it "checkable?" do
    checkbox = '<input type="checkbox">'
    radio = '<input type="radio">'
    text = '<input type="text">'
    none = '<input type="">'

    CapybaraPageObject::Input.from_string(checkbox).should be_checkable
    CapybaraPageObject::Input.from_string(radio).should be_checkable
    CapybaraPageObject::Input.from_string(text).should_not be_checkable
    CapybaraPageObject::Input.from_string(none).should_not be_checkable
  end
  
  context "#untyped" do
    it "returns true if the input has no type attribute" do
      input = CapybaraPageObject::Input.from_string '<input type="text">'
      input.should_not be_untyped
    end
    
    it "returns true if the input has no type attribute" do
      input = CapybaraPageObject::Input.from_string '<input>'
      input.should be_untyped
    end
  end
end

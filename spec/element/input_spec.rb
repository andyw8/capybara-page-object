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
end

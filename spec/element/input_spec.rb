require 'helper'

describe "Input" do
  context "#key" do
    it "return the name attribute" do
      i = CapybaraPageObject::Input.from_string '<input name="foo"/>'
      i.key.should == 'foo'
    end
  end

  context "#value" do
    it "returns the value attribute" do
      input = CapybaraPageObject::Input.from_string '<input value="foo">'
      input.value.should == 'foo'
    end
  end

  context "#clear!" do
    it "clears the value" do
      input = CapybaraPageObject::Input.from_string '<input name="foo" value="bar">'
      input.source.should_receive(:fill_in).with("foo", {:with => ''})
      input.clear!
    end
  end

  context "#value=(value)" do
    it "it allows the value to be set" do
      input = CapybaraPageObject::Input.from_string '<input name="foo" value="old_bar">'
      new_value = 'new_bar'
      input.source.should_receive(:fill_in).with("foo", {:with => new_value})
      input.value = new_value
    end
  end

  context "#untyped" do
    it "is true if the input has no type attribute" do
      input = CapybaraPageObject::Input.from_string '<input type="text">'
      input.should_not be_untyped
    end
    
    it "is true if the input has no type attribute" do
      input = CapybaraPageObject::Input.from_string '<input>'
      input.should be_untyped
    end
  end

  context "#checkable?" do
    it "is true for a checkbox" do
      checkbox = '<input type="checkbox">'
      CapybaraPageObject::Input.from_string(checkbox).should be_checkable
    end
    it "is true for a radio button" do
      radio = '<input type="radio">'
      CapybaraPageObject::Input.from_string(radio).should be_checkable
    end
    it "is false an input with a blank type" do
      none = '<input type="">'
      CapybaraPageObject::Input.from_string(none).should_not be_checkable
    end
    it "is false for other kinds of input" do
      text = '<input type="text">'
      CapybaraPageObject::Input.from_string(text).should_not be_checkable
    end
  end
end

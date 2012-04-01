require File.dirname(__FILE__) + '/../helper'

describe "FormField" do
  before do
    @input = CapybaraPageObject::FormField.from_string '<input value="hello">'
    @textarea = CapybaraPageObject::FormField.from_string '<textarea>foo</textarea>'
    @blank_textarea = CapybaraPageObject::FormField.from_string '<textarea></textarea>'
  end

  context "#value" do
    it "returns the value attribute if the form field is an input" do
      @input.value.should == 'hello'
    end
    it "returns the tag content if the form field is a textarea" do
      @textarea.value.should == 'foo'
    end
  end

  context "#blank" do
    it "is false if there is an input value" do
      @input.should_not be_blank
    end
    it "is false if there is textarea content" do
      @textarea.should_not be_blank
    end
    it "is true if there is no textarea content" do
      @blank_textarea.should be_blank
    end
  end

  context "#checkable?" do
    it "is true for a checkbox" do
      checkbox = '<input type="checkbox">'
      CapybaraPageObject::FormField.from_string(checkbox).should be_checkable
    end
    it "is true for a radio button" do
      radio = '<input type="radio">'
      CapybaraPageObject::FormField.from_string(radio).should be_checkable
    end
    it "is false an input with a blank type" do
      none = '<input type="">'
      CapybaraPageObject::FormField.from_string(none).should_not be_checkable
    end
    it "is false for other kinds of input" do
      text = '<input type="text">'
      CapybaraPageObject::FormField.from_string(text).should_not be_checkable
    end
  end

  context "#untyped" do
    it "is true if the input has no type attribute" do
      input = CapybaraPageObject::FormField.from_string '<input type="text">'
      input.should_not be_untyped
    end
    
    it "is true if the input has no type attribute" do
      input = CapybaraPageObject::FormField.from_string '<input>'
      input.should be_untyped
    end
  end
end

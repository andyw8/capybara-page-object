require File.dirname(__FILE__) + '/../helper'

describe "FormField" do
  before do
    @input = CapybaraPageObject::FormField.from_string '<input value="hello">'
    @textarea = CapybaraPageObject::FormField.from_string '<textarea>foo</textarea>'
    @blank_textarea = CapybaraPageObject::FormField.from_string '<textarea></textarea>'
  end

  context "#value" do
    it "delegates" do
      @input.value.should == 'hello'
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
end

require 'helper'

describe "FormField" do
  before do
    @input = CapybaraPageObject::FormField.from_string '<input name="greeting" value="hello">', 'input'
    @textarea = CapybaraPageObject::FormField.from_string '<textarea>foo</textarea>', 'textarea'
    @blank_textarea = CapybaraPageObject::FormField.from_string '<textarea></textarea>', 'textarea'
  end

  context "#key" do
    it "returns the name of the form field" do
      @input.key.should == 'greeting'
    end
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

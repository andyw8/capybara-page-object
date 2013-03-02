require 'spec_helper'

describe "Textarea" do
  before do
    @textarea = CapybaraPageObject::Textarea.from_string '<textarea name="foo">bar</textarea>', 'textarea'
    @blank_textarea = CapybaraPageObject::Textarea.from_string '<textarea name="foo"></textarea>', 'textarea'
  end

  context "#key" do
    it "returns the name attribute" do
      @textarea.key.should == 'foo'
    end
  end

  context "#value" do
    it "returns the content" do
      @textarea.value.should == 'bar'
    end
  end

  context "#blank?" do
    it "is false is there is content" do
      @textarea.should_not be_blank
    end
    it "is true if there is no content" do
      @blank_textarea.should be_blank
    end
  end
end

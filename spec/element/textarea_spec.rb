require File.dirname(__FILE__) + '/../helper'

describe "Textarea" do
  before do
    @textarea = CapybaraPageObject::Textarea.from_string '<textarea name="foo">bar</textarea>'
  end

  context "#key" do
    it "returns the name attribute" do
      @textarea.key.should == 'foo'
    end
  end
  
  context "#value" do
    it "return the content" do
      @textarea.value.should == 'bar'
    end
  end
end

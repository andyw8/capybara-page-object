require 'helper'

describe "Anchor" do
    
  before do
    @anchor = CapybaraPageObject::Anchor.from_string('<a href="hello.html">', 'a')
  end

  context "#link" do
    it "return the link" do
      @anchor.link.should == 'hello.html'
    end
  end

  context "#uri" do
    it "return the link as a URI" do
      @anchor.uri.should == URI('hello.html')
    end
  end
end

require 'helper'

describe "Anchor" do
    
  before do
    @anchor = CapybaraPageObject::Anchor.from_string('<a href="hello.html">', 'a')
  end

  context "#link" do
    it "return a URI object" do
      @anchor.link.class.should == URI::Generic
      @anchor.link.path.should == 'hello.html'
    end
  end
end

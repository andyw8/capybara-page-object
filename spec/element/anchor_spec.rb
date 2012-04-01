require File.dirname(__FILE__) + '/../helper'

describe "Anchor" do
    
  before do
    @anchor = CapybaraPageObject::Anchor.from_string '<a href="hello.html">'
  end

  context "#href" do
    it "return the href attribute" do
      @anchor.href.should == 'hello.html'
    end
  end

  context "#uri" do
    it "return a URI object" do
      @anchor.uri.class.should == URI::Generic
      @anchor.uri.path.should == 'hello.html'
    end
  end
end

require 'helper'

describe "Head" do
  context "#title" do
    it "returns the page title" do
      node = CapybaraPageObject::Head.from_string '<head><title>Hello World</title></head>'
      node.title.should == 'Hello World'
    end
  end

  context "#meta_description" do
    it "returns the meta description" do
      node = CapybaraPageObject::Head.from_string '<head><meta name="description" content="meta description"></head>'
      node.meta_description.should == "meta description"
    end
  end

  context "#meta_keywords" do
    it "returns the meta keywords as an array" do
      node = CapybaraPageObject::Head.from_string '<head><meta name="keywords" content="keyword 1, keyword 2"></head>'
      node.meta_keywords.should == ["keyword 1", "keyword 2"]
    end
  end
end

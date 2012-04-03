require 'helper'

describe "Page" do
  context "Using the example.html" do
    context "#title" do
      it "returns the page title" do
        node = CapybaraPageObject::Node.from_string '<title>Hello World</title>'
        node.title.should == 'Hello World'
      end
    end

    context "#meta_description" do
      it "returns the meta description" do
        node = CapybaraPageObject::Node.from_string '<meta name="description" content="meta description">'
        node.meta_description.should == "meta description"
      end
    end

    context "#meta_keywords" do
      it "returns the meta keywords as an array" do
        node = CapybaraPageObject::Node.from_string '<meta name="keywords" content="keyword 1, keyword 2">'
        node.meta_keywords.should == ["keyword 1", "keyword 2"]
      end
    end

    context "#classes" do
      it "returns an array of class names" do
        anchor = CapybaraPageObject::Anchor.from_string '<a class="foo bar">'
        anchor.classes.should =~ ['foo', 'bar']
      end
      it "handles extraneous spacing" do
        anchor = CapybaraPageObject::Anchor.from_string '<a class="  foo   bar  ">'
        anchor.classes.should =~ ['foo', 'bar']
      end
      it "returns an empty array classes is empty" do
        anchor = CapybaraPageObject::Anchor.from_string '<a class="  ">'
        anchor.classes.should be_empty
      end
      it "returns an empty array when the classes attribute is not present" do
        anchor = CapybaraPageObject::Anchor.from_string '<a/>'
        anchor.classes.should be_empty
      end
    end
  end
end

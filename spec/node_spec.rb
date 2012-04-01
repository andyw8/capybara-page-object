require File.dirname(__FILE__) + '/helper'

describe "Page" do
  context "Using the example.html" do
    before do
      @page = load_fixture(CapybaraPageObject::Node)
    end

    it "page title" do
      @page.title.should == 'Hello World'
    end

    it "meta_description" do
      @page.meta_description.should == "meta description"
    end

    it "meta_keywords" do
      @page.meta_keywords.should == ["meta keyword 1", "meta keyword 2"]
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
      it "returns an empty array classes attribute is not present" do
        anchor = CapybaraPageObject::Anchor.from_string '<a/>'
        anchor.classes.should be_empty
      end
    end

    context "#path" do
      it "raise exception if path not defined" do
        lambda do
          @page.path
        end.should raise_error(CapybaraPageObject::MissingPath)
      end
    end
  end
end

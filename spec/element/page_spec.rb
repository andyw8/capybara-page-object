require File.dirname(__FILE__) + '/../helper'

describe "Page" do
  context "Using the example.html" do
    before do
      @page = load_fixture(CapybaraPageObject::Page)
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

    context "#path" do
      it "raise exception if path not defined" do
        lambda do
          @page.path
        end.should raise_error(CapybaraPageObject::MissingPath)
      end
    end
  end
end

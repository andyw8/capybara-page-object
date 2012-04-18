require 'helper'

describe "Page" do
  before do
    html = File.open(File.dirname(__FILE__) + '/fixtures/node.html').read
    @page = CapybaraPageObject::Page.from_string html, 'body'
  end

  context "#tables" do
    it "returns a hash of Tables keyed by ID" do
      tables = @page.tables
      tables.keys.should =~ ['table_1', 'table_2']
      tables['table_1'].class.should == CapybaraPageObject::Table
    end
  end

  context "#forms" do
    it "returns a hash of Forms keyed by ID" do
      @page.forms.keys.should =~ ['form_1', 'form_2']
      @page.forms['form_1'].class.should == CapybaraPageObject::Form
    end
  end

  context "#data" do
    it "returns an empty hash if the element has no HTML5 data attributes" do
      html = '<div foo="bar"/>'
      @fragment = CapybaraPageObject::Element.from_string html, 'div'
      @fragment.data.should == {}
    end

    it "returns a hash of the elements HTML5 data attributes" do
      html = '<div id="data" data-foo="a" data-bar="b" data-cat>Some data</div>'
      @fragment = CapybaraPageObject::Element.from_string html, 'div'
      h = {'foo' => 'a', 'bar' => 'b', 'cat' => ''}
      @fragment.data.should == h 
    end
  end
end

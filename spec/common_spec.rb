require 'helper'

describe "Page" do
  before do
    html = File.open(File.dirname(__FILE__) + '/fixtures/node.html').read
    @page = CapybaraPageObject::Node.from_string html, 'body'
  end

  context "#tables" do
    it "returns a hash of Tables objects keyed by ID" do
      tables = @page.tables
      @page.tables.keys.should == ['table_1', 'table_2']
      tables['table_1'].class.should == CapybaraPageObject::Table
      tables['table_2'].class.should == CapybaraPageObject::Table
      # TODO: support @page.tables[:table_1] ? perhaps have a default_key override?
    end
  end

  context "#forms" do
    it "returns the ids for the forms" do
      @page.forms.keys.should =~ ['form_1', 'form_2']
    end
  end

  # it "return the elements as a hash" do
  #   @page.tables(:keys => 'id').should =~ ['table_1', 'table_2']
  #   @page.tables(:keys => 'class').should =~ ['table_1_class', 'table_2_class']
  # end

  context "#data" do
    it "returns an empty hash if the element has no HTML5 data attributes" do
      html = '<div foo="bar"/>'
      @fragment = CapybaraPageObject::Node.from_string html, 'div'
      @fragment.data.should == {}
    end

    it "returns a hash of the elements HTML5 data attributes" do
      html = '<div id="data" data-foo="a" data-bar="b" data-cat>Some data</div>'
      @fragment = CapybaraPageObject::Node.from_string html, 'div'
      h = {'foo' => 'a', 'bar' => 'b', 'cat' => ''}
      @fragment.data.should == h 
    end
  end
end

require File.dirname(__FILE__) + '/helper'

describe "Page" do
  before do
    html = File.open(File.dirname(__FILE__) + '/fixtures/node.html').read
    @page = CapybaraPageObject::Node.from_string html    
  end

  context "#tables" do
    it "returns an array of Table objects" do
      tables = @page.tables
      tables[0].class.should == CapybaraPageObject::Table
      tables[0].class.should == CapybaraPageObject::Table
    end

    it "returns a hash of Tables keyed by id" do
      tables = @page.tables(:by => 'id')
      tables['table_1'].class.should == CapybaraPageObject::Table
      tables['table_2'].class.should == CapybaraPageObject::Table
      # TODO: support @page.tables[:table_1] ? perhaps have a default_key override?
    end
  end

  context "#forms" do
    it "returns the ids for the forms" do
      @page.forms(:keys => 'id').should =~ ['form_1', 'form_2']
    end
  end

  it "return the elements as a hash" do
    @page.tables(:keys => 'id').should =~ ['table_1', 'table_2']
    @page.tables(:keys => 'class').should =~ ['table_1_class', 'table_2_class']
  end

  context "#data" do
    it "returns an empty hash if the element has no HTML5 data attributes" do
      e = Capybara.string('<foo/>')
      e.data.should == {}
    end

    it "returns a hash of the elements HTML5 data attributes" do
      h = {'foo' => 'a', 'bar' => 'b', 'cat' => ''}
      @page.find('#data').data.should == h 
    end
  end
end

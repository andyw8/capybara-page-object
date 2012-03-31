require File.dirname(__FILE__) + '/helper'
require 'capybara'

describe "Using the example.html" do
  before do
    @page = load_fixture(CapybaraPageObject::Page)
  end

  it "tables" do
    tables = @page.tables
    tables[0].class.should == CapybaraPageObject::Table
    tables[0].class.should == CapybaraPageObject::Table
  end

  it "tables by id" do
    tables = @page.tables(:by => 'id')
    tables['table_1'].class.should == CapybaraPageObject::Table
    tables['table_2'].class.should == CapybaraPageObject::Table
    # TODO: support @page.tables[:table_1] ? perhaps have a default_key override?
  end

  it "forms" do
    @page.forms(:keys => 'id').should =~ ['form_1', 'form_2']
  end

  it "return the elements as a hash" do
    @page.tables(:keys => 'id').should =~ ['table_1', 'table_2']
    @page.tables(:keys => 'class').should =~ ['table_1_class', 'table_2_class']
  end

  it "data" do
    h = {'foo' => 'a', 'bar' => 'b', 'cat' => ''}
    @page.find('#data').data.should == h 
  end
end

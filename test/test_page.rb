require File.dirname(__FILE__) + '/helper'
require 'capybara'

class TestCapybaraPageObject < Test::Unit::TestCase

  context "Using the example.html" do

    setup do
      @page = load_sample_into_model(CapybaraPageObject::Page)
    end

    should "page title" do
      assert_equal 'Hello World', @page.title
    end
    
    should "tables" do
      tables = @page.tables
      assert_equal CapybaraPageObject::Table, tables[0].class
      assert_equal CapybaraPageObject::Table, tables[0].class
    end

    should "tables by id" do
      tables = @page.tables(:by => 'id')
      assert_equal CapybaraPageObject::Table, tables['table_1'].class
      assert_equal CapybaraPageObject::Table, tables['table_2'].class
    end

    should "forms" do
      assert_equal ['form_1', 'form_2'], @page.forms(:keys => 'id')
    end

    should "meta_description" do
      assert_equal "meta description", @page.meta_description
    end

    should "meta_keywords" do
      assert_equal ["meta keyword 1", "meta keyword 2"], @page.meta_keywords
    end

    should "return the elements as a hash" do
      assert_same_elements ['table_1', 'table_2'], @page.tables(:keys => 'id')
      assert_same_elements ['table_1_class', 'table_2_class'], @page.tables(:keys => 'class')
    end

    should "data" do
      h = {'foo' => 'a', 'bar' => 'b', 'cat' => ''}
      assert_equal h, @page.find('#data').data
    end

    context "#path" do
      should "raise exception if path not defined" do
        assert_raise CapybaraPageObject::MissingPath do
          @page.path
        end
      end
    end

  end
end

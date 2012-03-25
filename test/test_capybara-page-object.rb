require_relative 'helper'
require 'capybara'

class TestCapybaraPageObject < Test::Unit::TestCase

  context "Using the example.html" do

    setup do
      html = File.open(File.dirname(__FILE__) + '/example.html').read
      @doc = Capybara.string(html)
    end

    should "page title" do
      assert_equal 'Hello World', @doc.title
    end

    should "tables" do
      assert_same_elements ['table_1', 'table_2'], @doc.tables.collect{ |t| t[:id] }
    end

    should "rows" do
      assert_same_elements ['table_1_tr_1', 'table_1_tr_2'], @doc.tables.first.rows.collect{ |t| t[:id] }
    end

    should "headers" do
      assert_same_elements ["table_1_th_1", "table_1_th_2"], @doc.tables.first.headers.collect{ |t| t[:id] }
    end

    should "forms" do
      assert_equal ['form_1', 'form_2'], @doc.forms.collect{ |f| f[:id] }
    end

    should "meta_description" do
      assert_equal "meta description", @doc.meta_description
    end

    should "meta_keywords" do
      assert_equal ["meta keyword 1", "meta keyword 2"], @doc.meta_keywords
    end

    should "return the elements as a hash" do
      assert_same_elements ['table_1', 'table_2'], @doc.tables(:by => 'id').keys
      assert_same_elements ['table_1_class', 'table_2_class'], @doc.tables(:by => 'class').keys
    end

    should "data" do
      h = {'foo' => 'a', 'bar' => 'b', 'cat' => ''}
      assert_equal h, @doc.find('#data').data
    end

  end
end

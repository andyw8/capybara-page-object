require File.dirname(__FILE__) + '/helper'
require 'capybara'

class TestCapybaraPageObject < Test::Unit::TestCase

  context "Using the example.html" do

    setup do
      @page = load_fixture(CapybaraPageObject::Page)
    end

    should "page title" do
      assert_equal 'Hello World', @page.title
    end

    should "meta_description" do
      assert_equal "meta description", @page.meta_description
    end

    should "meta_keywords" do
      assert_equal ["meta keyword 1", "meta keyword 2"], @page.meta_keywords
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

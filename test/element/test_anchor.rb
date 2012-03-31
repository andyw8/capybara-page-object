require File.dirname(__FILE__) + '/../helper'

class TestAnchor < Test::Unit::TestCase
  context "Anchor" do
    setup do
      @anchor = load_fixture(CapybaraPageObject::Anchor)
    end

    context "#href" do
      should "return the href attribute" do
        assert_equal 'hello.html', @anchor.href
      end
    end

    context "#uri" do
      should "return a URI object" do
        assert_equal URI::Generic, @anchor.uri.class
      end

      should "extract the URI components" do
        assert_equal 'hello.html', @anchor.uri.path
      end
    end
  end
end

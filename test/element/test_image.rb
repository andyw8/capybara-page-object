require File.dirname(__FILE__) + '/../helper'

class TestImage < Test::Unit::TestCase
  context "Image" do
    setup do
      @image = load_fixture(CapybaraPageObject::Image)
    end

    context "#alt" do
      should "return the alt tag with whitespace stripped" do
        assert_equal 'alt image', @image.alt
      end
    end
  end
end

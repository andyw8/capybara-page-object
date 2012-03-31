require File.dirname(__FILE__) + '/../helper'

class TestImage < Test::Unit::TestCase
  context "Image" do
    setup do
      @image = CapybaraPageObject::Image.from_string '<img src="image.jpg" alt="  alt image  ">'
    end

    context "#alt" do
      should "return the alt tag with whitespace stripped" do
        assert_equal 'alt image', @image.alt
      end
    end
    
    context "#key" do
      should "return the alt tag" do
        assert_equal 'alt image', @image.key
      end
    end
  end
end

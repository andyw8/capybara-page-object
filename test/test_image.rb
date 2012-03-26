require File.dirname(__FILE__) + '/helper'
require 'capybara'

class TestImage< Test::Unit::TestCase
  context "" do
    setup do
      @image = load_sample_into_model(CapybaraPageObject::Image)
    end

    should "src" do
      assert_equal 'image_1.jpg', @image.src
    end
    
    should "src" do
      assert_equal 'image 1', @image.alt
    end
    
  end

end

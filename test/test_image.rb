require File.dirname(__FILE__) + '/helper'
require 'capybara'

class TestImage < Test::Unit::TestCase
  context "" do
    setup do
      @image = load_fixture(CapybaraPageObject::Image)
    end

    should "src" do
      assert_equal 'image.jpg', @image.src
    end
    
    should "alt" do
      assert_equal 'alt image', @image.alt
    end
    
  end

end

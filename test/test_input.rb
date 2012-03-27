require File.dirname(__FILE__) + '/helper'
require 'capybara'

class TestTable < Test::Unit::TestCase
  context "" do
    setup do
      @input = load_fixture(CapybaraPageObject::Input)
    end
    
    should "value" do
      assert_equal 'hello', @input.value
    end
    
    should "value" do
      assert ! @input.blank?
    end
  end
end

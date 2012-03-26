require File.dirname(__FILE__) + '/helper'
require 'capybara'

class TestForm< Test::Unit::TestCase
  context "" do
    setup do
      @form = load_sample_into_model(CapybaraPageObject::Form)
    end
    
    should "action" do
      assert_equal '/hello', @form.action
    end
    
    should "fields" do
      f = {'input_1' => 'value_1', 'input_2' => 'value_2'}
      assert_equal f, @form.fields
    end

  end
end

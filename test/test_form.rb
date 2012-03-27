require File.dirname(__FILE__) + '/helper'
require 'capybara'

class TestForm < Test::Unit::TestCase
  context "" do
    setup do
      @form = load_fixture(CapybaraPageObject::Form)
    end

    should "buttons" do
      assert_equal 4, @form.buttons.size
    end

    should "fields" do
      f = {
        'input_1' => 'value_1',
        'input_2' => 'value_2',
        'colour' => 'blue',
        'essay' => 'hello world',
        'checkbox_1' => false,
        'checkbox_2' => true,
        'radio_button_1' => false,
        'radio_button_2' => true,
        'countries' => ['spain', 'germany']
      }
      assert_equal f, @form.fields
    end

    should "field access" do
      assert_equal 'hello world', @form.essay
    end
  end
end

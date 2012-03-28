require File.dirname(__FILE__) + '/helper'
require 'capybara'

class TestForm < Test::Unit::TestCase
  context "Form" do
    setup do
      @form = load_fixture(CapybaraPageObject::Form)
    end

    context "#buttons" do
      should "return the buttons contained in the form" do
        assert_equal 4, @form.buttons.size
      end
    end

    context "#fields" do
      should "return the fields contained in the form" do
        f = {
          'input_1' => 'value_1',
          'text_input' => 'text_input_value',
          'password_input' => 'password',
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
    end

    should "provide direct access to fields" do
      assert_equal 'hello world', @form.essay
    end
  end
end

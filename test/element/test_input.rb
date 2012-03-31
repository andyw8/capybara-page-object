require File.dirname(__FILE__) + '/../helper'

class TestInput < Test::Unit::TestCase
  context "" do
    setup do
      @input = CapybaraPageObject::Input.from_string '<input value="hello">'
    end

    should "value" do
      assert_equal 'hello', @input.value
    end

    should "blank" do
      assert ! @input.blank?
    end

    should "checkable?" do
      checkbox = '<input type="checkbox">'
      radio = '<input type="radio">'
      text = '<input type="text">'
      none = '<input type="">'

      assert CapybaraPageObject::Input.from_string(checkbox).checkable?
      assert CapybaraPageObject::Input.from_string(radio).checkable?
      assert ! CapybaraPageObject::Input.from_string(text).checkable?
      assert ! CapybaraPageObject::Input.from_string(none).checkable?
    end
  end
end

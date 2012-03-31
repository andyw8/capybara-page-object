require File.dirname(__FILE__) + '/../helper'

class TestForm < Test::Unit::TestCase
  context "Form" do
    setup do
      @form = CapybaraPageObject::Form.from_string <<-EOF
      <form>
        <input name="input_1" value="value_1">
        <input type="text" name="text_input" value="text_input_value">

        <input type="password" name="password_input" value="password">

        <select name="colour">
          <option>red</option>
          <option selected>blue</option>
        </select>

        <select name="countries" multiple>
          <option>france</option>
          <option selected>spain</option>
          <option selected>germany</option>
        </select>

        <textarea name="essay">hello world</textarea>
        <input type="checkbox" name="checkbox_1" value="checkbox_value_1">
        <input type="checkbox" name="checkbox_2" value="checkbox_value_2" checked>

        <input type="radio" name="radio_button_1" value="radio_value_1">
        <input type="radio" name="radio_button_2" value="radio_value_2" checked>

        <input type="submit" value="submit button"></input>
        <input type="reset" value="reset button"></input>
        <input type="button" value="button button"></input>
        <button>button 2</button>
      </form>
      EOF
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

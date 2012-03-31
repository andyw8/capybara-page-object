require File.dirname(__FILE__) + '/../helper'

class TestBase < Test::Unit::TestCase
  context "Base" do
    setup do
      @tag = CapybaraPageObject::Anchor.from_string '<foo id="bar">content</foo>'
    end

    context "#key" do
      should "default to the ID if not overridden" do
        assert_equal 'bar', @tag.key
      end
    end

    context "#value" do
      should "default to the text if not overridden" do
        assert_equal 'content', @tag.value
      end
    end
  end
end

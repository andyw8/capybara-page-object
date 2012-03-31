require File.dirname(__FILE__) + '/../helper'

class Meta < Test::Unit::TestCase
  context "Meta" do
    setup do
      @meta = CapybaraPageObject::Meta.from_string <<-EOF
      <meta name="description" content="my description">
      EOF
    end

    context "#key" do
      should "return the name from the meta tag" do
        assert_equal 'description', @meta.key
      end
    end
    
    context "#value" do
      should "return the description from the meta tag" do
        assert_equal 'my description', @meta.value
      end
    end
  end
end

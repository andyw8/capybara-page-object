require 'helper'

describe "Meta" do
  context "Meta" do
    before do
      @meta = CapybaraPageObject::Meta.from_string <<-EOF
      <meta name="description" content="my description">
      EOF
    end

    context "#key" do
      it "return the name from the meta tag" do
        @meta.key.should == 'description'
      end
    end
    
    context "#value" do
      it "return the description from the meta tag" do
        @meta.value.should == 'my description'
      end
    end
  end
end

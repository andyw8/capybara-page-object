require File.dirname(__FILE__) + '/../helper'

describe "Image" do
  before do
    @image = CapybaraPageObject::Image.from_string '<img src="image.jpg" alt="  alt image  ">'
  end

  context "#alt" do
    it "return the alt tag with whitespace stripped" do
      @image.alt.should == 'alt image'
    end
  end
  
  context "#key" do
    it "return the alt tag" do
      @image.key.should == 'alt image'
    end
  end
end

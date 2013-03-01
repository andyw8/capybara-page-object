# -*- encoding : utf-8 -*-
require 'spec_helper'

describe "Image" do
  context "#alt" do
    it "returns the alt attribute" do
      i = CapybaraPageObject::Image.from_string '<img alt="alt image">', 'img'
      i.alt.should == 'alt image'
    end

    it "strips whitespace" do
      i = CapybaraPageObject::Image.from_string '<img alt="  alt image  ">', 'img'
      i.alt.should == 'alt image'
    end
  end

  context "#key" do
    it "return the alt attribute" do
      i = CapybaraPageObject::Image.from_string '<img alt="alt image">', 'img'
      i.key.should == 'alt image'
    end
  end

  context "#value" do
    it "return the source image as a URI object" do
      i = CapybaraPageObject::Image.from_string '<img src="image.jpg">', 'img'
      i.value.class.should == URI::Generic
      i.value.path.should == 'image.jpg'
    end
  end
end

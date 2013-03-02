# -*- encoding : utf-8 -*-
require 'spec_helper'

describe "Meta" do
  context "Meta" do
    before do
      s = <<-EOF
      <meta name="description" content="my description">
      EOF
      @meta = CapybaraPageObject::Meta.from_string s, 'meta'
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

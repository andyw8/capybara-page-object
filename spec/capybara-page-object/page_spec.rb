# -*- encoding : utf-8 -*-
require 'spec_helper'
require 'active_support/ordered_hash'

describe "a class which extends CapybaraPageObject::Page" do

  before do
    class FooShow < CapybaraPageObject::Page
      def path
        'foos'
      end
    end
  end

  context ".current?" do
    it "is true if the path matches the current session path" do
      Capybara.stub :current_session => mock(:current_path => '/foos')
      FooShow.should be_current
    end

    it "is false if the path doesn't match the current session path" do
      Capybara.stub :current_session => mock(:current_path => '/foos/1')
      FooShow.should_not be_current
    end
  end

  context ".visit" do
    it "visits the appropriate path" do
      session = mock
      session.should_receive(:visit).with('/foos')
      Capybara.stub :current_session => session
      FooShow.visit
    end

    it "throws an error if path hasn't been overridden" do
      lambda do
        CapybaraPageObject::Page.visit
      end.should raise_error(CapybaraPageObject::MissingPath, 'You need to override #path in CapybaraPageObject::Page')
    end

    it "converts a supplied hash into querystring parameters" do
      session = mock
      session.should_receive(:visit).with('/foos?a=1&b=2')
      Capybara.stub :current_session => session
      # using an OrderedHash so we can guarantee the order on Ruby 1.8
      # also, the mix of string and symbol keys is intentional
      # for some reason, passing in the hash to the initializer fails when
      # running via Rake
      key_values = ActiveSupport::OrderedHash.new
      key_values['a'] = 1
      key_values[:b] = 2
      @page = FooShow.visit key_values
    end

    it "converts a supplied string into a resource identifier" do
      session = mock()
      session.should_receive(:visit).with('/foos/bar')
      Capybara.stub :current_session => session
      @page = FooShow.visit 'bar'
    end

    it "converts a supplied integer into a resource identifier" do
      session = mock()
      session.should_receive(:visit).with('/foos/1')
      Capybara.stub :current_session => session
      @page = FooShow.visit(1)
    end

    it "returns an instance of the page object" do
      Capybara.stub :current_session => stub.as_null_object
      FooShow.visit.class.should == FooShow
    end

    it "throws an error if the supplied argument is something other a string or hash" do
      lambda do
        FooShow.visit Object
      end.should raise_error ArgumentError
    end

    it "has a DSL for setting the path" do
      class Blah < CapybaraPageObject::Page
        path 'xyz'
      end
      session = mock()
      session.should_receive(:visit).with('/xyz')
      Capybara.stub :current_session => session
      @page = Blah.visit
    end

    it "has a DSL for setting components" do
      class Blah < CapybaraPageObject::Page
        component(:navigation) { source.find('#navigation') }
      end
      session = mock
      session.should_receive(:find).with('#navigation')
      Capybara.stub :current_session => session
      Blah.new.navigation
    end
  end


  # ------------------------------

  describe "#full_path" do

    it "returns the path from the root" do
      FooShow.new.full_path.should eq('/foos')
    end

  end


  # ------------------------------

  describe "#visit_path", :focused => true do

    class SegmentedPathPage < CapybaraPageObject::Page
      path 'some/:p1/segmented/:p2/path'
    end

    before(:each) do
      @page = SegmentedPathPage.new
      @session = mock
      Capybara.stub :current_session => @session
    end

    context "when the supplied hash of symbol/value pairs exactly match all path segments" do
      let(:expected_path) { '/some/v1/segmented/v2/path' }
      let(:parameters) { force_order({ :p1 => 'v1' }, { :p2 => 'v2' }) }

      it "interpolates all path segments" do
        @session.should_receive(:visit).with(expected_path)
        @page.visit_path parameters
      end
    end

    context "when the supplied hash doesn't provide all the symbols of the path segments" do

      context "because one is missing" do
        let(:expected_path) { '/some/:p1/segmented/:p2/path?p1=v1' }
        let(:parameters) { force_order({ :p1 => 'v1' }) }

        it "raises a MissingPathSegment error" do
          expect { @page.visit_path parameters }.to raise_error CapybaraPageObject::MissingPathSegment
        end
      end

      context "because one is not a symbol" do
        let(:expected_path) { '/some/:p1/segmented/:p2/path?p1=v1&p2=v2' }
        let(:parameters) { force_order({ 'p1' => 'v1' }, { :p2 => 'v2' }) }

        it "raises a MissingPathSegment error" do
          expect { @page.visit_path parameters }.to raise_error CapybaraPageObject::MissingPathSegment
        end
      end
    end

    context "when the supplied hash provides more than all the symbols of the path segments" do
      let(:expected_path) { '/some/v1/segmented/v2/path?p3=v3&p4=v4' }
      let(:parameters) { force_order({ :p1 => 'v1' }, { :p2 => 'v2' }, { :p3 => 'v3' }, { :p4 => 'v4' }) }

      it "interpolates all path segments then appends the remaining query parameters" do
        @session.should_receive(:visit).with(expected_path)
        @page.visit_path parameters
      end
    end

  end


  # ------------------------------

  # using an OrderedHash so we can guarantee the order on Ruby 1.8
  def force_order(*pairs)
    ordered_hash = ActiveSupport::OrderedHash.new
    pairs.each do |pair|
      pair.each do |k, v|
        ordered_hash[k] = v
      end
    end
    ordered_hash
  end

end

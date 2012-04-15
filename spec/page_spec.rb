require 'active_support/ordered_hash'
require 'capybara-page-object'

class FooIndex < CapybaraPageObject::Page
  def path
    'foos'
  end
end

class FooShow < CapybaraPageObject::Page
  def path
    'foos/'
  end
end

describe "Page" do
  context ".current?" do
    it "is true if the path matches the current session path" do
      Capybara.stub(:current_session => mock(:current_path => '/foos'))
      FooIndex.should be_current
    end

    it "is false if the path doesn't match the current session path" do
      Capybara.stub(:current_session => mock(:current_path => '/foos/1'))
      FooIndex.should_not be_current
    end
  end

  context "#visit" do

    it "throws if path hasn't been overridden" do
      lambda do
        CapybaraPageObject::Page.visit
      end.should raise_error(CapybaraPageObject::MissingPath, 'You need to override #path in CapybaraPageObject::Page')
    end

    it "visits the appropriate path" do
      mock_source = mock()
      mock_source.should_receive(:visit).with('/foos')
      foo_page = FooIndex.visit(nil, mock_source)
    end

    it "supports key-value pairs" do
      mock_source = mock()
      mock_source.should_receive(:visit).with('/foos?a=1&b=2')
      # using an OrderedHash so we can guarantee the order on Ruby 1.8
      # also, the mix of string and symbol keys is intentional
      # for some reason, passing in the hash to the initializer fails when
      # running via Rake
      key_values = ActiveSupport::OrderedHash.new
      key_values['a'] = 1
      key_values[:b] = 2
      @page = FooIndex.visit(key_values, mock_source)
    end

    it "supports single resource identifiers" do
      source = stub().as_null_object
      @page = FooShow.visit('bar', source)
    end

    it "returns an instance of the page object" do
      source = stub().as_null_object
      FooIndex.visit(nil, source).class.should == FooIndex
    end

    it "throws an ArgumentError if the arg type is unrecognized" do
      lambda do
        FooIndex.visit(Object)
      end.should raise_error(ArgumentError)
    end
  end
end

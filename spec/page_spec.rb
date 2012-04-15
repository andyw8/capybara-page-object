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
  context "#visit" do
    it "visits the appropriate path" do
      mock_source = mock()
      mock_source.should_receive(:current_path)
      mock_source.should_receive(:visit).with('/foos')
      foo_page = FooIndex.visit(nil, mock_source)
    end

    it "supports key-value pairs" do
      mock_source = mock()
      mock_source.should_receive(:current_path)
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
      mock_source = mock()
      mock_source.should_receive(:current_path)
      mock_source.should_receive(:visit).with('/foos/bar')
      @page = FooShow.visit('bar', mock_source)
    end

    it "returns an instance of the page object" do
      mock_source = mock()
      mock_source.should_receive(:current_path)
      mock_source.should_receive(:visit).with('/foos')
      FooIndex.visit(nil, mock_source).class.should == FooIndex
    end
  end
  
  context "#refresh" do
    pending "revisits the page" do
      # TODO implemented but untested
    end
  end
end

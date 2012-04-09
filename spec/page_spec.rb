class FooPage < CapybaraPageObject::Page
  def path
    '/foo'
  end
end

describe "Page" do
  context "#visit" do
    it "visits the appropriate path" do
      mock_source = mock()
      mock_source.should_receive(:current_path)
      mock_source.should_receive(:visit).with('/foo')
      foo_page = FooPage.visit(nil, mock_source)
    end
    
    it "supports key-value pairs" do
      mock_source = mock()
      mock_source.should_receive(:current_path)
      mock_source.should_receive(:visit).with('/foo?a=1&b=2')
      # intential mix of string and symbol keys below
      @page = FooPage.visit({'a' => 1, :b => 2}, mock_source)
    end
    
    it "returns an instance of the page object" do
      mock_source = mock()
      mock_source.should_receive(:current_path)
      mock_source.should_receive(:visit).with('/foo')
      FooPage.visit(nil, mock_source).class.should == FooPage
    end
  
    it "raises an exception if revisiting" do
      s = stub('Capybara', :current_path => '/foo')
      lambda do
        page = FooPage.new(s)
        FooPage.visit(nil, s)
      end.should raise_error(RuntimeError, 'Detected repeat of page load - use #reload instead')
    end
  end
  
  context "#refresh" do
    pending "revisits the page" do
      # TODO implemented but untested
    end
  end
end

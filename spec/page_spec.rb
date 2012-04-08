class FooPage < CapybaraPageObject::Page
  def path
    '/foo'
  end
end

describe "Page" do
  context "#new" do
    it "visits the appropriate when initialised" do
      mock_source = mock()
      mock_source.should_receive(:current_path)
      mock_source.should_receive(:visit).with('/foo')
      @page = FooPage.new(nil, mock_source)
    end
    
    it "supports key-value pairs" do
      mock_source = mock()
      mock_source.should_receive(:current_path)
      mock_source.should_receive(:visit).with('/foo?a=1&b=2')
      # intential mix of string and symbol keys below
      @page = FooPage.new({'a' => 1, :b => 2}, mock_source)
    end
  
    it "raises an exception if revisiting" do
      s = stub('Capybara', :current_path => '/foo', :visit => nil)
      lambda do
        @page = FooPage.new(nil, s)
      end.should raise_error(RuntimeError, 'Detected repeat of page load - use #reload instead')
    end
  end
  
  context "#refresh" do
    pending "revisits the page" do
      # TODO implemented but untested
    end
  end
end

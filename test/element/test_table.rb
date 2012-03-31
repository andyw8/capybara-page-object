require File.dirname(__FILE__) + '/../helper'

class TestTable < Test::Unit::TestCase
  context "" do
    setup do
      @table = load_fixture(CapybaraPageObject::Table)
    end
    
    should "rows" do
      assert_same_elements ['table_1_tr_1', 'table_1_tr_2'], @table.rows(:keys => 'id')
    end

    should "headers" do
      assert_same_elements ["TH1", "TH2"], @table.headers.collect(&:text)
    end
  end
end

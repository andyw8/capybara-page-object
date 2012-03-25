require_relative 'helper'
require 'capybara'

class TestTable< Test::Unit::TestCase
  context "" do
    setup do
      @table = load_sample_into_model(CapybaraPageObject::Table)
    end
    
    should "rows" do
      assert_same_elements ['table_1_tr_1', 'table_1_tr_2'], @table.rows(:keys => 'id')
    end

    should "headers" do
      assert_same_elements ["table_1_th_1", "table_1_th_2"], @table.headers(:keys => 'id')
    end
    
  end

end

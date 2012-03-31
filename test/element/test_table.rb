require File.dirname(__FILE__) + '/../helper'

class TestTable < Test::Unit::TestCase
  context "" do
    setup do
      @table = CapybaraPageObject::Table.from_string <<-EOF
      <table id="table_1" class="table_1_class">
        <tr id="table_1_tr_1">
          <th id="table_1_th_1">TH1</th>
          <th id="table_1_th_2">TH2</th>
        </tr>
        <tr id="table_1_tr_2">
          <td id="table_1_td_1">TD1</td>
          <td id="table_1_td_2">TD2</td>
        </tr>
      </table>
      EOF
    end
    
    context "#rows" do
      should "return the table's rows" do
        assert_same_elements ['table_1_tr_1', 'table_1_tr_2'], @table.rows(:keys => 'id')
      end
    end

    context "#headers" do
      should "return the table's headers" do
        assert_same_elements ["TH1", "TH2"], @table.headers.collect(&:text)
      end
    end
  end
end

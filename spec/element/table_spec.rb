require 'helper'

describe "CapybaraPageObject::Table" do
  before do
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
    it "return the table's rows" do
      @table.rows(:keys => 'id').should =~ ['table_1_tr_1', 'table_1_tr_2']
    end
  end

  context "#headers" do
    it "return the table's headers" do
      @table.headers.collect(&:text).should =~ ["TH1", "TH2"]
    end
  end
end

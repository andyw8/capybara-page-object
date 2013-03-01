# -*- encoding : utf-8 -*-
require 'spec_helper'

describe "CapybaraPageObject::Table" do
  before do
    s = <<-EOF
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
    @table = CapybaraPageObject::Table.from_string s, 'table'
    # TODO clean this up
    s = <<-EOF
    <table id="table_1" class="table_1_class">
      <tr id="table_1_tr_1">
        <td id="table_1_th_1">TH1</td>
        <td id="table_1_th_2">TH2</td>
      </tr>
      <tr id="table_1_tr_2">
        <td id="table_1_td_1">TD1</td>
        <td id="table_1_td_2">TD2</td>
      </tr>
    </table>
    EOF
    @table_without_headers = CapybaraPageObject::Table.from_string s, 'table'
  end

  context "#rows" do
    it "return the table's rows" do
      @table.rows.keys.should =~ ['table_1_tr_2']
    end
  end

  context "#headers" do
    it "return the table's headers" do
      @table.headers.keys.should =~ ["table_1_th_1", "table_1_th_2"]
    end
  end

  context "#rows" do
    context "for a table with a header row" do
      it "returns all the table rows except header row" do
        @table.should have(1).rows
      end
    end

    context "for a table without a header row" do
      it "returns all the table rows" do
        @table_without_headers.should have(2).rows
      end
    end
  end

end

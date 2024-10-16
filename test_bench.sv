//`timescale 1ns / 1ps
`define LENGTH  4
`include "dut.sv"
`include "interface.sv"
`include "sequence_item.sv"
`include "sequence.sv"
`include "monitor.sv"
`include "driver.sv"
`include "scoreboard.sv"
`include "agent.sv"
`include "environment.sv"
`include "test.sv"

module tb;
  import uvm_pkg::*;
  reg clk;

  always #10 clk =~ clk;
  des_if _if(clk);

  det_1011 u0 (.clk(clk),
               .rstn(_if.rstn),
               .in(_if.in),
               .out(_if.out));
  initial begin
    clk <= 0;
    uvm_config_db#(virtual des_if)::set(null,"uvm_test_top","des_vif",_if);
//    uvm_config_db#(virtual des_if)::set(null, "uvm_test_top.e0.a0.d0","des_vif",_if);
    run_test();
  end
endmodule

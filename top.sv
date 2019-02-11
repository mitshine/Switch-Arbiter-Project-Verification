`ifndef TOP_SV
`define TOP_SV

`include "uvm_macros.svh"
 import uvm_pkg::*;

/*
`include "driver.sv"  
`include "monitor.sv"  
`include "agent.sv"  
`include "env.sv" 
*/ 
`include "test.sv"

module top;

  reg core_clock;
  reg core_rst;
  initial begin
    core_rst = 0;
    core_clock = 0;
    forever #10 core_clock = ~core_clock;
  end
  
  switch_ifc switch_vif(.core_clock(core_clock), .core_rst(core_rst), 
.clk1p(clk1p), .clk2p(clk2p), .clk3p(clk3p), .clk4p(clk4p), .clk5p(clk5p), 
.clk1n(clk1n), .clk2n(clk2n), .clk3n(clk3n), .clk4n(clk4n));
  switch_arbiter SA(.core_clock(switch_vif.core_clock), .core_rst(switch_vif.core_rst),
.din1p(switch_vif.din1p), .req1p(switch_vif.req1p), .clk1p(switch_vif.clk1p), .dout1p(switch_vif.dout1p), .gnt1p(switch_vif.gnt1p),
.din2p(switch_vif.din2p), .req2p(switch_vif.req2p), .clk2p(switch_vif.clk2p), .dout2p(switch_vif.dout2p), .gnt2p(switch_vif.gnt2p),
.din3p(switch_vif.din3p), .req3p(switch_vif.req3p), .clk3p(switch_vif.clk3p), .dout3p(switch_vif.dout3p), .gnt3p(switch_vif.gnt3p),
.din4p(switch_vif.din4p), .req4p(switch_vif.req4p), .clk4p(switch_vif.clk4p), .dout4p(switch_vif.dout4p), .gnt4p(switch_vif.gnt4p),
.din5p(switch_vif.din5p), .req5p(switch_vif.req5p), .clk5p(switch_vif.clk5p), .dout5p(switch_vif.dout5p), .gnt5p(switch_vif.gnt5p),
.din1n(switch_vif.din1n), .req1n(switch_vif.req1n), .clk1n(switch_vif.clk1n), .dout1n(switch_vif.dout1n), .gnt1n(switch_vif.gnt1n),
.din2n(switch_vif.din2n), .req2n(switch_vif.req2n), .clk2n(switch_vif.clk2n), .dout2n(switch_vif.dout2n), .gnt2n(switch_vif.gnt2n),
.din3n(switch_vif.din3n), .req3n(switch_vif.req3n), .clk3n(switch_vif.clk3n), .dout3n(switch_vif.dout3n), .gnt3n(switch_vif.gnt3n),
.din4n(switch_vif.din4n), .req4n(switch_vif.req4n), .clk4n(switch_vif.clk4n), .dout4n(switch_vif.dout4n), .gnt4n(switch_vif.gnt4n));

  initial
    begin
      uvm_config_db#(virtual switch_ifc)::set(null, "*", "vif", switch_vif);
      run_test("test1");
    end
    
endmodule

`endif

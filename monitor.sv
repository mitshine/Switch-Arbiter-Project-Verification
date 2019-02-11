`ifndef MONITOR_SV
`define MONITOR_SV

`include "uvm_macros.svh"
 import uvm_pkg::*;
`include "packet.sv"
 `include "ifc.sv"
 
 class monitor extends uvm_monitor;

     `uvm_component_utils(monitor)
     
     virtual switch_ifc switch_vif;
     uvm_analysis_port#(switch_packet) ap;

     function new(string name, uvm_component parent);
         super.new(name, parent);
         ap = new("ap", this);
     endfunction

     function void build();
         uvm_report_info(get_full_name(),"Build", UVM_LOW);
         if (!uvm_config_db#(virtual switch_ifc)::get(this, "", "vif", switch_vif)) begin
            `uvm_fatal("SWITCH/MON/NOVIF", "No virtual interface specified for this monitor instance")
         end
     endfunction

     function void connect();
         uvm_report_info(get_full_name(),"Connect", UVM_LOW);
     endfunction

     function void end_of_elaboration();
         uvm_report_info(get_full_name(),"End_of_elaboration", UVM_LOW);
     endfunction

     function void start_of_simulation();
         uvm_report_info(get_full_name(),"Start_of_simulation", UVM_LOW);
     endfunction

     task run_phase(uvm_phase phase);
         uvm_report_info(get_full_name(),"Run", UVM_LOW);
         super.run_phase(phase);
         forever@(posedge switch_vif.core_clock) begin
            switch_packet tr;
            tr = switch_packet::type_id::create("tr", this);
            tr.din1p = switch_vif.din1p;
            tr.din2p = switch_vif.din2p;
            tr.din3p = switch_vif.din3p;
            tr.din4p = switch_vif.din4p;
            tr.din5p = switch_vif.din5p;
            tr.din1n = switch_vif.din1n;
            tr.din2n = switch_vif.din2n;
            tr.din3n = switch_vif.din3n;
            tr.din4n = switch_vif.din4n;
            tr.req1p = switch_vif.req1p;
            tr.req2p = switch_vif.req2p;
            tr.req3p = switch_vif.req3p;
            tr.req4p = switch_vif.req4p;
            tr.req5p = switch_vif.req5p;
            tr.req1n = switch_vif.req1n;
            tr.req2n = switch_vif.req2n;
            tr.req3n = switch_vif.req3n;
            tr.req4n = switch_vif.req4n;
            ap.write(tr);
         end
     endtask

     function void extract();
         uvm_report_info(get_full_name(),"Extract", UVM_LOW);
     endfunction

     function void check();
         uvm_report_info(get_full_name(),"Check", UVM_LOW);
     endfunction

     function void report();
         uvm_report_info(get_full_name(),"Report", UVM_LOW);
     endfunction

endclass

`endif

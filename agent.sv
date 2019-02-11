`ifndef AGENT_SV
`define AGENT_SV

`include "uvm_macros.svh"
 import uvm_pkg::*;
 `include "monitor.sv"
 `include "driver.sv"
 `include "sequencer.sv"

class agent extends uvm_agent;
     `uvm_component_utils(agent)
      protected uvm_active_passive_enum is_active = UVM_ACTIVE;
      monitor mon;
      driver drv;
      sequencer seqr;
      virtual switch_ifc switch_vif;
      uvm_analysis_port#(switch_packet) ap;

     function new(string name, uvm_component parent);
         super.new(name, parent);
         ap = new("ap", this);
     endfunction

     function void build();
         uvm_report_info(get_full_name(),"Build", UVM_LOW);
         if (!uvm_config_db#(virtual switch_ifc)::get(this, "", "vif", switch_vif)) begin
            `uvm_fatal("SWITCH/AGT/NOVIF", "No virtual interface specified for this agent instance")
         end
         mon = monitor::type_id::create("mon",this);   
         drv = driver::type_id::create("drv",this); 
         seqr = sequencer::type_id::create("seqr",this); 
     endfunction

     function void connect();
         uvm_report_info(get_full_name(),"Connect", UVM_LOW);
         drv.seq_item_port.connect(seqr.seq_item_export);
         mon.ap.connect(ap);
     endfunction

     function void end_of_elaboration();
         uvm_report_info(get_full_name(),"End_of_elaboration", UVM_LOW);
     endfunction

     function void start_of_simulation();
         uvm_report_info(get_full_name(),"Start_of_simulation", UVM_LOW);
     endfunction

     task run();
         uvm_report_info(get_full_name(),"Run", UVM_LOW);
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

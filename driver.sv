`ifndef DRIVER_SV
`define DRIVER_SV

`include "uvm_macros.svh"
 import uvm_pkg::*;
 `include "packet.sv"
 `include "ifc.sv"

class driver extends uvm_driver #(switch_packet);
     `uvm_component_utils(driver)
     virtual switch_ifc switch_vif;

     function new(string name, uvm_component parent);
         super.new(name, parent);
     endfunction

     function void build();
         uvm_report_info(get_full_name(),"Build", UVM_LOW);
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

         this.switch_vif.core_rst <= '0;
         this.switch_vif.din1p    <= '0;
         this.switch_vif.din2p    <= '0;
         this.switch_vif.din3p    <= '0;
         this.switch_vif.din4p    <= '0;
         this.switch_vif.din5p    <= '0;
         this.switch_vif.din1n    <= '0;
         this.switch_vif.din2n    <= '0;
         this.switch_vif.din3n    <= '0;
         this.switch_vif.din4n    <= '0;
         this.switch_vif.req1p    <= '0;
         this.switch_vif.req2p    <= '0;
         this.switch_vif.req3p    <= '0;
         this.switch_vif.req4p    <= '0;
         this.switch_vif.req5p    <= '0;
         this.switch_vif.req1n    <= '0;
         this.switch_vif.req2n    <= '0;
         this.switch_vif.req3n    <= '0;
         this.switch_vif.req4n    <= '0;

         forever begin
            switch_packet tr;
            @(this.switch_vif.core_clock)
              begin
                seq_item_port.get_next_item(tr);
                this.write(tr);
                seq_item_port.item_done();
              end
          end
     endtask
     
     virtual protected task write(switch_packet tr);
            if(this.switch_vif.core_rst == 0)
               begin
                 this.switch_vif.core_rst <= '0;
                 this.switch_vif.din1p    <= tr.din1p;
                 this.switch_vif.din2p    <= tr.din2p;
                 this.switch_vif.din3p    <= tr.din3p;
                 this.switch_vif.din4p    <= tr.din4p;
                 this.switch_vif.din5p    <= tr.din5p;
                 this.switch_vif.din1n    <= tr.din1n;
                 this.switch_vif.din2n    <= tr.din2n;
                 this.switch_vif.din3n    <= tr.din3n;
                 this.switch_vif.din4n    <= tr.din4n;
                 this.switch_vif.req1p    <= tr.req1p;
                 this.switch_vif.req2p    <= tr.req2p;
                 this.switch_vif.req3p    <= tr.req3p;
                 this.switch_vif.req4p    <= tr.req4p;
                 this.switch_vif.req5p    <= tr.req5p;
                 this.switch_vif.req1n    <= tr.req1n;
                 this.switch_vif.req2n    <= tr.req2n;
                 this.switch_vif.req3n    <= tr.req3n;
                 this.switch_vif.req4n    <= tr.req4n;
               end
             else
               begin
							   repeat(8)@(posedge this.switch_vif.core_clock)
								  begin
								    this.switch_vif.din1p = $random();
								    this.switch_vif.core_rst = 0;
								    this.switch_vif.req1p = 1;
								  end
               end
     endtask: write

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

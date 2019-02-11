`ifndef SCOREBOARD_SV
`define SCOREBOARD_SV

`include "uvm_macros.svh"
import uvm_pkg::*;
`include "ifc.sv"
`include "packet.sv"

`uvm_analysis_imp_decl(_FROM_MONITOR)

class scoreboard extends uvm_scoreboard;
     `uvm_component_utils(scoreboard)
     
     virtual switch_ifc switch_vif;
     switch_packet Driver_pkt;
     switch_packet Driver_Queue1[$];
     switch_packet Driver_Queue2[$];
     int tmp1, tmp2, tmp3, tmp4;
     bit tmpd1, tmpd2, tmpd3, tmpd4, tmpd5, tmpd6, tmpd7, tmpd8, tmpd9;
     bit tmpr1, tmpr2, tmpr3, tmpr4, tmpr5, tmpr6, tmpr7, tmpr8, tmpr9;
     int count_a = 0;
     int count_b = 0;
     
     uvm_analysis_imp_FROM_MONITOR #(switch_packet, scoreboard) sbd_mon_export;

     function new(string name, uvm_component parent);
         super.new(name, parent);
         sbd_mon_export = new("sbd_mon_export", this);
     endfunction

     function void build();
         uvm_report_info(get_full_name(),"Build", UVM_LOW);
         if (!uvm_config_db#(virtual switch_ifc)::get(this, "", "vif", switch_vif)) begin
            `uvm_fatal("SWITCH/SBD/NOVIF", "No virtual interface specified for this scoreboard instance")
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
         `uvm_info("scoreboard run task", "WAITING for expected output", UVM_DEBUG)
     endtask

     virtual function void write_FROM_MONITOR(switch_packet tr);
        tr.print();
        tmpd1 = tr.din1p;
        tmpd2 = tr.din2p;
        tmpd3 = tr.din3p;
        tmpd4 = tr.din4p;
        tmpd5 = tr.din5p;
        tmpd6 = tr.din1n;
        tmpd7 = tr.din2n;
        tmpd8 = tr.din3n;
        tmpd9 = tr.din4n;
        tmpr1 = tr.req1p;
        tmpr2 = tr.req2p;
        tmpr3 = tr.req3p;
        tmpr4 = tr.req4p;
        tmpr5 = tr.req5p;
        tmpr6 = tr.req1n;
        tmpr7 = tr.req2n;
        tmpr8 = tr.req3n;
        tmpr9 = tr.req4n;
        Driver_Queue1.push_back(tr);          //Data saved in Driver Queue 1
        Driver_Queue2.push_back(tr);          //Data saved in Driver Queue 2
        if(tr.din1p == 1)
          begin
            if(Driver_Queue1.size() == 8)
              begin
                // Driver_pkt=Driver_Queue1.pop_front();      //Packet Popped out from Queue.
                // Driver_pkt=Driver_Queue1.pop_front();      //Packet Popped out from Queue.
                Driver_pkt=Driver_Queue1.pop_front();      //Packet Popped out from Queue.
                tmp3 = tmpd1 ^ tmpd2;
              end
          end
        if(tr.req1p == 1)
          begin
            if(Driver_Queue2.size() == 8)
              begin
                // Driver_pkt=Driver_Queue2.pop_front();      //Packet Popped out from Queue.
                // Driver_pkt=Driver_Queue2.pop_front();      //Packet Popped out from Queue.
                // Driver_pkt=Driver_Queue2.pop_front();      //Packet Popped out from Queue.
                // Driver_pkt=Driver_Queue2.pop_front();      //Packet Popped out from Queue.
                // Driver_pkt=Driver_Queue2.pop_front();      //Packet Popped out from Queue.
                tmp4 = (~tmp3)+1;
              end
          end
        if(tmp4 == tr.din1p)
          $display("MATCHED!");
        else
          $display("NOT MATCHED!");
     endfunction

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

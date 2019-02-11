`ifndef PACKET_SV
`define PACKET_SV

import uvm_pkg::*;
`include "uvm_macros.svh"

class switch_packet extends uvm_sequence_item;
   
   // rand bit core_rst;
   rand bit din1p;
   rand bit din2p;
   rand bit din3p;
   rand bit din4p;
   rand bit din5p;
   rand bit din1n;
   rand bit din2n;
   rand bit din3n;
   rand bit din4n;
   
   rand bit req1p;
   rand bit req2p;
   rand bit req3p;
   rand bit req4p;
   rand bit req5p;
   rand bit req1n;
   rand bit req2n;
   rand bit req3n;
   rand bit req4n;
 
   `uvm_object_utils_begin(switch_packet)
     `uvm_field_int(din1p, UVM_ALL_ON | UVM_NOPACK);
     `uvm_field_int(din2p, UVM_ALL_ON | UVM_NOPACK);
     `uvm_field_int(din3p, UVM_ALL_ON | UVM_NOPACK);
     `uvm_field_int(din4p, UVM_ALL_ON | UVM_NOPACK);
     `uvm_field_int(din5p, UVM_ALL_ON | UVM_NOPACK);
     `uvm_field_int(din1n, UVM_ALL_ON | UVM_NOPACK);
     `uvm_field_int(din2n, UVM_ALL_ON | UVM_NOPACK);
     `uvm_field_int(din3n, UVM_ALL_ON | UVM_NOPACK);
     `uvm_field_int(din4n, UVM_ALL_ON | UVM_NOPACK);
     `uvm_field_int(req1p, UVM_ALL_ON | UVM_NOPACK);
     `uvm_field_int(req2p, UVM_ALL_ON | UVM_NOPACK);
     `uvm_field_int(req3p, UVM_ALL_ON | UVM_NOPACK);
     `uvm_field_int(req4p, UVM_ALL_ON | UVM_NOPACK);
     `uvm_field_int(req5p, UVM_ALL_ON | UVM_NOPACK);
     `uvm_field_int(req1n, UVM_ALL_ON | UVM_NOPACK);
     `uvm_field_int(req2n, UVM_ALL_ON | UVM_NOPACK);
     `uvm_field_int(req3n, UVM_ALL_ON | UVM_NOPACK);
     `uvm_field_int(req4n, UVM_ALL_ON | UVM_NOPACK);
   `uvm_object_utils_end
   
   function new (string name = "switch_packet");
      super.new(name);
   endfunction

endclass: switch_packet

`endif

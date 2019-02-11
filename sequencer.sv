`ifndef SEQUENCER_SV
`define SEQUENCER_SV

`include "uvm_macros.svh"
import uvm_pkg::*;
`include "packet.sv"
 
class sequencer extends uvm_sequencer #(switch_packet);

   `uvm_component_utils(sequencer)

   function new(string name, uvm_component parent);
      super.new(name, parent);
   endfunction : new

endclass : sequencer

`endif

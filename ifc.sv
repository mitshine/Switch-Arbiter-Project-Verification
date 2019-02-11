`ifndef INTERFACE_SV
`define INTERFACE_SV

interface switch_ifc(input bit core_clock, input bit core_rst, input bit clk1p, 
                    input bit clk2p, input bit clk3p, input bit clk4p, input bit clk5p, 
                    input bit clk1n, input bit clk2n, input bit clk3n, input bit clk4n);
   logic din1p;
   logic din2p;
   logic din3p;
   logic din4p;
   logic din5p;
   logic din1n;
   logic din2n;
   logic din3n;
   logic din4n;
   logic req1p;
   logic req2p;
   logic req3p;
   logic req4p;
   logic req5p;
   logic req1n;
   logic req2n;
   logic req3n;
   logic req4n;
   logic dout1p;
   logic dout2p;
   logic dout3p;
   logic dout4p;
   logic dout5p;
   logic dout1n;
   logic dout2n;
   logic dout3n;
   logic dout4n;
   logic gnt1p;
   logic gnt2p;
   logic gnt3p;
   logic gnt4p;
   logic gnt5p;
   logic gnt1n;
   logic gnt2n;
   logic gnt3n;
   logic gnt4n;

   /*clocking pck @(posedge core_clock);
      output dout1p, dout2p, dout3p, dout4p, dout5p, dout1n, dout2n, dout3n, dout4n,
            gnt1p, gnt2p, gnt3p, gnt4p, gnt5p, gnt1n, gnt2n, gnt3n, gnt4n;
      //input  prdata;
   endclocking: pck*/

endinterface: switch_ifc

`endif

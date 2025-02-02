
module tb_MorraCinese();
  integer tbf, outf;
  
  reg [1:0] PRIMO;
  reg [1:0] SECONDO;
  reg clk;
  reg [0:0] INIZIA;
  wire [1:0] MANCHE;
  wire [1:0] PARTITA;
 
  
 MorraCinese MorraCinese(PRIMO, SECONDO, clk, INIZIA, MANCHE, PARTITA);
  
   always #10 clk = ~clk;
    
    initial begin
      $dumpfile("dump.vcd");
      $dumpvars(1);
      tbf = $fopen("testbench.script", "w");
      outf = $fopen("output_verilog.txt", "w");
      $fdisplay(tbf, "read_blif FSMD.blif");
      
      clk = 1'b0;
      
      PRIMO = 2'b10;
      SECONDO = 2'b11; 
      INIZIA = 1'b1;
      $fdisplay(tbf, "simulate %b %b %b %b %b", PRIMO[1], PRIMO[0], SECONDO[1], SECONDO[0], INIZIA);
      #20
      $fdisplay(outf, "Outputs: %b %b %b %b",MANCHE [1],MANCHE[0],PARTITA[1],PARTITA[0]);
      //1
      PRIMO = 2'b11;
      SECONDO = 2'b10;
      INIZIA = 1'b0;
      $fdisplay(tbf, "simulate %b %b %b %b %b", PRIMO[1], PRIMO[0], SECONDO[1], SECONDO[0], INIZIA);
      #20
      $fdisplay(outf, "Outputs: %b %b %b %b",MANCHE [1],MANCHE[0],PARTITA[1],PARTITA[0]);
      //2
      PRIMO = 2'b01;
      SECONDO = 2'b10;
      INIZIA = 1'b0;
      $fdisplay(tbf, "simulate %b %b %b %b %b", PRIMO[1], PRIMO[0], SECONDO[1], SECONDO[0], INIZIA);
      #20
      $fdisplay(outf, "Outputs: %b %b %b %b",MANCHE [1],MANCHE[0],PARTITA[1],PARTITA[0]);
      //3
      PRIMO = 2'b01;
      SECONDO = 2'b11;
      INIZIA = 1'b0;
      $fdisplay(tbf, "simulate %b %b %b %b %b", PRIMO[1], PRIMO[0], SECONDO[1], SECONDO[0], INIZIA);
      #20
      $fdisplay(outf, "Outputs: %b %b %b %b",MANCHE [1],MANCHE[0],PARTITA[1],PARTITA[0]);
      //4
      PRIMO = 2'b01;
      SECONDO = 2'b01; 
      INIZIA = 1'b0;
      $fdisplay(tbf, "simulate %b %b %b %b %b", PRIMO[1], PRIMO[0], SECONDO[1], SECONDO[0], INIZIA);
      #20
      $fdisplay(outf, "Outputs: %b %b %b %b",MANCHE [1],MANCHE[0],PARTITA[1],PARTITA[0]);
      //5
      PRIMO = 2'b10;
      SECONDO = 2'b11;
      INIZIA = 1'b0;
      $fdisplay(tbf, "simulate %b %b %b %b %b", PRIMO[1], PRIMO[0], SECONDO[1], SECONDO[0], INIZIA);
      #20
      $fdisplay(outf, "Outputs: %b %b %b %b",MANCHE [1],MANCHE[0],PARTITA[1],PARTITA[0]);
      //6
      PRIMO = 2'b01;
      SECONDO = 2'b01;
      INIZIA = 1'b0;
      $fdisplay(tbf, "simulate %b %b %b %b %b", PRIMO[1], PRIMO[0], SECONDO[1], SECONDO[0], INIZIA);
      #20
      $fdisplay(outf, "Outputs: %b %b %b %b",MANCHE [1],MANCHE[0],PARTITA[1],PARTITA[0]);
      //7
      PRIMO = 2'b00;
      SECONDO = 2'b00;
      INIZIA = 1'b0;
      $fdisplay(tbf, "simulate %b %b %b %b %b", PRIMO[1], PRIMO[0], SECONDO[1], SECONDO[0], INIZIA);
      #20
      $fdisplay(outf, "Outputs: %b %b %b %b",MANCHE [1],MANCHE[0],PARTITA[1],PARTITA[0]);
      //8
      PRIMO = 2'b11;
      SECONDO = 2'b01;
      INIZIA = 1'b0;
      $fdisplay(tbf, "simulate %b %b %b %b %b", PRIMO[1], PRIMO[0], SECONDO[1], SECONDO[0], INIZIA);
      #20
      $fdisplay(outf, "Outputs: %b %b %b %b",MANCHE [1],MANCHE[0],PARTITA[1],PARTITA[0]);
      //9
      PRIMO = 2'b10;
      SECONDO = 2'b11;
      INIZIA = 1'b0;
      $fdisplay(tbf, "simulate %b %b %b %b %b", PRIMO[1], PRIMO[0], SECONDO[1], SECONDO[0], INIZIA);
      #20
      $fdisplay(outf, "Outputs: %b %b %b %b",MANCHE [1],MANCHE[0],PARTITA[1],PARTITA[0]);
      //resetto 
      PRIMO = 2'b00;
      SECONDO = 2'b11;
      INIZIA = 1'b1;
       $fdisplay(tbf, "simulate %b %b %b %b %b", PRIMO[1], PRIMO[0], SECONDO[1], SECONDO[0], INIZIA);
      #20
      $fdisplay(outf, "Outputs: %b %b %b %b",MANCHE [1],MANCHE[0],PARTITA[1],PARTITA[0]);
      //1
      PRIMO = 2'b10;
      SECONDO = 2'b11; 
      INIZIA = 1'b0;
       $fdisplay(tbf, "simulate %b %b %b %b %b", PRIMO[1], PRIMO[0], SECONDO[1], SECONDO[0], INIZIA);
      #20
      $fdisplay(outf, "Outputs: %b %b %b %b",MANCHE [1],MANCHE[0],PARTITA[1],PARTITA[0]);
      //2
      PRIMO = 2'b01;
      SECONDO = 2'b10;
      INIZIA = 1'b0;
       $fdisplay(tbf, "simulate %b %b %b %b %b", PRIMO[1], PRIMO[0], SECONDO[1], SECONDO[0], INIZIA);
      #20
      $fdisplay(outf, "Outputs: %b %b %b %b",MANCHE [1],MANCHE[0],PARTITA[1],PARTITA[0]);
      //3
      PRIMO = 2'b11;
      SECONDO = 2'b11;
      INIZIA = 1'b0;
       $fdisplay(tbf, "simulate %b %b %b %b %b", PRIMO[1], PRIMO[0], SECONDO[1], SECONDO[0], INIZIA);
      #20
      $fdisplay(outf, "Outputs: %b %b %b %b",MANCHE [1],MANCHE[0],PARTITA[1],PARTITA[0]);
      //4
      PRIMO = 2'b10;
      SECONDO = 2'b00;
      INIZIA = 1'b0;
       $fdisplay(tbf, "simulate %b %b %b %b %b", PRIMO[1], PRIMO[0], SECONDO[1], SECONDO[0], INIZIA);
      #20
      $fdisplay(outf, "Outputs: %b %b %b %b",MANCHE [1],MANCHE[0],PARTITA[1],PARTITA[0]);
      //5
      PRIMO = 2'b10;
      SECONDO = 2'b01;
      INIZIA = 1'b0;
       $fdisplay(tbf, "simulate %b %b %b %b %b", PRIMO[1], PRIMO[0], SECONDO[1], SECONDO[0], INIZIA);
      #20
      $fdisplay(outf, "Outputs: %b %b %b %b",MANCHE [1],MANCHE[0],PARTITA[1],PARTITA[0]);
      //resetto nel mezzo della partita
      PRIMO = 2'b01;
      SECONDO = 2'b10;
      INIZIA = 1'b1;
      $fdisplay(tbf, "simulate %b %b %b %b %b", PRIMO[1], PRIMO[0], SECONDO[1], SECONDO[0], INIZIA);
      #20
      $fdisplay(outf, "Outputs: %b %b %b %b",MANCHE [1],MANCHE[0],PARTITA[1],PARTITA[0]);
      //1
      PRIMO = 2'b11;
      SECONDO = 2'b10; 
      INIZIA = 1'b0;
      $fdisplay(tbf, "simulate %b %b %b %b %b", PRIMO[1], PRIMO[0], SECONDO[1], SECONDO[0], INIZIA);
      #20
      $fdisplay(outf, "Outputs: %b %b %b %b",MANCHE [1],MANCHE[0],PARTITA[1],PARTITA[0]);
      //2
      PRIMO = 2'b01;
      SECONDO = 2'b01;
      INIZIA = 1'b0;
      $fdisplay(tbf, "simulate %b %b %b %b %b", PRIMO[1], PRIMO[0], SECONDO[1], SECONDO[0], INIZIA);
      #20
      $fdisplay(outf, "Outputs: %b %b %b %b",MANCHE [1],MANCHE[0],PARTITA[1],PARTITA[0]);
      //3
      PRIMO = 2'b01;
      SECONDO = 2'b00;
      INIZIA = 1'b0;
     $fdisplay(tbf, "simulate %b %b %b %b %b", PRIMO[1], PRIMO[0], SECONDO[1], SECONDO[0], INIZIA);
      #20
      $fdisplay(outf, "Outputs: %b %b %b %b",MANCHE [1],MANCHE[0],PARTITA[1],PARTITA[0]);
      //4
      PRIMO = 2'b01;
      SECONDO = 2'b10;
      INIZIA = 1'b0;
      $fdisplay(tbf, "simulate %b %b %b %b %b", PRIMO[1], PRIMO[0], SECONDO[1], SECONDO[0], INIZIA);
      #20
      $fdisplay(outf, "Outputs: %b %b %b %b",MANCHE [1],MANCHE[0],PARTITA[1],PARTITA[0]);
      //5
      PRIMO = 2'b10;
      SECONDO = 2'b01;
      INIZIA = 1'b0;
      $fdisplay(tbf, "simulate %b %b %b %b %b", PRIMO[1], PRIMO[0], SECONDO[1], SECONDO[0], INIZIA);
      #20
      $fdisplay(outf, "Outputs: %b %b %b %b",MANCHE [1],MANCHE[0],PARTITA[1],PARTITA[0]);
      //6
      PRIMO = 2'b01;
      SECONDO = 2'b11;
      INIZIA = 1'b0;
      $fdisplay(tbf, "simulate %b %b %b %b %b", PRIMO[1], PRIMO[0], SECONDO[1], SECONDO[0], INIZIA);
      #20
      $fdisplay(outf, "Outputs: %b %b %b %b",MANCHE [1],MANCHE[0],PARTITA[1],PARTITA[0]);
      //resetto
      PRIMO = 2'b00;
      SECONDO = 2'b00;
      INIZIA = 1'b1;
      $fdisplay(tbf, "simulate %b %b %b %b %b", PRIMO[1], PRIMO[0], SECONDO[1], SECONDO[0], INIZIA);
      #20
      $fdisplay(outf, "Outputs: %b %b %b %b",MANCHE [1],MANCHE[0],PARTITA[1],PARTITA[0]);
      //1
      PRIMO = 2'b01;
      SECONDO = 2'b11;
      INIZIA = 1'b0;
      $fdisplay(tbf, "simulate %b %b %b %b %b", PRIMO[1], PRIMO[0], SECONDO[1], SECONDO[0], INIZIA);
      #20
      $fdisplay(outf, "Outputs: %b %b %b %b",MANCHE [1],MANCHE[0],PARTITA[1],PARTITA[0]);
      //2
      PRIMO = 2'b10;
      SECONDO = 2'b11;
      INIZIA = 1'b0;
      $fdisplay(tbf, "simulate %b %b %b %b %b", PRIMO[1], PRIMO[0], SECONDO[1], SECONDO[0], INIZIA);
      #20
      $fdisplay(outf, "Outputs: %b %b %b %b",MANCHE [1],MANCHE[0],PARTITA[1],PARTITA[0]);
      //3
      PRIMO = 2'b10;
      SECONDO = 2'b01;
      INIZIA = 1'b0;
      $fdisplay(tbf, "simulate %b %b %b %b %b", PRIMO[1], PRIMO[0], SECONDO[1], SECONDO[0], INIZIA);
      #20
      $fdisplay(outf, "Outputs: %b %b %b %b",MANCHE [1],MANCHE[0],PARTITA[1],PARTITA[0]);
      //4
      PRIMO = 2'b00;
      SECONDO = 2'b00;
      INIZIA = 1'b0;
      $fdisplay(tbf, "simulate %b %b %b %b %b", PRIMO[1], PRIMO[0], SECONDO[1], SECONDO[0], INIZIA);
      #20
      $fdisplay(outf, "Outputs: %b %b %b %b",MANCHE [1],MANCHE[0],PARTITA[1],PARTITA[0]);
      //5
      PRIMO = 2'b01;
      SECONDO = 2'b10;
      INIZIA = 1'b0;
      $fdisplay(tbf, "simulate %b %b %b %b %b", PRIMO[1], PRIMO[0], SECONDO[1], SECONDO[0], INIZIA);
      #20
      $fdisplay(outf, "Outputs: %b %b %b %b",MANCHE [1],MANCHE[0],PARTITA[1],PARTITA[0]);
      //resetto
      PRIMO = 2'b00;
      SECONDO = 2'b00;
      INIZIA = 1'b1;
      $fdisplay(tbf, "simulate %b %b %b %b %b", PRIMO[1], PRIMO[0], SECONDO[1], SECONDO[0], INIZIA);
      #20
      $fdisplay(outf, "Outputs: %b %b %b %b",MANCHE [1],MANCHE[0],PARTITA[1],PARTITA[0]);
     
      $fdisplay(tbf, "quit");
      $fclose(tbf);
      $fclose(outf);
      $finish;
    end
endmodule

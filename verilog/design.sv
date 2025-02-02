
module MorraCinese(
  input reg [1:0]PRIMO, reg [1:0]SECONDO, reg clk, reg INIZIA,
  output reg [1:0]MANCHE, reg [1:0]PARTITA);
  reg [1:0] stato= 2'b00;
  reg [1:0] stato_prossimo= 2'b00;
  reg NP, PMAX, PM, VALIDA;
  reg [4:0] A;
  reg [4:0] B;
  reg C;
  reg[1:0] mossap;
  reg[1:0] mossas;
  reg[1:0] up=2'b00;
  reg[1:0] us=2'b00;
  reg[4:0] contpartite= 5'b00000;
  reg[4:0] partite= 5'b00000;
  
  always @(clk) begin : UPDATE
        stato = stato_prossimo;      
    end
  
  always @(stato, PRIMO, SECONDO, INIZIA, NP, PMAX, VALIDA) begin: FSM 
    case(stato) 
      2'b00:begin 
        //vantaggio primo
        if((PRIMO==2'b01 && SECONDO==2'b11 && ~INIZIA && ~PMAX && ~VALIDA) || (PRIMO==2'b11 && SECONDO==2'b10 && ~INIZIA && ~PMAX && ~VALIDA) || (PRIMO==2'b10 && SECONDO==2'b01 && ~INIZIA && ~PMAX && ~VALIDA)) begin
          MANCHE = 2'b01;
          PARTITA = 2'b00;
          PM = 1'b0;
          stato_prossimo = 2'b01;
        end
        //vantaggio secondo
        else if((PRIMO==2'b11 && SECONDO==2'b01 && ~INIZIA && ~PMAX && ~VALIDA) || (PRIMO==2'b10 && SECONDO==2'b11 && ~INIZIA && ~PMAX && ~VALIDA) || (PRIMO==2'b01 && SECONDO==2'b10 && ~INIZIA && ~PMAX && ~VALIDA)) begin
          MANCHE = 2'b10;
          PARTITA = 2'b00;
          PM = 1'b0;
          stato_prossimo = 2'b10;
        end
        //pareggio
        else if((PRIMO==2'b01 && SECONDO==2'b01 && ~INIZIA && ~PMAX && ~VALIDA) || (PRIMO==2'b10 && SECONDO==2'b10 && ~INIZIA && ~PMAX && ~VALIDA) || (PRIMO==2'b11 && SECONDO==2'b11 && ~INIZIA && ~PMAX && ~VALIDA)) begin
          MANCHE = 2'b11;
          PARTITA = 2'b00;
          PM = 1'b0;
          stato_prossimo = 2'b00;
        end
        //wp
        else if((PRIMO==2'b01 && SECONDO==2'b11 && ~INIZIA && NP && PMAX && ~VALIDA) || (PRIMO==2'b11 && SECONDO==2'b10 && ~INIZIA && NP && PMAX && ~VALIDA) || (PRIMO==2'b10 && SECONDO==2'b01 && ~INIZIA && NP && PMAX && ~VALIDA)) begin
          MANCHE = 2'b01;
          PARTITA = 2'b01;
          PM = 1'b0;
          stato_prossimo = 2'b11;
        end
        //ws
        else if((PRIMO==2'b11 && SECONDO==2'b01 && ~INIZIA && NP && PMAX && ~VALIDA) || (PRIMO==2'b10 && SECONDO==2'b11 && ~INIZIA && NP && PMAX && ~VALIDA) || (PRIMO==2'b01 && SECONDO==2'b10 && ~INIZIA && NP && PMAX && ~VALIDA)) begin
          MANCHE = 2'b10;
          PARTITA = 2'b10;
          PM = 1'b0;
          stato_prossimo = 2'b11;
        end 
        //wd
        else if((PRIMO==2'b01 && SECONDO==2'b01 && ~INIZIA && NP && PMAX && ~VALIDA) || (PRIMO==2'b10 && SECONDO==2'b10 && ~INIZIA && NP && PMAX && ~VALIDA) || (PRIMO==2'b11 && SECONDO==2'b11 && ~INIZIA && NP && PMAX && ~VALIDA)) begin
          MANCHE = 2'b11;
          PARTITA = 2'b11;
          PM = 1'b0;
          stato_prossimo = 2'b11;
        end
        //nv
        else if(~INIZIA && VALIDA) begin
          MANCHE = 2'b00;
          PARTITA = 2'b00;
          PM = 1'b0;
          stato_prossimo = 2'b00;
        end
        //reset
        else if(INIZIA) begin
          MANCHE = 2'b00;
          PARTITA = 2'b00;
          PM = 1'b1;
          stato_prossimo = 2'b00;
        end

      end
      
      2'b01: begin
        //vince il secondo
        if((PRIMO==2'b11 && SECONDO==2'b01 && ~INIZIA && ~PMAX && ~VALIDA) || (PRIMO==2'b10 && SECONDO==2'b11 && ~INIZIA && ~PMAX && ~VALIDA) || (PRIMO==2'b01 && SECONDO==2'b10 && ~INIZIA && ~PMAX && ~VALIDA)) begin
          MANCHE = 2'b10;
          PARTITA = 2'b00;
          PM = 1'b0;
          stato_prossimo = 2'b00;
        end
        //pareggio
        else if((PRIMO==2'b01 && SECONDO==2'b01 && ~INIZIA && ~PMAX && ~VALIDA) || (PRIMO==2'b10 && SECONDO==2'b10 && ~INIZIA && ~PMAX && ~VALIDA) || (PRIMO==2'b11 && SECONDO==2'b11 && ~INIZIA && ~PMAX && ~VALIDA)) begin
          MANCHE = 2'b11;
          PARTITA = 2'b00;
          PM = 1'b0;
          stato_prossimo = 2'b01;
        end
        //nessuna vincita se non si è raggiunto le 4 manche minime
        else if((PRIMO==2'b01 && SECONDO==2'b11 && ~INIZIA && ~NP && ~PMAX && ~VALIDA) || (PRIMO==2'b11 && SECONDO==2'b10 && ~INIZIA && ~PMAX && ~VALIDA) || (PRIMO==2'b10 && SECONDO==2'b01 && ~INIZIA && ~PMAX && ~VALIDA)) begin
          MANCHE = 2'b01;
          PARTITA = 2'b00;
          PM = 1'b0;
          stato_prossimo = 2'b01;
        end
        //wp
        else if((PRIMO==2'b01 && SECONDO==2'b11 && ~INIZIA && NP && ~VALIDA) || (PRIMO==2'b11 && SECONDO==2'b10 && ~INIZIA && NP && ~VALIDA) || (PRIMO==2'b10 && SECONDO==2'b01 && ~INIZIA && NP && ~VALIDA)) begin
          MANCHE = 2'b01;
          PARTITA = 2'b01;
          PM = 1'b0;
          stato_prossimo = 2'b11;
        end
        //pareggio con vittoria di primo
        else if((PRIMO==2'b01 && SECONDO==2'b01 && ~INIZIA && NP && PMAX && ~VALIDA) || (PRIMO==2'b10 && SECONDO==2'b10 && ~INIZIA && NP && PMAX && ~VALIDA) || (PRIMO==2'b11 && SECONDO==2'b11 && ~INIZIA && NP && PMAX && ~VALIDA)) begin
          MANCHE = 2'b11;
          PARTITA = 2'b01;
          PM = 1'b0;
          stato_prossimo = 2'b11;
        end
        //vittoria di secondo all'ultimo e partita pareggiata
        else if((PRIMO==2'b11 && SECONDO==2'b01 && ~INIZIA && NP && PMAX && ~VALIDA) || (PRIMO==2'b10 && SECONDO==2'b11 && ~INIZIA && NP && PMAX && ~VALIDA) || (PRIMO==2'b01 && SECONDO==2'b10 && ~INIZIA && NP && PMAX && ~VALIDA)) begin
          MANCHE = 2'b10;
          PARTITA = 2'b11;
          PM = 1'b0;
          stato_prossimo = 2'b11;
        end 
        //nv
        else if(~INIZIA && VALIDA) begin
          MANCHE = 2'b00;
          PARTITA = 2'b00;
          PM = 1'b0;
          stato_prossimo = 2'b01;
        end
        //reset
        else if(INIZIA) begin
          MANCHE = 2'b00;
          PARTITA = 2'b00;
          PM = 1'b1;
          stato_prossimo = 2'b00;
        end

      end
      
      2'b10: begin
        //vince il primo
        if((PRIMO==2'b01 && SECONDO==2'b11 && ~INIZIA && ~PMAX && ~VALIDA) || (PRIMO==2'b11 && SECONDO==2'b10 && ~INIZIA && ~PMAX && ~VALIDA) || (PRIMO==2'b10 && SECONDO==2'b01 && ~INIZIA && ~PMAX && ~VALIDA)) begin
          MANCHE = 2'b01;
          PARTITA = 2'b00;
          PM = 1'b0;
          stato_prossimo = 2'b00;
        end
        //pareggio
        else if((PRIMO==2'b01 && SECONDO==2'b01 && ~INIZIA && ~PMAX && ~VALIDA) || (PRIMO==2'b10 && SECONDO==2'b10 && ~INIZIA && ~PMAX && ~VALIDA) || (PRIMO==2'b11 && SECONDO==2'b11 && ~INIZIA && ~PMAX && ~VALIDA)) begin
          MANCHE = 2'b11;
          PARTITA = 2'b00;
          PM = 1'b0;
          stato_prossimo = 2'b10;
        end
        //vittoria di secondo ma non vince perchè non abbiamo raggiunto le 4 partite
        else if((PRIMO==2'b11 && SECONDO==2'b01 && ~INIZIA && ~NP && ~PMAX && ~VALIDA) || (PRIMO==2'b10 && SECONDO==2'b11 && ~INIZIA && ~NP && ~PMAX && ~VALIDA) || (PRIMO==2'b01 && SECONDO==2'b10 && ~INIZIA && ~NP && ~PMAX && ~VALIDA)) begin
          MANCHE = 2'b10;
          PARTITA = 2'b00;
          PM = 1'b0;
          stato_prossimo = 2'b10;
        end
        //pareggio finale con vittoria di secondo
        else if((PRIMO==2'b01 && SECONDO==2'b01 && ~INIZIA && NP && PMAX && ~VALIDA) || (PRIMO==2'b10 && SECONDO==2'b10 && ~INIZIA && NP && PMAX && ~VALIDA) || (PRIMO==2'b11 && SECONDO==2'b11 && ~INIZIA && NP && PMAX && ~VALIDA)) begin
          MANCHE = 2'b11;
          PARTITA = 2'b10;
          PM = 1'b0;
          stato_prossimo = 2'b11;
        end
        //ws
        else if((PRIMO==2'b11 && SECONDO==2'b01 && ~INIZIA && NP && ~VALIDA) || (PRIMO==2'b10 && SECONDO==2'b11 && ~INIZIA && NP && ~VALIDA) || (PRIMO==2'b01 && SECONDO==2'b10 && ~INIZIA && NP && ~VALIDA)) begin
          MANCHE = 2'b10;
          PARTITA = 2'b10;
          PM = 1'b0;
          stato_prossimo = 2'b11;
        end
        //all'ultimo mache primo vince e la partita finisce in pareggio
        else if((PRIMO==2'b01 && SECONDO==2'b11 && ~INIZIA && NP && PMAX && ~VALIDA) || (PRIMO==2'b11 && SECONDO==2'b10 && ~INIZIA && NP && PMAX && ~VALIDA) || (PRIMO==2'b10 && SECONDO==2'b01 && ~INIZIA && NP && PMAX && ~VALIDA)) begin
          MANCHE = 2'b01;
          PARTITA = 2'b11;
          PM = 1'b0;
          stato_prossimo = 2'b11;
        end
        //nv
        else if(~INIZIA && VALIDA) begin
          MANCHE = 2'b00;
          PARTITA = 2'b00;
          PM = 1'b0;
          stato_prossimo = 2'b10;
        end
        //reset
        else if(INIZIA) begin
          MANCHE = 2'b00;
          PARTITA = 2'b00;
          PM = 1'b1;
          stato_prossimo = 2'b00;
        end

      end
      
      2'b11: begin
        //reset
        if(INIZIA) begin
          MANCHE = 2'b00;
          PARTITA = 2'b00;
          PM = 1'b1;
          stato_prossimo = 2'b00;
        end
      end
    endcase
  end
  
  always@(posedge clk) begin: DATAPATH
            if(INIZIA) begin
              
              partite=5'b00000;
              
        if(PRIMO==2'b00) begin
        	A=5'b00000;
        end
        if(PRIMO==2'b01) begin
         	A=5'b00100;
        end
        if(PRIMO==2'b10) begin
           	A=5'b01000;
        end
        if(PRIMO==2'b11) begin
          	A=5'b01100;
        end
        if(SECONDO==2'b00) begin
          	B=5'b00000;
        end
        if(SECONDO==2'b01) begin
          	B=5'b00001;
        end
        if(SECONDO==2'b10) begin
          	B=5'b00010;
        end
        if(SECONDO==2'b11) begin
          	B=5'b00011;
        end
        partite=A+B+5'b00100;
              
            up=2'b00;
  			us=2'b00;
            contpartite= 5'b00000;
          
              end
      
              else begin
       if(PRIMO==2'b00) begin
          mossap=2'b00;
        end
        if(PRIMO==2'b01) begin
          mossap=2'b01;
        end
        if(PRIMO==2'b10) begin
          mossap=2'b10;
        end
        if(PRIMO==2'b11) begin
          mossap=2'b11;
        end
        if(SECONDO==2'b00) begin
          mossas=2'b00;
        end
        if(SECONDO==2'b01) begin
          mossas=2'b01;
        end
        if(SECONDO==2'b10) begin
          mossas=2'b10;
        end
        if(SECONDO==2'b11) begin
          mossas=2'b11;
        end 
        
                
                if(PRIMO==2'b00 || SECONDO==2'b00)begin
                  C=1'b1;
                end
                else begin 
                  C=1'b0;
                end
                  
  		
                if(PM)begin
                  if((mossap==2'b00 || mossas==2'b00) || C==1'b1) begin
                    VALIDA=1'b1;
                    if(contpartite > 5'b00011) begin
                      NP=1'b1;
                      end
                      else begin
                        NP=1'b0;
                        end
                    if(contpartite==partite) begin
                      PMAX=1'b1;
                      end
                      else begin
                        PMAX=1'b0;
                       end
                      end
                   else begin
                     VALIDA=1'b0;
                      contpartite= contpartite + 5'b00001;
                     if(contpartite > 5'b00011) begin
                        NP=1'b1;
                        end
                        else begin
                          NP=1'b0;
                          end
                      if(contpartite==partite) begin
                        PMAX=1'b1;
                        end
                        else begin
                          PMAX=1'b0;
                         end
                        end
                  if(MANCHE==2'b01) begin
                      up=mossap;
                      us=2'b00;
                    end
                    else if(MANCHE==2'b10) begin
                      up=2'b00;
                      us=mossas;
                    end
                    else begin
                      us=2'b00;
                      up=2'b00;
                    end
                end
                      else begin
                        if((mossap==up || mossas==us) || C==1'b1) begin
                          VALIDA=1'b1;
                          if(contpartite > 5'b00011) begin
                            NP=1'b1;
                            end
                            else begin
                              NP=1'b0;
                              end
                          if(contpartite==partite) begin
                            PMAX=1'b1;
                            end
                            else begin
                              PMAX=1'b0;
                             end
                            end
                         else begin
                           VALIDA=1'b0;
                            contpartite= contpartite + 5'b00001;
                           if(contpartite > 5'b00011) begin
                              NP=1'b1;
                              end
                              else begin
                                NP=1'b0;
                                end
                            if(contpartite==partite) begin
                              PMAX=1'b1;
                              end
                              else begin
                                PMAX=1'b0;
                               end
                              end
                              end
                  if(MANCHE==2'b01) begin
                      up=mossap;
                      us=2'b00;
                    end
                    else if(MANCHE==2'b10) begin
                      up=2'b00;
                      us=mossas;
                    end
                    else begin
                      us=2'b00;
                      up=2'b00;
                    end
                            end
                           end
                       endmodule
module predictor(input wire request, result, clk, taken, output reg prediction);
  //reg [3:0] history_table [15:0];
  reg [1:0] counter;
  //reg [3:0] history_index;
  //reg last_taken;
  initial begin
    counter = 2'b11;
  end
  
  always @(posedge clk) begin
    if (request) begin
      if(counter == 2'b00 | counter == 2'b01) begin prediction = 0; end
      if(counter == 2'b10 | counter == 2'b11) begin prediction = 1; end
    end
  end
  always @(posedge clk) begin
      if (result) begin
        if (taken) begin
          if(counter != 2'b11)  begin 
          counter = counter + 1;
	  end
        end else begin
          if(counter != 2'b00)  begin 
          counter = counter - 1;
	  end
        end
      end
  end
endmodule
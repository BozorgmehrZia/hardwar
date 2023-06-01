module predictor(input wire request, result, clk, taken, output reg prediction);
  //reg [3:0] history_table [15:0];
  reg [1:0] counter;
  //reg [3:0] history_index;
  //reg last_taken;
  initial begin
    counter = 2'b0;
  end
  
  always @(posedge clk) begin
    if (request) begin
      prediction = counter > 1;
    end
      if (result) begin
        if (taken) begin
          counter = counter + 1;
        end else begin
          counter = counter - 1;
        end
      end
  end
endmodule
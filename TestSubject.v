//TestSubject isn't related to the actual code.
module tb;
  reg [7:0] hehe[0:1][0:3];
  
  
  initial begin
    for(integer i = 0; i < 2; i += 1) begin
      for(integer j = 0; j < 4; j += 1) begin
        hehe[i][j] = 100*i + 10*j;
        $display("hehe[%0d][%0d] = %d", i, j, hehe[i][j]);
      end
    end  
  end
endmodule
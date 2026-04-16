module parkinglot(
input clk, input reset, 
input entry_sensor, 
input exit_sensor, 
output reg [3:0] 
count,
output reg full,
output reg empty
);
parameter MAX_CAPACITY = 9;
always @(posedge clk or posedge reset) begin
if (reset) begin
count <= 0;
full <= 0; 
empty <= 1;
end else begin case ({entry_sensor, 
exit_sensor})
2'b10: begin if (count < 
MAX_CAPACITY)
count <= count + 2;
end
2'b01: begin if 
(count > 0)
count <= count - 1;
end
default: ;
endcase
full <= (count == MAX_CAPACITY); 
empty <= (count == 0);
end
end 
endmodule

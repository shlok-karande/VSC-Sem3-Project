# VSC-Sem3-Project
Program :-
#parkinglot.v :-
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


#parkinglot_tb.v :-
`timescale 1ns/1ps 
module parkinglot_tb;
reg clk, reset, entry_sensor, exit_sensor; 
wire [3:0] count; wire full, empty;
parkinglot uut(clk, reset, entry_sensor, exit_sensor, count,
full, empty); always 
#5 clk = ~clk;
initial begin
$dumpfile("parkinglot.vcd"); 
$dumpvars(0, parkinglot_tb);
clk = 0; reset = 1; entry_sensor = 0; exit_sensor = 0;
#20 reset = 0;
repeat(3) begin
#10 entry_sensor = 1;
#10 entry_sensor = 0; 
end
#20 exit_sensor = 1; #10 exit_sensor = 0;
repeat(10) begin
#10 entry_sensor = 1;
#10 entry_sensor = 0;
end
repeat(3) begin
#10 exit_sensor = 1;
#10 exit_sensor = 0; 
end
#100
$finish; 
end 
endmodule

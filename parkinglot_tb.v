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

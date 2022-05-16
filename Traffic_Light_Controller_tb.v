module Traffic_Light_Controler_tb;
reg clk,rst;
wire [2:0] light_M1,light_M2,light_MT,light_S;

Traffic_Light_Controller DUT (clk,rst,light_M1,light_M2,light_MT,light_S);

initial
$monitor ("Input clk=%b,rst=%b, Output light_M1=%b,light_M2=%b,light_MT=%b,light_S=%b",clk,rst,light_M1,light_M2,light_MT,light_S);


task reset;
begin
@(negedge clk) 
rst= 1;
@(negedge clk) 
rst= 0;
end
endtask

initial
begin
clk=1'b0;
forever #50 clk = ~clk;
end
initial
reset;

initial
#10000 $finish;

endmodule 

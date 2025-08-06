module fsm_tb;  
    reg clk = 0, rst = 1, scan_enable = 0, scan_in = 0, inp = 0;  
    wire out;  
    fsm dut (  
        .clk(clk),  
        .rst(rst),  
        .scan_in(scan_in),  
        .scan_enable(scan_enable),  
        .inp(inp),  
        .out(out) );  
    always #5 clk = ~clk;  
    initial begin   
        rst = 1; #10; rst = 0;  
        scan_enable = 1;  
        scan_in = 1; #10;  
        scan_in = 0; #10;  
        scan_in = 1; #10;  
        scan_enable = 0;  
        inp = 1; #10; 
        inp = 0; #10; 
        inp = 1; #10;  
        $finish;  
    end  
endmodule

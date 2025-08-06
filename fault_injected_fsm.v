module fault_injected_fsm (  
    input clk, rst, scan_in, scan_enable,  
    input inp,  
    output out );  
    wire q0, q1, q2, q1_faulty;  
    wire d0, d1, d2;  
    wire nq0, nq1, nq2;  
    wire s1, s2, s3;  
    wire n_inp;
    not g1(nq0, q0);  
    not g2(nq1, q1_faulty); // using faulty q1  
    not g3(nq2, q2);  
    buf fault(q1_faulty, 1'b0); // q1 stuck-at-0  
    not g4(n_inp, inp);  
    and a1(s1, q1_faulty, n_inp);  
    and a2(s2, q2, inp);  
    or  o1(d0, s1, s2);  
    and a3(d1, q0, inp);  
    and a4(d2, q1_faulty, inp);  
    scan_dff dff0 (.clk(clk), .rst(rst), .scan_in(scan_in), .scan_enable(scan_enable), .d(d0), .q(q0));  
    scan_dff dff1 (.clk(clk), .rst(rst), .scan_in(q0), .scan_enable(scan_enable), .d(d1), .q(q1));  
    scan_dff dff2 (.clk(clk), .rst(rst), .scan_in(q1), .scan_enable(scan_enable), .d(d2), .q(q2));  
  buf(out, q2);  // output
endmodule

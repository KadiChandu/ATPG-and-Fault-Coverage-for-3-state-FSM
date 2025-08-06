module fsm (
    input clk, rst, scan_in, scan_enable,
    input inp,
    output out );
    wire q0, q1, q2;
    wire d0, d1, d2;
    wire nq0, nq1, nq2;
    wire s1, s2, s3, s4, s5, s6, s7;
    wire n_inp;
    // next state logic using gate-level modeling
    not g1(nq0, q0);
    not g2(nq1, q1);
    not g3(nq2, q2);
    not g4(n_inp, inp);
    // d0 = (q1 & inp') + (q2 & inp)
    and a1(s1, q1, n_inp);
    and a2(s2, q2, inp);
    or  o1(d0, s1, s2);
    // d1 = (q0 & inp)
    and a3(d1, q0, inp);
    // d2 = (q1 & inp)
    and a4(d2, q1, inp);
    scan_dff dff0 (.clk(clk), .rst(rst), .scan_in(scan_in), .scan_enable(scan_enable), .d(d0), .q(q0));
    scan_dff dff1 (.clk(clk), .rst(rst), .scan_in(q0),     .scan_enable(scan_enable), .d(d1), .q(q1));
    scan_dff dff2 (.clk(clk), .rst(rst), .scan_in(q1),     .scan_enable(scan_enable), .d(d2), .q(q2));
  buf(out, q2); // output
endmodule

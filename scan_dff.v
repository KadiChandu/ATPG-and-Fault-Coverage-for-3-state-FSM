module scan_dff (
    input clk, rst, scan_in, scan_enable,
    input d,
    output q );
    wire dmux_out, not_rst, d_rst;
    not NR(not_rst, rst);
    and A1(d_rst, dmux_out, not_rst);
    // Mux for scan
    wire nSE, d1, d2;
    not N1(nSE, scan_enable);
    and A2(d1, D, nSE);
    and A3(d2, scan_in, scan_enable);
    or  O1(Dmux_out, d1, d2);
    // D Flip-Flop with Reset
    wire Q_internal, nclk;
    not N2(nclk, clk);
    d_latch DL1 (.D(D_rst), .clk(nclk), .Q(Q_internal));
    d_latch DL2 (.D(Q_internal), .clk(clk), .Q(Q));
endmodule

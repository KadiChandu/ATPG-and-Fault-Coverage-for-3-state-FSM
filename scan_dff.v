module scan_dff(q, d, scan_in, scan_enable, clk, rst);
  input d, scan_in, scan_enable, clk, rst;
  output q;
  wire mux_out;
  // mux: mux_out = scan_enable ? scan_in : d 
  wire nse, and1_out, and2_out;
  not  u1(nse, scan_enable);
  and  u2(and1_out, d, nse);
  and  u3(and2_out, scan_in, scan_enable);
  or   u4(mux_out, and1_out, and2_out);
  wire clk_n;
  not u5(clk_n, clk);
  // master latch
  wire m1, m2, m3, m4;
  nand u6(m1, mux_out, clk_n);
  nand u7(m2, m1, clk_n);
  nand u8(m3, m1, m4);
    nand u9(m4, m2, m3);  // latch output
  // slave latch
  wire s1, s2, s3, s4;
  nand u10(s1, m2, clk);
  nand u11(s2, s1, clk);
  nand u12(s3, s1, s4);
    nand u13(s4, s2, s3);  // output before reset
  // async reset logic (active high)
  wire nrst, q_reset_n, q_n;
  not  u14(nrst, rst);
  nand u15(q_reset_n, s4, nrst);
  nand u16(q_n, q_reset_n, q_reset_n); // buffer
  nand u17(q, q_n, q_n);               // final output
endmodule

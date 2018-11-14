
module ALU_DW01_sub_0 ( A, B, CI, DIFF, CO );
  input [15:0] A;
  input [15:0] B;
  output [15:0] DIFF;
  input CI;
  output CO;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15;
  wire   [16:0] carry;

  FADDX2 U2_14 ( .A(A[14]), .B(n2), .CI(carry[14]), .CO(carry[15]), .S(
        DIFF[14]) );
  FADDX2 U2_13 ( .A(A[13]), .B(n3), .CI(carry[13]), .CO(carry[14]), .S(
        DIFF[13]) );
  FADDX2 U2_12 ( .A(A[12]), .B(n4), .CI(carry[12]), .CO(carry[13]), .S(
        DIFF[12]) );
  FADDX2 U2_11 ( .A(A[11]), .B(n5), .CI(carry[11]), .CO(carry[12]), .S(
        DIFF[11]) );
  FADDX2 U2_10 ( .A(A[10]), .B(n6), .CI(carry[10]), .CO(carry[11]), .S(
        DIFF[10]) );
  FADDX2 U2_9 ( .A(A[9]), .B(n7), .CI(carry[9]), .CO(carry[10]), .S(DIFF[9])
         );
  FADDX2 U2_8 ( .A(A[8]), .B(n8), .CI(carry[8]), .CO(carry[9]), .S(DIFF[8]) );
  FADDX2 U2_7 ( .A(A[7]), .B(n9), .CI(carry[7]), .CO(carry[8]), .S(DIFF[7]) );
  FADDX2 U2_6 ( .A(A[6]), .B(n10), .CI(carry[6]), .CO(carry[7]), .S(DIFF[6])
         );
  FADDX2 U2_5 ( .A(A[5]), .B(n11), .CI(carry[5]), .CO(carry[6]), .S(DIFF[5])
         );
  FADDX2 U2_4 ( .A(A[4]), .B(n12), .CI(carry[4]), .CO(carry[5]), .S(DIFF[4])
         );
  FADDX2 U2_3 ( .A(A[3]), .B(n13), .CI(carry[3]), .CO(carry[4]), .S(DIFF[3])
         );
  FADDX2 U2_2 ( .A(A[2]), .B(n14), .CI(carry[2]), .CO(carry[3]), .S(DIFF[2])
         );
  FADDX2 U2_1 ( .A(A[1]), .B(n15), .CI(carry[1]), .CO(carry[2]), .S(DIFF[1])
         );
  XNOR3X2 U1 ( .IN1(A[15]), .IN2(B[15]), .IN3(carry[15]), .Q(DIFF[15]) );
  XOR2X2 U2 ( .IN1(B[0]), .IN2(A[0]), .Q(DIFF[0]) );
  AOINVX1 U3 ( .IN(B[2]), .QN(n14) );
  AOINVX1 U4 ( .IN(B[3]), .QN(n13) );
  AOINVX1 U5 ( .IN(B[4]), .QN(n12) );
  AOINVX1 U6 ( .IN(B[5]), .QN(n11) );
  AOINVX1 U7 ( .IN(B[6]), .QN(n10) );
  AOINVX1 U8 ( .IN(B[7]), .QN(n9) );
  AOINVX1 U9 ( .IN(B[8]), .QN(n8) );
  AOINVX1 U10 ( .IN(B[9]), .QN(n7) );
  AOINVX1 U11 ( .IN(B[10]), .QN(n6) );
  AOINVX1 U12 ( .IN(B[11]), .QN(n5) );
  AOINVX1 U13 ( .IN(B[12]), .QN(n4) );
  AOINVX1 U14 ( .IN(B[13]), .QN(n3) );
  AOINVX1 U15 ( .IN(B[14]), .QN(n2) );
  AOINVX1 U16 ( .IN(B[1]), .QN(n15) );
  NAND2X0 U17 ( .IN1(B[0]), .IN2(n1), .QN(carry[1]) );
  AOINVX1 U18 ( .IN(A[0]), .QN(n1) );
endmodule


module ALU_DW01_add_0 ( A, B, CI, SUM, CO );
  input [15:0] A;
  input [15:0] B;
  output [15:0] SUM;
  input CI;
  output CO;

  wire   [15:1] carry;

  FADDX2 U1_14 ( .A(A[14]), .B(B[14]), .CI(carry[14]), .CO(carry[15]), .S(
        SUM[14]) );
  FADDX2 U1_13 ( .A(A[13]), .B(B[13]), .CI(carry[13]), .CO(carry[14]), .S(
        SUM[13]) );
  FADDX2 U1_12 ( .A(A[12]), .B(B[12]), .CI(carry[12]), .CO(carry[13]), .S(
        SUM[12]) );
  FADDX2 U1_11 ( .A(A[11]), .B(B[11]), .CI(carry[11]), .CO(carry[12]), .S(
        SUM[11]) );
  FADDX2 U1_10 ( .A(A[10]), .B(B[10]), .CI(carry[10]), .CO(carry[11]), .S(
        SUM[10]) );
  FADDX2 U1_9 ( .A(A[9]), .B(B[9]), .CI(carry[9]), .CO(carry[10]), .S(SUM[9])
         );
  FADDX2 U1_8 ( .A(A[8]), .B(B[8]), .CI(carry[8]), .CO(carry[9]), .S(SUM[8])
         );
  FADDX2 U1_7 ( .A(A[7]), .B(B[7]), .CI(carry[7]), .CO(carry[8]), .S(SUM[7])
         );
  FADDX2 U1_6 ( .A(A[6]), .B(B[6]), .CI(carry[6]), .CO(carry[7]), .S(SUM[6])
         );
  FADDX2 U1_5 ( .A(A[5]), .B(B[5]), .CI(carry[5]), .CO(carry[6]), .S(SUM[5])
         );
  FADDX2 U1_4 ( .A(A[4]), .B(B[4]), .CI(carry[4]), .CO(carry[5]), .S(SUM[4])
         );
  FADDX2 U1_3 ( .A(A[3]), .B(B[3]), .CI(carry[3]), .CO(carry[4]), .S(SUM[3])
         );
  FADDX2 U1_2 ( .A(A[2]), .B(B[2]), .CI(carry[2]), .CO(carry[3]), .S(SUM[2])
         );
  FADDX2 U1_1 ( .A(A[1]), .B(B[1]), .CI(carry[1]), .CO(carry[2]), .S(SUM[1])
         );
  XOR3X2 U1_15 ( .IN1(A[15]), .IN2(B[15]), .IN3(carry[15]), .Q(SUM[15]) );
  AND2X1 U1 ( .IN1(A[0]), .IN2(B[0]), .Q(carry[1]) );
  XOR2X2 U2 ( .IN1(B[0]), .IN2(A[0]), .Q(SUM[0]) );
endmodule


module ALU ( IN1, IN2, OUT, OUT_EN, OpControl );
  input [15:0] IN1;
  input [15:0] IN2;
  output [15:0] OUT;
  input [2:0] OpControl;
  input OUT_EN;
  wire   N71, N72, N73, N74, N75, N76, N77, N78, N79, N80, N81, N82, N83, N84,
         N85, N86, N88, N89, N90, N91, N92, N93, N94, N95, N96, N97, N98, N99,
         N100, N101, N102, N103, n22, n23, n25, n26, n27, n28, n30, n31, n33,
         n34, n36, n38, n39, n41, n43, n44, n46, n48, n49, n51, n53, n54, n56,
         n58, n59, n61, n63, n64, n66, n68, n69, n71, n73, n74, n76, n78, n79,
         n81, n83, n84, n86, n88, n89, n91, n93, n94, n96, n98, n99, n101,
         n103, n104, n106, n107, n112, n129, n130, n131, n132, n133, n134,
         n135, n136, n137, n138, n139, n140, n141, n142, n143, n144, n145,
         n146, n147, n148, n149, n150, n151, n152, n153, n154, n155, n156,
         n157, n158, n159, n160, n161, n162, n163, n164, n165, n166, n167,
         n168, n169, n170, n171, n172, n173, n174, n175, n176, n177, n178,
         n179, n180, n181, n182, n183, n184, n185, n186, n187, n188, n189,
         n190, n191, n192, n193, n194, n195, n196, n197, n198, n199, n200,
         n201, n202, n203, n204, n205, n206, n207, n208, n209;
  tri   [15:0] OUT;

  TNBUFFHX8 \OUT_tri[0]  ( .IN(n160), .ENB(OUT_EN), .Q(OUT[0]) );
  TNBUFFHX8 \OUT_tri[1]  ( .IN(n159), .ENB(OUT_EN), .Q(OUT[1]) );
  TNBUFFHX8 \OUT_tri[2]  ( .IN(n158), .ENB(OUT_EN), .Q(OUT[2]) );
  TNBUFFHX8 \OUT_tri[3]  ( .IN(n157), .ENB(OUT_EN), .Q(OUT[3]) );
  TNBUFFHX8 \OUT_tri[4]  ( .IN(n156), .ENB(OUT_EN), .Q(OUT[4]) );
  TNBUFFHX8 \OUT_tri[5]  ( .IN(n155), .ENB(OUT_EN), .Q(OUT[5]) );
  TNBUFFHX8 \OUT_tri[6]  ( .IN(n154), .ENB(OUT_EN), .Q(OUT[6]) );
  TNBUFFHX8 \OUT_tri[7]  ( .IN(n153), .ENB(OUT_EN), .Q(OUT[7]) );
  TNBUFFHX8 \OUT_tri[8]  ( .IN(n152), .ENB(OUT_EN), .Q(OUT[8]) );
  TNBUFFHX8 \OUT_tri[9]  ( .IN(n151), .ENB(OUT_EN), .Q(OUT[9]) );
  TNBUFFHX8 \OUT_tri[10]  ( .IN(n150), .ENB(OUT_EN), .Q(OUT[10]) );
  TNBUFFHX8 \OUT_tri[11]  ( .IN(n149), .ENB(OUT_EN), .Q(OUT[11]) );
  TNBUFFHX8 \OUT_tri[12]  ( .IN(n148), .ENB(OUT_EN), .Q(OUT[12]) );
  TNBUFFHX8 \OUT_tri[13]  ( .IN(n147), .ENB(OUT_EN), .Q(OUT[13]) );
  TNBUFFHX8 \OUT_tri[14]  ( .IN(n146), .ENB(OUT_EN), .Q(OUT[14]) );
  TNBUFFHX8 \OUT_tri[15]  ( .IN(n145), .ENB(OUT_EN), .Q(OUT[15]) );
  AO22X2 U3 ( .IN1(N97), .IN2(n169), .IN3(N80), .IN4(n27), .Q(n25) );
  AO221X2 U7 ( .IN1(n28), .IN2(n198), .IN3(IN2[9]), .IN4(n172), .IN5(n167), 
        .Q(n23) );
  AO22X2 U8 ( .IN1(IN2[9]), .IN2(n163), .IN3(n175), .IN4(n198), .Q(n22) );
  AO22X2 U11 ( .IN1(N96), .IN2(n26), .IN3(N79), .IN4(n171), .Q(n36) );
  AO221X2 U13 ( .IN1(n165), .IN2(n199), .IN3(IN2[8]), .IN4(n172), .IN5(n31), 
        .Q(n34) );
  AO22X2 U14 ( .IN1(IN2[8]), .IN2(n162), .IN3(n175), .IN4(n199), .Q(n33) );
  AO22X2 U17 ( .IN1(N95), .IN2(n169), .IN3(N78), .IN4(n27), .Q(n41) );
  AO221X2 U19 ( .IN1(n28), .IN2(n200), .IN3(IN2[7]), .IN4(n172), .IN5(n167), 
        .Q(n39) );
  AO22X2 U20 ( .IN1(IN2[7]), .IN2(n163), .IN3(n175), .IN4(n200), .Q(n38) );
  AO22X2 U23 ( .IN1(N94), .IN2(n26), .IN3(N77), .IN4(n171), .Q(n46) );
  AO221X2 U25 ( .IN1(n165), .IN2(n201), .IN3(IN2[6]), .IN4(n172), .IN5(n31), 
        .Q(n44) );
  AO22X2 U26 ( .IN1(IN2[6]), .IN2(n162), .IN3(n175), .IN4(n201), .Q(n43) );
  AO22X2 U29 ( .IN1(N93), .IN2(n169), .IN3(N76), .IN4(n27), .Q(n51) );
  AO221X2 U31 ( .IN1(n28), .IN2(n202), .IN3(IN2[5]), .IN4(n172), .IN5(n167), 
        .Q(n49) );
  AO22X2 U32 ( .IN1(IN2[5]), .IN2(n163), .IN3(n174), .IN4(n202), .Q(n48) );
  AO22X2 U35 ( .IN1(N92), .IN2(n26), .IN3(N75), .IN4(n171), .Q(n56) );
  AO221X2 U37 ( .IN1(n165), .IN2(n203), .IN3(IN2[4]), .IN4(n172), .IN5(n31), 
        .Q(n54) );
  AO22X2 U38 ( .IN1(IN2[4]), .IN2(n162), .IN3(n174), .IN4(n203), .Q(n53) );
  AO22X2 U41 ( .IN1(N91), .IN2(n169), .IN3(N74), .IN4(n27), .Q(n61) );
  AO221X2 U43 ( .IN1(n28), .IN2(n204), .IN3(IN2[3]), .IN4(n172), .IN5(n167), 
        .Q(n59) );
  AO22X2 U44 ( .IN1(IN2[3]), .IN2(n163), .IN3(n174), .IN4(n204), .Q(n58) );
  AO22X2 U47 ( .IN1(N90), .IN2(n26), .IN3(N73), .IN4(n171), .Q(n66) );
  AO221X2 U49 ( .IN1(n165), .IN2(n205), .IN3(IN2[2]), .IN4(n172), .IN5(n31), 
        .Q(n64) );
  AO22X2 U50 ( .IN1(IN2[2]), .IN2(n162), .IN3(n174), .IN4(n205), .Q(n63) );
  AO22X2 U53 ( .IN1(N89), .IN2(n169), .IN3(N72), .IN4(n27), .Q(n71) );
  AO221X2 U55 ( .IN1(n28), .IN2(n206), .IN3(IN2[1]), .IN4(n173), .IN5(n167), 
        .Q(n69) );
  AO22X2 U56 ( .IN1(IN2[1]), .IN2(n163), .IN3(n174), .IN4(n206), .Q(n68) );
  AO22X2 U59 ( .IN1(N103), .IN2(n26), .IN3(N86), .IN4(n171), .Q(n76) );
  AO221X2 U61 ( .IN1(n165), .IN2(n192), .IN3(IN2[15]), .IN4(n173), .IN5(n31), 
        .Q(n74) );
  AO22X2 U62 ( .IN1(IN2[15]), .IN2(n162), .IN3(n174), .IN4(n192), .Q(n73) );
  AO22X2 U65 ( .IN1(N102), .IN2(n169), .IN3(N85), .IN4(n27), .Q(n81) );
  AO221X2 U67 ( .IN1(n28), .IN2(n193), .IN3(IN2[14]), .IN4(n173), .IN5(n167), 
        .Q(n79) );
  AO22X2 U68 ( .IN1(IN2[14]), .IN2(n163), .IN3(n174), .IN4(n193), .Q(n78) );
  AO22X2 U71 ( .IN1(N101), .IN2(n26), .IN3(N84), .IN4(n171), .Q(n86) );
  AO221X2 U73 ( .IN1(n165), .IN2(n194), .IN3(IN2[13]), .IN4(n173), .IN5(n31), 
        .Q(n84) );
  AO22X2 U74 ( .IN1(IN2[13]), .IN2(n162), .IN3(n174), .IN4(n194), .Q(n83) );
  AO22X2 U77 ( .IN1(N100), .IN2(n169), .IN3(N83), .IN4(n27), .Q(n91) );
  AO221X2 U79 ( .IN1(n28), .IN2(n195), .IN3(IN2[12]), .IN4(n173), .IN5(n167), 
        .Q(n89) );
  AO22X2 U80 ( .IN1(IN2[12]), .IN2(n163), .IN3(n174), .IN4(n195), .Q(n88) );
  AO22X2 U83 ( .IN1(N99), .IN2(n26), .IN3(N82), .IN4(n171), .Q(n96) );
  AO221X2 U85 ( .IN1(n165), .IN2(n196), .IN3(IN2[11]), .IN4(n173), .IN5(n31), 
        .Q(n94) );
  AO22X2 U86 ( .IN1(IN2[11]), .IN2(n162), .IN3(n175), .IN4(n196), .Q(n93) );
  AO22X2 U89 ( .IN1(N98), .IN2(n169), .IN3(N81), .IN4(n27), .Q(n101) );
  AO221X2 U91 ( .IN1(n28), .IN2(n197), .IN3(IN2[10]), .IN4(n173), .IN5(n167), 
        .Q(n99) );
  AO22X2 U92 ( .IN1(IN2[10]), .IN2(n163), .IN3(n175), .IN4(n197), .Q(n98) );
  AO22X2 U95 ( .IN1(N88), .IN2(n26), .IN3(N71), .IN4(n171), .Q(n106) );
  AO221X2 U100 ( .IN1(n165), .IN2(n207), .IN3(IN2[0]), .IN4(n173), .IN5(n31), 
        .Q(n104) );
  AO22X2 U103 ( .IN1(IN2[0]), .IN2(n162), .IN3(n175), .IN4(n207), .Q(n103) );
  ALU_DW01_sub_0 sub_27 ( .A(IN1), .B(IN2), .CI(1'b0), .DIFF({N103, N102, N101, 
        N100, N99, N98, N97, N96, N95, N94, N93, N92, N91, N90, N89, N88}) );
  ALU_DW01_add_0 add_26 ( .A(IN1), .B(IN2), .CI(1'b0), .SUM({N86, N85, N84, 
        N83, N82, N81, N80, N79, N78, N77, N76, N75, N74, N73, N72, N71}) );
  AO221X2 U111 ( .IN1(IN1[15]), .IN2(n73), .IN3(n74), .IN4(n176), .IN5(n76), 
        .Q(n129) );
  AO221X2 U112 ( .IN1(IN1[14]), .IN2(n78), .IN3(n79), .IN4(n177), .IN5(n81), 
        .Q(n130) );
  AO221X2 U113 ( .IN1(IN1[13]), .IN2(n83), .IN3(n84), .IN4(n178), .IN5(n86), 
        .Q(n131) );
  AO221X2 U114 ( .IN1(IN1[12]), .IN2(n88), .IN3(n89), .IN4(n179), .IN5(n91), 
        .Q(n132) );
  AO221X2 U115 ( .IN1(IN1[11]), .IN2(n93), .IN3(n94), .IN4(n180), .IN5(n96), 
        .Q(n133) );
  AO221X2 U116 ( .IN1(IN1[10]), .IN2(n98), .IN3(n99), .IN4(n181), .IN5(n101), 
        .Q(n134) );
  AO221X2 U117 ( .IN1(IN1[9]), .IN2(n22), .IN3(n23), .IN4(n182), .IN5(n25), 
        .Q(n135) );
  AO221X2 U118 ( .IN1(IN1[8]), .IN2(n33), .IN3(n34), .IN4(n183), .IN5(n36), 
        .Q(n136) );
  AO221X2 U119 ( .IN1(IN1[7]), .IN2(n38), .IN3(n39), .IN4(n184), .IN5(n41), 
        .Q(n137) );
  AO221X2 U120 ( .IN1(IN1[6]), .IN2(n43), .IN3(n44), .IN4(n185), .IN5(n46), 
        .Q(n138) );
  AO221X2 U121 ( .IN1(IN1[5]), .IN2(n48), .IN3(n49), .IN4(n186), .IN5(n51), 
        .Q(n139) );
  AO221X2 U122 ( .IN1(IN1[4]), .IN2(n53), .IN3(n54), .IN4(n187), .IN5(n56), 
        .Q(n140) );
  AO221X2 U123 ( .IN1(IN1[3]), .IN2(n58), .IN3(n59), .IN4(n188), .IN5(n61), 
        .Q(n141) );
  AO221X2 U124 ( .IN1(IN1[2]), .IN2(n63), .IN3(n64), .IN4(n189), .IN5(n66), 
        .Q(n142) );
  AO221X2 U125 ( .IN1(IN1[1]), .IN2(n68), .IN3(n69), .IN4(n190), .IN5(n71), 
        .Q(n143) );
  AO221X2 U126 ( .IN1(IN1[0]), .IN2(n103), .IN3(n104), .IN4(n191), .IN5(n106), 
        .Q(n144) );
  OA21X1 U127 ( .IN1(OpControl[0]), .IN2(n208), .IN3(n112), .Q(n161) );
  NOR2X1 U128 ( .IN1(n164), .IN2(OpControl[2]), .QN(n31) );
  NOR2X1 U129 ( .IN1(n208), .IN2(OpControl[1]), .QN(n173) );
  NBUFFX16 U130 ( .IN(n129), .Q(n145) );
  NBUFFX16 U131 ( .IN(n130), .Q(n146) );
  NBUFFX16 U132 ( .IN(n131), .Q(n147) );
  NBUFFX16 U133 ( .IN(n132), .Q(n148) );
  NBUFFX16 U134 ( .IN(n133), .Q(n149) );
  NBUFFX16 U135 ( .IN(n134), .Q(n150) );
  NBUFFX16 U136 ( .IN(n135), .Q(n151) );
  NBUFFX16 U137 ( .IN(n136), .Q(n152) );
  NBUFFX16 U138 ( .IN(n137), .Q(n153) );
  NBUFFX16 U139 ( .IN(n138), .Q(n154) );
  NBUFFX16 U140 ( .IN(n139), .Q(n155) );
  NBUFFX16 U141 ( .IN(n140), .Q(n156) );
  NBUFFX16 U142 ( .IN(n141), .Q(n157) );
  NBUFFX16 U143 ( .IN(n142), .Q(n158) );
  NBUFFX16 U144 ( .IN(n143), .Q(n159) );
  NBUFFX16 U145 ( .IN(n144), .Q(n160) );
  AOINVX1 U146 ( .IN(n168), .QN(n169) );
  AOBUFX1 U147 ( .IN(n30), .Q(n174) );
  AOBUFX1 U148 ( .IN(n30), .Q(n172) );
  AOBUFX1 U149 ( .IN(n30), .Q(n175) );
  AOINVX1 U150 ( .IN(n164), .QN(n165) );
  AOINVX1 U151 ( .IN(n161), .QN(n163) );
  AOINVX1 U152 ( .IN(n161), .QN(n162) );
  AOINVX1 U153 ( .IN(n166), .QN(n167) );
  AOINVX1 U154 ( .IN(n26), .QN(n168) );
  ISOLANDX1 U155 ( .D(n107), .ISO(n209), .Q(n26) );
  AOINVX1 U156 ( .IN(n170), .QN(n171) );
  AOINVX1 U157 ( .IN(IN1[15]), .QN(n176) );
  AOINVX1 U158 ( .IN(IN1[14]), .QN(n177) );
  AOINVX1 U159 ( .IN(IN1[13]), .QN(n178) );
  AOINVX1 U160 ( .IN(IN1[12]), .QN(n179) );
  AOINVX1 U161 ( .IN(IN1[11]), .QN(n180) );
  AOINVX1 U162 ( .IN(IN1[10]), .QN(n181) );
  AOINVX1 U163 ( .IN(IN1[9]), .QN(n182) );
  AOINVX1 U164 ( .IN(IN1[8]), .QN(n183) );
  AOINVX1 U165 ( .IN(IN1[7]), .QN(n184) );
  AOINVX1 U166 ( .IN(IN1[6]), .QN(n185) );
  AOINVX1 U167 ( .IN(IN1[5]), .QN(n186) );
  AOINVX1 U168 ( .IN(IN1[4]), .QN(n187) );
  AOINVX1 U169 ( .IN(IN1[3]), .QN(n188) );
  AOINVX1 U170 ( .IN(IN1[2]), .QN(n189) );
  AOINVX1 U171 ( .IN(IN1[1]), .QN(n190) );
  AOINVX1 U172 ( .IN(IN1[0]), .QN(n191) );
  NOR2X1 U173 ( .IN1(n208), .IN2(OpControl[1]), .QN(n30) );
  NAND3X0 U174 ( .IN1(OpControl[0]), .IN2(n208), .IN3(OpControl[1]), .QN(n112)
         );
  AOINVX1 U175 ( .IN(n31), .QN(n166) );
  NOR2X1 U176 ( .IN1(OpControl[1]), .IN2(OpControl[2]), .QN(n107) );
  AOINVX1 U177 ( .IN(n28), .QN(n164) );
  ISOLANDX1 U178 ( .D(OpControl[1]), .ISO(OpControl[0]), .Q(n28) );
  AOINVX1 U179 ( .IN(n27), .QN(n170) );
  ISOLANDX1 U180 ( .D(n107), .ISO(OpControl[0]), .Q(n27) );
  AOINVX1 U181 ( .IN(OpControl[2]), .QN(n208) );
  AOINVX1 U182 ( .IN(OpControl[0]), .QN(n209) );
  AOINVX1 U183 ( .IN(IN2[15]), .QN(n192) );
  AOINVX1 U184 ( .IN(IN2[14]), .QN(n193) );
  AOINVX1 U185 ( .IN(IN2[13]), .QN(n194) );
  AOINVX1 U186 ( .IN(IN2[12]), .QN(n195) );
  AOINVX1 U187 ( .IN(IN2[11]), .QN(n196) );
  AOINVX1 U188 ( .IN(IN2[10]), .QN(n197) );
  AOINVX1 U189 ( .IN(IN2[9]), .QN(n198) );
  AOINVX1 U190 ( .IN(IN2[8]), .QN(n199) );
  AOINVX1 U191 ( .IN(IN2[7]), .QN(n200) );
  AOINVX1 U192 ( .IN(IN2[6]), .QN(n201) );
  AOINVX1 U193 ( .IN(IN2[5]), .QN(n202) );
  AOINVX1 U194 ( .IN(IN2[4]), .QN(n203) );
  AOINVX1 U195 ( .IN(IN2[3]), .QN(n204) );
  AOINVX1 U196 ( .IN(IN2[2]), .QN(n205) );
  AOINVX1 U197 ( .IN(IN2[1]), .QN(n206) );
  AOINVX1 U198 ( .IN(IN2[0]), .QN(n207) );
endmodule


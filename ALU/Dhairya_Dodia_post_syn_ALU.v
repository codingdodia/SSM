
module alu_DW01_sub_0 ( A, B, CI, DIFF, CO );
  input [15:0] A;
  input [15:0] B;
  output [15:0] DIFF;
  input CI;
  output CO;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17;
  wire   [16:0] carry;

  XOR3X1 U2_15 ( .IN1(A[15]), .IN2(n2), .IN3(carry[15]), .Q(DIFF[15]) );
  FADDX1 U2_14 ( .A(A[14]), .B(n3), .CI(carry[14]), .CO(carry[15]), .S(
        DIFF[14]) );
  FADDX1 U2_13 ( .A(A[13]), .B(n4), .CI(carry[13]), .CO(carry[14]), .S(
        DIFF[13]) );
  FADDX1 U2_12 ( .A(A[12]), .B(n5), .CI(carry[12]), .CO(carry[13]), .S(
        DIFF[12]) );
  FADDX1 U2_11 ( .A(A[11]), .B(n6), .CI(carry[11]), .CO(carry[12]), .S(
        DIFF[11]) );
  FADDX1 U2_10 ( .A(A[10]), .B(n7), .CI(carry[10]), .CO(carry[11]), .S(
        DIFF[10]) );
  FADDX1 U2_9 ( .A(A[9]), .B(n8), .CI(carry[9]), .CO(carry[10]), .S(DIFF[9])
         );
  FADDX1 U2_8 ( .A(A[8]), .B(n9), .CI(carry[8]), .CO(carry[9]), .S(DIFF[8]) );
  FADDX1 U2_7 ( .A(A[7]), .B(n10), .CI(carry[7]), .CO(carry[8]), .S(DIFF[7])
         );
  FADDX1 U2_6 ( .A(A[6]), .B(n11), .CI(carry[6]), .CO(carry[7]), .S(DIFF[6])
         );
  FADDX1 U2_5 ( .A(A[5]), .B(n12), .CI(carry[5]), .CO(carry[6]), .S(DIFF[5])
         );
  FADDX1 U2_4 ( .A(A[4]), .B(n13), .CI(carry[4]), .CO(carry[5]), .S(DIFF[4])
         );
  FADDX1 U2_3 ( .A(A[3]), .B(n14), .CI(carry[3]), .CO(carry[4]), .S(DIFF[3])
         );
  FADDX1 U2_2 ( .A(A[2]), .B(n15), .CI(carry[2]), .CO(carry[3]), .S(DIFF[2])
         );
  FADDX1 U2_1 ( .A(A[1]), .B(n16), .CI(carry[1]), .CO(carry[2]), .S(DIFF[1])
         );
  XOR2X1 U1 ( .IN1(n1), .IN2(n17), .Q(DIFF[0]) );
  INVX0 U2 ( .IN(B[1]), .QN(n16) );
  NAND2X0 U3 ( .IN1(B[0]), .IN2(n1), .QN(carry[1]) );
  INVX0 U4 ( .IN(B[2]), .QN(n15) );
  INVX0 U5 ( .IN(B[3]), .QN(n14) );
  INVX0 U6 ( .IN(B[4]), .QN(n13) );
  INVX0 U7 ( .IN(B[5]), .QN(n12) );
  INVX0 U8 ( .IN(B[6]), .QN(n11) );
  INVX0 U9 ( .IN(B[7]), .QN(n10) );
  INVX0 U10 ( .IN(B[8]), .QN(n9) );
  INVX0 U11 ( .IN(B[9]), .QN(n8) );
  INVX0 U12 ( .IN(B[10]), .QN(n7) );
  INVX0 U13 ( .IN(B[11]), .QN(n6) );
  INVX0 U14 ( .IN(B[12]), .QN(n5) );
  INVX0 U15 ( .IN(B[13]), .QN(n4) );
  INVX0 U16 ( .IN(B[14]), .QN(n3) );
  INVX0 U17 ( .IN(B[15]), .QN(n2) );
  INVX0 U18 ( .IN(B[0]), .QN(n17) );
  INVX0 U19 ( .IN(A[0]), .QN(n1) );
endmodule


module alu_DW01_add_0 ( A, B, CI, SUM, CO );
  input [15:0] A;
  input [15:0] B;
  output [15:0] SUM;
  input CI;
  output CO;

  wire   [15:1] carry;

  XOR3X1 U1_15 ( .IN1(A[15]), .IN2(B[15]), .IN3(carry[15]), .Q(SUM[15]) );
  FADDX1 U1_14 ( .A(A[14]), .B(B[14]), .CI(carry[14]), .CO(carry[15]), .S(
        SUM[14]) );
  FADDX1 U1_13 ( .A(A[13]), .B(B[13]), .CI(carry[13]), .CO(carry[14]), .S(
        SUM[13]) );
  FADDX1 U1_12 ( .A(A[12]), .B(B[12]), .CI(carry[12]), .CO(carry[13]), .S(
        SUM[12]) );
  FADDX1 U1_11 ( .A(A[11]), .B(B[11]), .CI(carry[11]), .CO(carry[12]), .S(
        SUM[11]) );
  FADDX1 U1_10 ( .A(A[10]), .B(B[10]), .CI(carry[10]), .CO(carry[11]), .S(
        SUM[10]) );
  FADDX1 U1_9 ( .A(A[9]), .B(B[9]), .CI(carry[9]), .CO(carry[10]), .S(SUM[9])
         );
  FADDX1 U1_8 ( .A(A[8]), .B(B[8]), .CI(carry[8]), .CO(carry[9]), .S(SUM[8])
         );
  FADDX1 U1_7 ( .A(A[7]), .B(B[7]), .CI(carry[7]), .CO(carry[8]), .S(SUM[7])
         );
  FADDX1 U1_6 ( .A(A[6]), .B(B[6]), .CI(carry[6]), .CO(carry[7]), .S(SUM[6])
         );
  FADDX1 U1_5 ( .A(A[5]), .B(B[5]), .CI(carry[5]), .CO(carry[6]), .S(SUM[5])
         );
  FADDX1 U1_4 ( .A(A[4]), .B(B[4]), .CI(carry[4]), .CO(carry[5]), .S(SUM[4])
         );
  FADDX1 U1_3 ( .A(A[3]), .B(B[3]), .CI(carry[3]), .CO(carry[4]), .S(SUM[3])
         );
  FADDX1 U1_2 ( .A(A[2]), .B(B[2]), .CI(carry[2]), .CO(carry[3]), .S(SUM[2])
         );
  FADDX1 U1_1 ( .A(A[1]), .B(B[1]), .CI(carry[1]), .CO(carry[2]), .S(SUM[1])
         );
  AND2X1 U1 ( .IN1(A[0]), .IN2(B[0]), .Q(carry[1]) );
  XOR2X1 U2 ( .IN1(B[0]), .IN2(A[0]), .Q(SUM[0]) );
endmodule


module alu ( bus_in1, bus_in2, control, reset, bus_out );
  input [15:0] bus_in1;
  input [15:0] bus_in2;
  input [3:0] control;
  output [15:0] bus_out;
  input reset;
  wire   N57, N58, N59, N60, N61, N62, N63, N64, N65, N66, N67, N68, N69, N70,
         N71, N72, N73, N74, N75, N76, N77, N78, N79, N80, N81, N82, N83, N84,
         N85, N86, N87, N88, n43, n44, n49, n50, n51, n53, n55, n56, n57, n58,
         n59, n60, n61, n62, n63, n64, n65, n66, n67, n68, n69, n70, n71, n72,
         n73, n74, n75, n76, n77, n78, n79, n80, n81, n82, n83, n84, n85, n86,
         n87, n88, n89, n90, n91, n92, n93, n94, n95, n96, n97, n98, n99, n100,
         n101, n102, n103, n104, n105, n106, n107, n108, n109, n110, n111,
         n112, n113, n114, n115, n116, n117, n118, n119, n120, n121, n122,
         n123, n124, n125, n126, n127, n128, n129, n130, n131, n132, n133,
         n134, n135, n136, n137, n138, n139, n140, n141, n142, n143, n144,
         n145, n146, n147, n148, n149, n150, n151, n152, n153, n154, n155,
         n156, n157, n158, n159, n160, n161, n162, n163;

  alu_DW01_sub_0 sub_20 ( .A(bus_in1), .B(bus_in2), .CI(1'b0), .DIFF({N88, N87, 
        N86, N85, N84, N83, N82, N81, N80, N79, N78, N77, N76, N75, N74, N73})
         );
  alu_DW01_add_0 add_19 ( .A(bus_in1), .B(bus_in2), .CI(1'b0), .SUM({N72, N71, 
        N70, N69, N68, N67, N66, N65, N64, N63, N62, N61, N60, N59, N58, N57})
         );
  AND3X1 U129 ( .IN1(control[0]), .IN2(n161), .IN3(control[1]), .Q(n115) );
  AND3X1 U130 ( .IN1(n163), .IN2(n161), .IN3(control[1]), .Q(n116) );
  NAND3X1 U131 ( .IN1(control[1]), .IN2(control[0]), .IN3(control[2]), .QN(
        n117) );
  OA21X1 U132 ( .IN1(n161), .IN2(control[1]), .IN3(n117), .Q(n118) );
  AND3X1 U133 ( .IN1(n162), .IN2(n161), .IN3(control[0]), .Q(n119) );
  NOR2X2 U134 ( .IN1(reset), .IN2(control[3]), .QN(n120) );
  NBUFFX2 U135 ( .IN(n53), .Q(n122) );
  NBUFFX2 U136 ( .IN(n53), .Q(n121) );
  NBUFFX2 U137 ( .IN(n53), .Q(n124) );
  NBUFFX2 U138 ( .IN(n53), .Q(n123) );
  NBUFFX2 U139 ( .IN(n51), .Q(n126) );
  NBUFFX2 U140 ( .IN(n51), .Q(n125) );
  NBUFFX2 U141 ( .IN(n51), .Q(n127) );
  NBUFFX2 U142 ( .IN(n51), .Q(n128) );
  OA221X1 U143 ( .IN1(bus_in1[0]), .IN2(n121), .IN3(n118), .IN4(n144), .IN5(
        n125), .Q(n113) );
  OA221X1 U144 ( .IN1(bus_in1[1]), .IN2(n121), .IN3(n118), .IN4(n143), .IN5(
        n125), .Q(n85) );
  OA221X1 U145 ( .IN1(bus_in1[2]), .IN2(n122), .IN3(n118), .IN4(n142), .IN5(
        n126), .Q(n81) );
  OA221X1 U146 ( .IN1(bus_in1[3]), .IN2(n122), .IN3(n118), .IN4(n141), .IN5(
        n126), .Q(n77) );
  OA221X1 U147 ( .IN1(bus_in1[4]), .IN2(n122), .IN3(n118), .IN4(n140), .IN5(
        n126), .Q(n73) );
  OA221X1 U148 ( .IN1(bus_in1[5]), .IN2(n122), .IN3(n118), .IN4(n139), .IN5(
        n126), .Q(n69) );
  OA221X1 U149 ( .IN1(bus_in1[6]), .IN2(n122), .IN3(n118), .IN4(n138), .IN5(
        n126), .Q(n65) );
  OA221X1 U150 ( .IN1(bus_in1[7]), .IN2(n122), .IN3(n118), .IN4(n137), .IN5(
        n126), .Q(n61) );
  OA221X1 U151 ( .IN1(bus_in1[8]), .IN2(n122), .IN3(n118), .IN4(n136), .IN5(
        n126), .Q(n57) );
  OA221X1 U152 ( .IN1(bus_in1[9]), .IN2(n122), .IN3(n118), .IN4(n135), .IN5(
        n126), .Q(n49) );
  OA221X1 U153 ( .IN1(bus_in1[10]), .IN2(n121), .IN3(n118), .IN4(n134), .IN5(
        n125), .Q(n109) );
  OA221X1 U154 ( .IN1(bus_in1[11]), .IN2(n121), .IN3(n118), .IN4(n133), .IN5(
        n125), .Q(n105) );
  OA221X1 U155 ( .IN1(bus_in1[12]), .IN2(n121), .IN3(n118), .IN4(n132), .IN5(
        n125), .Q(n101) );
  OA221X1 U156 ( .IN1(bus_in1[13]), .IN2(n121), .IN3(n118), .IN4(n131), .IN5(
        n125), .Q(n97) );
  OA221X1 U157 ( .IN1(bus_in1[14]), .IN2(n121), .IN3(n118), .IN4(n130), .IN5(
        n125), .Q(n93) );
  OA221X1 U158 ( .IN1(bus_in1[15]), .IN2(n121), .IN3(n118), .IN4(n129), .IN5(
        n125), .Q(n89) );
  NAND3X0 U159 ( .IN1(control[1]), .IN2(n163), .IN3(control[2]), .QN(n53) );
  NAND3X0 U160 ( .IN1(control[0]), .IN2(n162), .IN3(control[2]), .QN(n51) );
  OA22X1 U161 ( .IN1(bus_in1[0]), .IN2(n117), .IN3(n124), .IN4(n144), .Q(n114)
         );
  OA22X1 U162 ( .IN1(bus_in1[1]), .IN2(n117), .IN3(n123), .IN4(n143), .Q(n86)
         );
  OA22X1 U163 ( .IN1(bus_in1[2]), .IN2(n117), .IN3(n123), .IN4(n142), .Q(n82)
         );
  OA22X1 U164 ( .IN1(bus_in1[3]), .IN2(n117), .IN3(n123), .IN4(n141), .Q(n78)
         );
  OA22X1 U165 ( .IN1(bus_in1[4]), .IN2(n117), .IN3(n123), .IN4(n140), .Q(n74)
         );
  OA22X1 U166 ( .IN1(bus_in1[5]), .IN2(n117), .IN3(n123), .IN4(n139), .Q(n70)
         );
  OA22X1 U167 ( .IN1(bus_in1[6]), .IN2(n117), .IN3(n123), .IN4(n138), .Q(n66)
         );
  OA22X1 U168 ( .IN1(bus_in1[7]), .IN2(n117), .IN3(n124), .IN4(n137), .Q(n62)
         );
  OA22X1 U169 ( .IN1(bus_in1[8]), .IN2(n117), .IN3(n124), .IN4(n136), .Q(n58)
         );
  OA22X1 U170 ( .IN1(bus_in1[9]), .IN2(n117), .IN3(n124), .IN4(n135), .Q(n50)
         );
  OA22X1 U171 ( .IN1(bus_in1[10]), .IN2(n117), .IN3(n124), .IN4(n134), .Q(n110) );
  OA22X1 U172 ( .IN1(bus_in1[11]), .IN2(n117), .IN3(n124), .IN4(n133), .Q(n106) );
  OA22X1 U173 ( .IN1(bus_in1[12]), .IN2(n117), .IN3(n124), .IN4(n132), .Q(n102) );
  OA22X1 U174 ( .IN1(bus_in1[13]), .IN2(n117), .IN3(n124), .IN4(n131), .Q(n98)
         );
  OA22X1 U175 ( .IN1(bus_in1[14]), .IN2(n117), .IN3(n123), .IN4(n130), .Q(n94)
         );
  OA22X1 U176 ( .IN1(bus_in1[15]), .IN2(n117), .IN3(n123), .IN4(n129), .Q(n90)
         );
  OA21X1 U177 ( .IN1(n111), .IN2(n112), .IN3(n120), .Q(bus_out[0]) );
  OAI222X1 U178 ( .IN1(n113), .IN2(n160), .IN3(bus_in2[0]), .IN4(n114), .IN5(
        n128), .IN6(n144), .QN(n111) );
  AO222X1 U179 ( .IN1(N73), .IN2(n116), .IN3(n115), .IN4(n144), .IN5(N57), 
        .IN6(n119), .Q(n112) );
  INVX0 U180 ( .IN(bus_in2[0]), .QN(n160) );
  OA21X1 U181 ( .IN1(n83), .IN2(n84), .IN3(n120), .Q(bus_out[1]) );
  OAI222X1 U182 ( .IN1(n85), .IN2(n159), .IN3(bus_in2[1]), .IN4(n86), .IN5(
        n127), .IN6(n143), .QN(n83) );
  AO222X1 U183 ( .IN1(N74), .IN2(n116), .IN3(n115), .IN4(n143), .IN5(N58), 
        .IN6(n119), .Q(n84) );
  INVX0 U184 ( .IN(bus_in2[1]), .QN(n159) );
  OA21X1 U185 ( .IN1(n79), .IN2(n80), .IN3(n120), .Q(bus_out[2]) );
  OAI222X1 U186 ( .IN1(n81), .IN2(n158), .IN3(bus_in2[2]), .IN4(n82), .IN5(
        n127), .IN6(n142), .QN(n79) );
  AO222X1 U187 ( .IN1(N75), .IN2(n116), .IN3(n115), .IN4(n142), .IN5(N59), 
        .IN6(n119), .Q(n80) );
  INVX0 U188 ( .IN(bus_in2[2]), .QN(n158) );
  OA21X1 U189 ( .IN1(n75), .IN2(n76), .IN3(n120), .Q(bus_out[3]) );
  OAI222X1 U190 ( .IN1(n77), .IN2(n157), .IN3(bus_in2[3]), .IN4(n78), .IN5(
        n127), .IN6(n141), .QN(n75) );
  AO222X1 U191 ( .IN1(N76), .IN2(n116), .IN3(n115), .IN4(n141), .IN5(N60), 
        .IN6(n119), .Q(n76) );
  INVX0 U192 ( .IN(bus_in2[3]), .QN(n157) );
  OA21X1 U193 ( .IN1(n71), .IN2(n72), .IN3(n120), .Q(bus_out[4]) );
  OAI222X1 U194 ( .IN1(n73), .IN2(n156), .IN3(bus_in2[4]), .IN4(n74), .IN5(
        n127), .IN6(n140), .QN(n71) );
  AO222X1 U195 ( .IN1(N77), .IN2(n116), .IN3(n115), .IN4(n140), .IN5(N61), 
        .IN6(n119), .Q(n72) );
  INVX0 U196 ( .IN(bus_in2[4]), .QN(n156) );
  OA21X1 U197 ( .IN1(n67), .IN2(n68), .IN3(n120), .Q(bus_out[5]) );
  OAI222X1 U198 ( .IN1(n69), .IN2(n155), .IN3(bus_in2[5]), .IN4(n70), .IN5(
        n127), .IN6(n139), .QN(n67) );
  AO222X1 U199 ( .IN1(N78), .IN2(n116), .IN3(n115), .IN4(n139), .IN5(N62), 
        .IN6(n119), .Q(n68) );
  INVX0 U200 ( .IN(bus_in2[5]), .QN(n155) );
  OA21X1 U201 ( .IN1(n63), .IN2(n64), .IN3(n120), .Q(bus_out[6]) );
  OAI222X1 U202 ( .IN1(n65), .IN2(n154), .IN3(bus_in2[6]), .IN4(n66), .IN5(
        n127), .IN6(n138), .QN(n63) );
  AO222X1 U203 ( .IN1(N79), .IN2(n116), .IN3(n115), .IN4(n138), .IN5(N63), 
        .IN6(n119), .Q(n64) );
  INVX0 U204 ( .IN(bus_in2[6]), .QN(n154) );
  OA21X1 U205 ( .IN1(n59), .IN2(n60), .IN3(n120), .Q(bus_out[7]) );
  OAI222X1 U206 ( .IN1(n61), .IN2(n153), .IN3(bus_in2[7]), .IN4(n62), .IN5(
        n128), .IN6(n137), .QN(n59) );
  AO222X1 U207 ( .IN1(N80), .IN2(n116), .IN3(n115), .IN4(n137), .IN5(N64), 
        .IN6(n119), .Q(n60) );
  INVX0 U208 ( .IN(bus_in2[7]), .QN(n153) );
  OA21X1 U209 ( .IN1(n55), .IN2(n56), .IN3(n120), .Q(bus_out[8]) );
  OAI222X1 U210 ( .IN1(n57), .IN2(n152), .IN3(bus_in2[8]), .IN4(n58), .IN5(
        n128), .IN6(n136), .QN(n55) );
  AO222X1 U211 ( .IN1(N81), .IN2(n116), .IN3(n115), .IN4(n136), .IN5(N65), 
        .IN6(n119), .Q(n56) );
  INVX0 U212 ( .IN(bus_in2[8]), .QN(n152) );
  OA21X1 U213 ( .IN1(n43), .IN2(n44), .IN3(n120), .Q(bus_out[9]) );
  OAI222X1 U214 ( .IN1(n49), .IN2(n151), .IN3(bus_in2[9]), .IN4(n50), .IN5(
        n135), .IN6(n128), .QN(n43) );
  AO222X1 U215 ( .IN1(N82), .IN2(n116), .IN3(n115), .IN4(n135), .IN5(N66), 
        .IN6(n119), .Q(n44) );
  INVX0 U216 ( .IN(bus_in2[9]), .QN(n151) );
  OA21X1 U217 ( .IN1(n107), .IN2(n108), .IN3(n120), .Q(bus_out[10]) );
  OAI222X1 U218 ( .IN1(n109), .IN2(n150), .IN3(bus_in2[10]), .IN4(n110), .IN5(
        n128), .IN6(n134), .QN(n107) );
  AO222X1 U219 ( .IN1(N83), .IN2(n116), .IN3(n115), .IN4(n134), .IN5(N67), 
        .IN6(n119), .Q(n108) );
  INVX0 U220 ( .IN(bus_in2[10]), .QN(n150) );
  OA21X1 U221 ( .IN1(n103), .IN2(n104), .IN3(n120), .Q(bus_out[11]) );
  OAI222X1 U222 ( .IN1(n105), .IN2(n149), .IN3(bus_in2[11]), .IN4(n106), .IN5(
        n128), .IN6(n133), .QN(n103) );
  AO222X1 U223 ( .IN1(N84), .IN2(n116), .IN3(n115), .IN4(n133), .IN5(N68), 
        .IN6(n119), .Q(n104) );
  INVX0 U224 ( .IN(bus_in2[11]), .QN(n149) );
  OA21X1 U225 ( .IN1(n99), .IN2(n100), .IN3(n120), .Q(bus_out[12]) );
  OAI222X1 U226 ( .IN1(n101), .IN2(n148), .IN3(bus_in2[12]), .IN4(n102), .IN5(
        n128), .IN6(n132), .QN(n99) );
  AO222X1 U227 ( .IN1(N85), .IN2(n116), .IN3(n115), .IN4(n132), .IN5(N69), 
        .IN6(n119), .Q(n100) );
  INVX0 U228 ( .IN(bus_in2[12]), .QN(n148) );
  OA21X1 U229 ( .IN1(n95), .IN2(n96), .IN3(n120), .Q(bus_out[13]) );
  OAI222X1 U230 ( .IN1(n97), .IN2(n147), .IN3(bus_in2[13]), .IN4(n98), .IN5(
        n128), .IN6(n131), .QN(n95) );
  AO222X1 U231 ( .IN1(N86), .IN2(n116), .IN3(n115), .IN4(n131), .IN5(N70), 
        .IN6(n119), .Q(n96) );
  INVX0 U232 ( .IN(bus_in2[13]), .QN(n147) );
  OA21X1 U233 ( .IN1(n91), .IN2(n92), .IN3(n120), .Q(bus_out[14]) );
  OAI222X1 U234 ( .IN1(n93), .IN2(n146), .IN3(bus_in2[14]), .IN4(n94), .IN5(
        n127), .IN6(n130), .QN(n91) );
  AO222X1 U235 ( .IN1(N87), .IN2(n116), .IN3(n115), .IN4(n130), .IN5(N71), 
        .IN6(n119), .Q(n92) );
  INVX0 U236 ( .IN(bus_in2[14]), .QN(n146) );
  OA21X1 U237 ( .IN1(n87), .IN2(n88), .IN3(n120), .Q(bus_out[15]) );
  OAI222X1 U238 ( .IN1(n89), .IN2(n145), .IN3(bus_in2[15]), .IN4(n90), .IN5(
        n127), .IN6(n129), .QN(n87) );
  AO222X1 U239 ( .IN1(N88), .IN2(n116), .IN3(n115), .IN4(n129), .IN5(N72), 
        .IN6(n119), .Q(n88) );
  INVX0 U240 ( .IN(bus_in2[15]), .QN(n145) );
  INVX0 U241 ( .IN(bus_in1[9]), .QN(n135) );
  INVX0 U242 ( .IN(bus_in1[0]), .QN(n144) );
  INVX0 U243 ( .IN(bus_in1[1]), .QN(n143) );
  INVX0 U244 ( .IN(bus_in1[2]), .QN(n142) );
  INVX0 U245 ( .IN(bus_in1[3]), .QN(n141) );
  INVX0 U246 ( .IN(bus_in1[4]), .QN(n140) );
  INVX0 U247 ( .IN(bus_in1[5]), .QN(n139) );
  INVX0 U248 ( .IN(bus_in1[6]), .QN(n138) );
  INVX0 U249 ( .IN(bus_in1[7]), .QN(n137) );
  INVX0 U250 ( .IN(bus_in1[8]), .QN(n136) );
  INVX0 U251 ( .IN(bus_in1[10]), .QN(n134) );
  INVX0 U252 ( .IN(bus_in1[11]), .QN(n133) );
  INVX0 U253 ( .IN(bus_in1[12]), .QN(n132) );
  INVX0 U254 ( .IN(bus_in1[13]), .QN(n131) );
  INVX0 U255 ( .IN(bus_in1[14]), .QN(n130) );
  INVX0 U256 ( .IN(bus_in1[15]), .QN(n129) );
  INVX0 U257 ( .IN(control[2]), .QN(n161) );
  INVX0 U258 ( .IN(control[1]), .QN(n162) );
  INVX0 U259 ( .IN(control[0]), .QN(n163) );
endmodule


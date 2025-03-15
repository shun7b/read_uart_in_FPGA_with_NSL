
/*Produced by NSL Core(version=20240708), IP ARCH, Inc. Sat Mar 15 17:42:16 2025
 Licensed to :EVALUATION USER*/
/*
 DO NOT USE ANY PART OF THIS FILE FOR COMMERCIAL PRODUCTS. 
*/

module read ( p_reset , m_clock , RxD_i , Rx_Data_o , RxD_Ready_o , RxD_ParityError_o , RxD_FramingError_o , Rx_BitLength_i , Rx_ParityEN_i , Rx_OddParity_i , Rx_Enable_i , Rx_operation_o , Rx_ShiftClock_o );
  input p_reset, m_clock;
  wire p_reset, m_clock;
  input RxD_i;
  wire RxD_i;
  output [7:0] Rx_Data_o;
  wire [7:0] Rx_Data_o;
  output RxD_Ready_o;
  wire RxD_Ready_o;
  output RxD_ParityError_o;
  wire RxD_ParityError_o;
  output RxD_FramingError_o;
  wire RxD_FramingError_o;
  input [1:0] Rx_BitLength_i;
  wire [1:0] Rx_BitLength_i;
  input Rx_ParityEN_i;
  wire Rx_ParityEN_i;
  input Rx_OddParity_i;
  wire Rx_OddParity_i;
  input Rx_Enable_i;
  wire Rx_Enable_i;
  output Rx_operation_o;
  wire Rx_operation_o;
  output Rx_ShiftClock_o;
  wire Rx_ShiftClock_o;
  wire [3:0] BitLength;
  reg [3:0] ShiftCount;
  reg [15:0] x16_BaudCounter;
  reg x16_ShiftTiming;
  reg [3:0] x1_BaudCounter;
  reg x1_ShiftTiming;
  reg [11:0] Rx_ShiftReg;
  reg [2:0] internal_RxD_in;
  wire [7:0] Rx_Data;
  wire Rx_Parity;
  reg Detect_StartBit;
  wire Receive_Start;
  reg shift_Operation;
  reg data_check;
  reg access_complete;
  wire _proc_access_complete_set;
  wire _proc_access_complete_reset;
  wire _proc_data_check_set;
  wire _proc_data_check_reset;
  wire _proc_shift_Operation_set;
  wire _proc_shift_Operation_reset;
  wire _net_0;
  wire _net_1;
  wire _net_2;
  wire _net_3;
  wire _net_4;
  wire _net_5;
  wire _net_6;
  wire _net_7;
  wire _net_8;
  wire _net_9;
  wire _net_10;
  wire _net_11;
  wire _net_12;
  wire _net_13;
  wire _net_14;
  wire _net_15;
  wire _net_16;
  wire _net_17;
  wire _net_18;
  wire _net_19;


// synthesis translate_off
// synopsys translate_off
always @(posedge m_clock or negedge p_reset)
  begin
if ((((((((((((~_net_3)&(~_net_7))&(~_net_8))&(~_net_9))&((~_net_3)&_net_9))|((((((~_net_3)&(~_net_7))&(~_net_8))&(~_net_9))|((~_net_3)&_net_9))&((~_net_3)&_net_8)))|(((((((~_net_3)&(~_net_7))&(~_net_8))&(~_net_9))|((~_net_3)&_net_9))|((~_net_3)&_net_8))&((~_net_3)&_net_7)))|((((((((~_net_3)&(~_net_7))&(~_net_8))&(~_net_9))|((~_net_3)&_net_9))|((~_net_3)&_net_8))|((~_net_3)&_net_7))&(((_net_3&(~_net_4))&(~_net_5))&(~_net_6))))|(((((((((~_net_3)&(~_net_7))&(~_net_8))&(~_net_9))|((~_net_3)&_net_9))|((~_net_3)&_net_8))|((~_net_3)&_net_7))|(((_net_3&(~_net_4))&(~_net_5))&(~_net_6)))&(_net_3&_net_6)))|((((((((((~_net_3)&(~_net_7))&(~_net_8))&(~_net_9))|((~_net_3)&_net_9))|((~_net_3)&_net_8))|((~_net_3)&_net_7))|(((_net_3&(~_net_4))&(~_net_5))&(~_net_6)))|(_net_3&_net_6))&(_net_3&_net_5)))|(((((((((((~_net_3)&(~_net_7))&(~_net_8))&(~_net_9))|((~_net_3)&_net_9))|((~_net_3)&_net_8))|((~_net_3)&_net_7))|(((_net_3&(~_net_4))&(~_net_5))&(~_net_6)))|(_net_3&_net_6))|(_net_3&_net_5))&(_net_3&_net_4))))
 begin $display("Warning: assign collision(read:BitLength) at %d",$time);
if (((((~_net_3)&(~_net_7))&(~_net_8))&(~_net_9))) $display("assert (((((~_net_3)&(~_net_7))&(~_net_8))&(~_net_9))) line 104 at %d\n",$time);
if (((~_net_3)&_net_9)) $display("assert (((~_net_3)&_net_9)) line 98 at %d\n",$time);
if (((~_net_3)&_net_8)) $display("assert (((~_net_3)&_net_8)) line 100 at %d\n",$time);
if (((~_net_3)&_net_7)) $display("assert (((~_net_3)&_net_7)) line 102 at %d\n",$time);
if ((((_net_3&(~_net_4))&(~_net_5))&(~_net_6))) $display("assert ((((_net_3&(~_net_4))&(~_net_5))&(~_net_6))) line 94 at %d\n",$time);
if ((_net_3&_net_6)) $display("assert ((_net_3&_net_6)) line 88 at %d\n",$time);
if ((_net_3&_net_5)) $display("assert ((_net_3&_net_5)) line 90 at %d\n",$time);
if ((_net_3&_net_4)) $display("assert ((_net_3&_net_4)) line 92 at %d\n",$time);
 end
 end

// synthesis translate_on
// synopsys translate_on
   assign  BitLength = 
// synthesis translate_off
// synopsys translate_off
((((((((((((~_net_3)&(~_net_7))&(~_net_8))&(~_net_9))&((~_net_3)&_net_9))|((((((~_net_3)&(~_net_7))&(~_net_8))&(~_net_9))|((~_net_3)&_net_9))&((~_net_3)&_net_8)))|(((((((~_net_3)&(~_net_7))&(~_net_8))&(~_net_9))|((~_net_3)&_net_9))|((~_net_3)&_net_8))&((~_net_3)&_net_7)))|((((((((~_net_3)&(~_net_7))&(~_net_8))&(~_net_9))|((~_net_3)&_net_9))|((~_net_3)&_net_8))|((~_net_3)&_net_7))&(((_net_3&(~_net_4))&(~_net_5))&(~_net_6))))|(((((((((~_net_3)&(~_net_7))&(~_net_8))&(~_net_9))|((~_net_3)&_net_9))|((~_net_3)&_net_8))|((~_net_3)&_net_7))|(((_net_3&(~_net_4))&(~_net_5))&(~_net_6)))&(_net_3&_net_6)))|((((((((((~_net_3)&(~_net_7))&(~_net_8))&(~_net_9))|((~_net_3)&_net_9))|((~_net_3)&_net_8))|((~_net_3)&_net_7))|(((_net_3&(~_net_4))&(~_net_5))&(~_net_6)))|(_net_3&_net_6))&(_net_3&_net_5)))|(((((((((((~_net_3)&(~_net_7))&(~_net_8))&(~_net_9))|((~_net_3)&_net_9))|((~_net_3)&_net_8))|((~_net_3)&_net_7))|(((_net_3&(~_net_4))&(~_net_5))&(~_net_6)))|(_net_3&_net_6))|(_net_3&_net_5))&(_net_3&_net_4))))? 4'bx :((((((((((((~_net_3)&(~_net_7))&(~_net_8))&(~_net_9))|((~_net_3)&_net_9))|((~_net_3)&_net_8))|((~_net_3)&_net_7))|(((_net_3&(~_net_4))&(~_net_5))&(~_net_6)))|(_net_3&_net_6))|(_net_3&_net_5))|(_net_3&_net_4)))? 
// synthesis translate_on
// synopsys translate_on
((((((~_net_3)&(~_net_7))&(~_net_8))&(~_net_9)))?4'b1010:4'b0)|
    ((((~_net_3)&_net_9))?4'b0111:4'b0)|
    ((((~_net_3)&_net_8))?4'b1000:4'b0)|
    ((((~_net_3)&_net_7))?4'b1001:4'b0)|
    (((((_net_3&(~_net_4))&(~_net_5))&(~_net_6)))?4'b1001:4'b0)|
    (((_net_3&_net_6))?4'b0110:4'b0)|
    (((_net_3&_net_5))?4'b0111:4'b0)|
    (((_net_3&_net_4))?4'b1000:4'b0)
// synthesis translate_off
// synopsys translate_off
:4'bx
// synthesis translate_on
// synopsys translate_on
;

// synthesis translate_off
// synopsys translate_off
always @(posedge m_clock or negedge p_reset)
  begin
if ((((((((((((~_net_10)&(~_net_14))&(~_net_15))&(~_net_16))&((~_net_10)&_net_16))|((((((~_net_10)&(~_net_14))&(~_net_15))&(~_net_16))|((~_net_10)&_net_16))&((~_net_10)&_net_15)))|(((((((~_net_10)&(~_net_14))&(~_net_15))&(~_net_16))|((~_net_10)&_net_16))|((~_net_10)&_net_15))&((~_net_10)&_net_14)))|((((((((~_net_10)&(~_net_14))&(~_net_15))&(~_net_16))|((~_net_10)&_net_16))|((~_net_10)&_net_15))|((~_net_10)&_net_14))&(((_net_10&(~_net_11))&(~_net_12))&(~_net_13))))|(((((((((~_net_10)&(~_net_14))&(~_net_15))&(~_net_16))|((~_net_10)&_net_16))|((~_net_10)&_net_15))|((~_net_10)&_net_14))|(((_net_10&(~_net_11))&(~_net_12))&(~_net_13)))&(_net_10&_net_13)))|((((((((((~_net_10)&(~_net_14))&(~_net_15))&(~_net_16))|((~_net_10)&_net_16))|((~_net_10)&_net_15))|((~_net_10)&_net_14))|(((_net_10&(~_net_11))&(~_net_12))&(~_net_13)))|(_net_10&_net_13))&(_net_10&_net_12)))|(((((((((((~_net_10)&(~_net_14))&(~_net_15))&(~_net_16))|((~_net_10)&_net_16))|((~_net_10)&_net_15))|((~_net_10)&_net_14))|(((_net_10&(~_net_11))&(~_net_12))&(~_net_13)))|(_net_10&_net_13))|(_net_10&_net_12))&(_net_10&_net_11))))
 begin $display("Warning: assign collision(read:Rx_Data) at %d",$time);
if (((((~_net_10)&(~_net_14))&(~_net_15))&(~_net_16))) $display("assert (((((~_net_10)&(~_net_14))&(~_net_15))&(~_net_16))) line 141 at %d\n",$time);
if (((~_net_10)&_net_16)) $display("assert (((~_net_10)&_net_16)) line 135 at %d\n",$time);
if (((~_net_10)&_net_15)) $display("assert (((~_net_10)&_net_15)) line 137 at %d\n",$time);
if (((~_net_10)&_net_14)) $display("assert (((~_net_10)&_net_14)) line 139 at %d\n",$time);
if ((((_net_10&(~_net_11))&(~_net_12))&(~_net_13))) $display("assert ((((_net_10&(~_net_11))&(~_net_12))&(~_net_13))) line 131 at %d\n",$time);
if ((_net_10&_net_13)) $display("assert ((_net_10&_net_13)) line 125 at %d\n",$time);
if ((_net_10&_net_12)) $display("assert ((_net_10&_net_12)) line 127 at %d\n",$time);
if ((_net_10&_net_11)) $display("assert ((_net_10&_net_11)) line 129 at %d\n",$time);
 end
 end

// synthesis translate_on
// synopsys translate_on
   assign  Rx_Data = 
// synthesis translate_off
// synopsys translate_off
((((((((((((~_net_10)&(~_net_14))&(~_net_15))&(~_net_16))&((~_net_10)&_net_16))|((((((~_net_10)&(~_net_14))&(~_net_15))&(~_net_16))|((~_net_10)&_net_16))&((~_net_10)&_net_15)))|(((((((~_net_10)&(~_net_14))&(~_net_15))&(~_net_16))|((~_net_10)&_net_16))|((~_net_10)&_net_15))&((~_net_10)&_net_14)))|((((((((~_net_10)&(~_net_14))&(~_net_15))&(~_net_16))|((~_net_10)&_net_16))|((~_net_10)&_net_15))|((~_net_10)&_net_14))&(((_net_10&(~_net_11))&(~_net_12))&(~_net_13))))|(((((((((~_net_10)&(~_net_14))&(~_net_15))&(~_net_16))|((~_net_10)&_net_16))|((~_net_10)&_net_15))|((~_net_10)&_net_14))|(((_net_10&(~_net_11))&(~_net_12))&(~_net_13)))&(_net_10&_net_13)))|((((((((((~_net_10)&(~_net_14))&(~_net_15))&(~_net_16))|((~_net_10)&_net_16))|((~_net_10)&_net_15))|((~_net_10)&_net_14))|(((_net_10&(~_net_11))&(~_net_12))&(~_net_13)))|(_net_10&_net_13))&(_net_10&_net_12)))|(((((((((((~_net_10)&(~_net_14))&(~_net_15))&(~_net_16))|((~_net_10)&_net_16))|((~_net_10)&_net_15))|((~_net_10)&_net_14))|(((_net_10&(~_net_11))&(~_net_12))&(~_net_13)))|(_net_10&_net_13))|(_net_10&_net_12))&(_net_10&_net_11))))? 8'bx :((((((((((((~_net_10)&(~_net_14))&(~_net_15))&(~_net_16))|((~_net_10)&_net_16))|((~_net_10)&_net_15))|((~_net_10)&_net_14))|(((_net_10&(~_net_11))&(~_net_12))&(~_net_13)))|(_net_10&_net_13))|(_net_10&_net_12))|(_net_10&_net_11)))? 
// synthesis translate_on
// synopsys translate_on
((((((~_net_10)&(~_net_14))&(~_net_15))&(~_net_16)))?(Rx_ShiftReg[9:2]):8'b0)|
    ((((~_net_10)&_net_16))?({({({1'b1,1'b1}),1'b1}),(Rx_ShiftReg[9:5])}):8'b0)|
    ((((~_net_10)&_net_15))?({({({1'b1}),1'b1}),(Rx_ShiftReg[9:4])}):8'b0)|
    ((((~_net_10)&_net_14))?({1'b1,(Rx_ShiftReg[9:3])}):8'b0)|
    (((((_net_10&(~_net_11))&(~_net_12))&(~_net_13)))?(Rx_ShiftReg[10:3]):8'b0)|
    (((_net_10&_net_13))?({({({1'b1,1'b1}),1'b1}),(Rx_ShiftReg[10:6])}):8'b0)|
    (((_net_10&_net_12))?({({({1'b1}),1'b1}),(Rx_ShiftReg[10:5])}):8'b0)|
    (((_net_10&_net_11))?({1'b1,(Rx_ShiftReg[10:4])}):8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;

// synthesis translate_off
// synopsys translate_off
always @(posedge m_clock or negedge p_reset)
  begin
if (((~Rx_OddParity_i)&Rx_OddParity_i))
 begin $display("Warning: assign collision(read:Rx_Parity) at %d",$time);
if ((~Rx_OddParity_i)) $display("assert ((~Rx_OddParity_i)) line 113 at %d\n",$time);
if (Rx_OddParity_i) $display("assert (Rx_OddParity_i) line 112 at %d\n",$time);
 end
 end

// synthesis translate_on
// synopsys translate_on
   assign  Rx_Parity = 
// synthesis translate_off
// synopsys translate_off
(((~Rx_OddParity_i)&Rx_OddParity_i))? 1'bx :(((~Rx_OddParity_i)|Rx_OddParity_i))? 
// synthesis translate_on
// synopsys translate_on
(((~Rx_OddParity_i))?(^Rx_Data):1'b0)|
    ((Rx_OddParity_i)?(~(^Rx_Data)):1'b0)
// synthesis translate_off
// synopsys translate_off
:1'bx
// synthesis translate_on
// synopsys translate_on
;

// synthesis translate_off
// synopsys translate_off
always @(posedge Receive_Start)
  begin
#1 if (Receive_Start===1'bx)
 begin
$display("Warning: control hazard(read:Receive_Start) at %d",$time);
 end
#1 if (((((x16_ShiftTiming != 1'b0)&_net_1))===1'bx) || (1'b1)===1'bx) $display("hazard (((x16_ShiftTiming != 1'b0)&_net_1) || 1'b1) line 65 at %d\n",$time);
 end

// synthesis translate_on
// synopsys translate_on
   assign  Receive_Start = ((x16_ShiftTiming != 1'b0)&_net_1);

// synthesis translate_off
// synopsys translate_off
always @(posedge _proc_access_complete_set)
  begin
#1 if (_proc_access_complete_set===1'bx)
 begin
$display("Warning: control hazard(read:_proc_access_complete_set) at %d",$time);
 end
#1 if (((data_check)===1'bx) || (1'b1)===1'bx) $display("hazard (data_check || 1'b1) line 190 at %d\n",$time);
 end

// synthesis translate_on
// synopsys translate_on
   assign  _proc_access_complete_set = data_check;

// synthesis translate_off
// synopsys translate_off
always @(posedge _proc_access_complete_reset)
  begin
#1 if (_proc_access_complete_reset===1'bx)
 begin
$display("Warning: control hazard(read:_proc_access_complete_reset) at %d",$time);
 end
#1 if (((access_complete)===1'bx) || (1'b1)===1'bx) $display("hazard (access_complete || 1'b1) line 200 at %d\n",$time);
 end

// synthesis translate_on
// synopsys translate_on
   assign  _proc_access_complete_reset = access_complete;

// synthesis translate_off
// synopsys translate_off
always @(posedge _proc_data_check_set)
  begin
#1 if (_proc_data_check_set===1'bx)
 begin
$display("Warning: control hazard(read:_proc_data_check_set) at %d",$time);
 end
#1 if (((((shift_Operation&(x16_ShiftTiming != 1'b0))&_net_17))===1'bx) || (1'b1)===1'bx) $display("hazard (((shift_Operation&(x16_ShiftTiming != 1'b0))&_net_17) || 1'b1) line 164 at %d\n",$time);
 end

// synthesis translate_on
// synopsys translate_on
   assign  _proc_data_check_set = ((shift_Operation&(x16_ShiftTiming != 1'b0))&_net_17);

// synthesis translate_off
// synopsys translate_off
always @(posedge _proc_data_check_reset)
  begin
#1 if (_proc_data_check_reset===1'bx)
 begin
$display("Warning: control hazard(read:_proc_data_check_reset) at %d",$time);
 end
#1 if (((data_check)===1'bx) || (1'b1)===1'bx) $display("hazard (data_check || 1'b1) line 190 at %d\n",$time);
 end

// synthesis translate_on
// synopsys translate_on
   assign  _proc_data_check_reset = data_check;

// synthesis translate_off
// synopsys translate_off
always @(posedge _proc_shift_Operation_set)
  begin
#1 if (_proc_shift_Operation_set===1'bx)
 begin
$display("Warning: control hazard(read:_proc_shift_Operation_set) at %d",$time);
 end
#1 if (((Receive_Start)===1'bx) || (1'b1)===1'bx) $display("hazard (Receive_Start || 1'b1) line 150 at %d\n",$time);
 end

// synthesis translate_on
// synopsys translate_on
   assign  _proc_shift_Operation_set = Receive_Start;

// synthesis translate_off
// synopsys translate_off
always @(posedge _proc_shift_Operation_reset)
  begin
#1 if (_proc_shift_Operation_reset===1'bx)
 begin
$display("Warning: control hazard(read:_proc_shift_Operation_reset) at %d",$time);
 end
#1 if (((((shift_Operation&(x16_ShiftTiming != 1'b0))&_net_17))===1'bx) || (1'b1)===1'bx) $display("hazard (((shift_Operation&(x16_ShiftTiming != 1'b0))&_net_17) || 1'b1) line 164 at %d\n",$time);
 end

// synthesis translate_on
// synopsys translate_on
   assign  _proc_shift_Operation_reset = ((shift_Operation&(x16_ShiftTiming != 1'b0))&_net_17);
   assign  _net_0 = 
// synthesis translate_off
// synopsys translate_off
((Rx_Enable_i != 1'b0))? 
// synthesis translate_on
// synopsys translate_on
(((Rx_Enable_i != 1'b0))?(x16_BaudCounter==16'b0000000000110010):1'b0)
// synthesis translate_off
// synopsys translate_off
:1'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _net_1 = 
// synthesis translate_off
// synopsys translate_off
((x16_ShiftTiming != 1'b0))? 
// synthesis translate_on
// synopsys translate_on
(((x16_ShiftTiming != 1'b0))?(((internal_RxD_in[0])==1'b0)&(~Detect_StartBit)):1'b0)
// synthesis translate_off
// synopsys translate_off
:1'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _net_2 = (x16_ShiftTiming&(x1_BaudCounter==4'b0111));
   assign  _net_3 = (~Rx_ParityEN_i);
   assign  _net_4 = 
// synthesis translate_off
// synopsys translate_off
(_net_3)? 
// synthesis translate_on
// synopsys translate_on
((_net_3)?(Rx_BitLength_i==2'b10):1'b0)
// synthesis translate_off
// synopsys translate_off
:1'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _net_5 = 
// synthesis translate_off
// synopsys translate_off
(_net_3)? 
// synthesis translate_on
// synopsys translate_on
((_net_3)?(Rx_BitLength_i==2'b01):1'b0)
// synthesis translate_off
// synopsys translate_off
:1'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _net_6 = 
// synthesis translate_off
// synopsys translate_off
(_net_3)? 
// synthesis translate_on
// synopsys translate_on
((_net_3)?(Rx_BitLength_i==2'b00):1'b0)
// synthesis translate_off
// synopsys translate_off
:1'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _net_7 = 
// synthesis translate_off
// synopsys translate_off
((~_net_3))? 
// synthesis translate_on
// synopsys translate_on
(((~_net_3))?(Rx_BitLength_i==2'b10):1'b0)
// synthesis translate_off
// synopsys translate_off
:1'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _net_8 = 
// synthesis translate_off
// synopsys translate_off
((~_net_3))? 
// synthesis translate_on
// synopsys translate_on
(((~_net_3))?(Rx_BitLength_i==2'b01):1'b0)
// synthesis translate_off
// synopsys translate_off
:1'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _net_9 = 
// synthesis translate_off
// synopsys translate_off
((~_net_3))? 
// synthesis translate_on
// synopsys translate_on
(((~_net_3))?(Rx_BitLength_i==2'b00):1'b0)
// synthesis translate_off
// synopsys translate_off
:1'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _net_10 = (~Rx_ParityEN_i);
   assign  _net_11 = 
// synthesis translate_off
// synopsys translate_off
(_net_10)? 
// synthesis translate_on
// synopsys translate_on
((_net_10)?(Rx_BitLength_i==2'b10):1'b0)
// synthesis translate_off
// synopsys translate_off
:1'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _net_12 = 
// synthesis translate_off
// synopsys translate_off
(_net_10)? 
// synthesis translate_on
// synopsys translate_on
((_net_10)?(Rx_BitLength_i==2'b01):1'b0)
// synthesis translate_off
// synopsys translate_off
:1'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _net_13 = 
// synthesis translate_off
// synopsys translate_off
(_net_10)? 
// synthesis translate_on
// synopsys translate_on
((_net_10)?(Rx_BitLength_i==2'b00):1'b0)
// synthesis translate_off
// synopsys translate_off
:1'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _net_14 = 
// synthesis translate_off
// synopsys translate_off
((~_net_10))? 
// synthesis translate_on
// synopsys translate_on
(((~_net_10))?(Rx_BitLength_i==2'b10):1'b0)
// synthesis translate_off
// synopsys translate_off
:1'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _net_15 = 
// synthesis translate_off
// synopsys translate_off
((~_net_10))? 
// synthesis translate_on
// synopsys translate_on
(((~_net_10))?(Rx_BitLength_i==2'b01):1'b0)
// synthesis translate_off
// synopsys translate_off
:1'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _net_16 = 
// synthesis translate_off
// synopsys translate_off
((~_net_10))? 
// synthesis translate_on
// synopsys translate_on
(((~_net_10))?(Rx_BitLength_i==2'b00):1'b0)
// synthesis translate_off
// synopsys translate_off
:1'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _net_17 = 
// synthesis translate_off
// synopsys translate_off
((shift_Operation&(x16_ShiftTiming != 1'b0)))? 
// synthesis translate_on
// synopsys translate_on
(((shift_Operation&(x16_ShiftTiming != 1'b0)))?(ShiftCount==4'b1000):1'b0)
// synthesis translate_off
// synopsys translate_off
:1'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _net_18 = 
// synthesis translate_off
// synopsys translate_off
(data_check)? 
// synthesis translate_on
// synopsys translate_on
((data_check)?(Rx_ParityEN_i&((Rx_ShiftReg[10]) != Rx_Parity)):1'b0)
// synthesis translate_off
// synopsys translate_off
:1'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _net_19 = 
// synthesis translate_off
// synopsys translate_off
((data_check&(~_net_18)))? 
// synthesis translate_on
// synopsys translate_on
(((data_check&(~_net_18)))?((Rx_ShiftReg[11])==1'b0):1'b0)
// synthesis translate_off
// synopsys translate_off
:1'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  Rx_Data_o = 
// synthesis translate_off
// synopsys translate_off
(((data_check&(~_net_18))&(~_net_19)))? 
// synthesis translate_on
// synopsys translate_on
((((data_check&(~_net_18))&(~_net_19)))?Rx_Data:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;

// synthesis translate_off
// synopsys translate_off
always @(posedge RxD_Ready_o)
  begin
#1 if (RxD_Ready_o===1'bx)
 begin
$display("Warning: control hazard(read:RxD_Ready_o) at %d",$time);
 end
#1 if (((((data_check&(~_net_18))&(~_net_19)))===1'bx) || (1'b1)===1'bx) $display("hazard (((data_check&(~_net_18))&(~_net_19)) || 1'b1) line 187 at %d\n",$time);
 end

// synthesis translate_on
// synopsys translate_on
   assign  RxD_Ready_o = ((data_check&(~_net_18))&(~_net_19));

// synthesis translate_off
// synopsys translate_off
always @(posedge RxD_ParityError_o)
  begin
#1 if (RxD_ParityError_o===1'bx)
 begin
$display("Warning: control hazard(read:RxD_ParityError_o) at %d",$time);
 end
#1 if ((((data_check&_net_18))===1'bx) || (1'b1)===1'bx) $display("hazard ((data_check&_net_18) || 1'b1) line 177 at %d\n",$time);
 end

// synthesis translate_on
// synopsys translate_on
   assign  RxD_ParityError_o = (data_check&_net_18);

// synthesis translate_off
// synopsys translate_off
always @(posedge RxD_FramingError_o)
  begin
#1 if (RxD_FramingError_o===1'bx)
 begin
$display("Warning: control hazard(read:RxD_FramingError_o) at %d",$time);
 end
#1 if (((((data_check&(~_net_18))&_net_19))===1'bx) || (1'b1)===1'bx) $display("hazard (((data_check&(~_net_18))&_net_19) || 1'b1) line 181 at %d\n",$time);
 end

// synthesis translate_on
// synopsys translate_on
   assign  RxD_FramingError_o = ((data_check&(~_net_18))&_net_19);
   assign  Rx_operation_o = Detect_StartBit;
   assign  Rx_ShiftClock_o = x1_ShiftTiming;
always @(posedge m_clock or negedge p_reset)
  begin
if (~p_reset)
     ShiftCount <= 4'b0000;
else 
// synthesis translate_off
// synopsys translate_off
if (((access_complete&((shift_Operation&(x16_ShiftTiming != 1'b0))&(~_net_17)))|((access_complete|((shift_Operation&(x16_ShiftTiming != 1'b0))&(~_net_17)))&((shift_Operation&(x16_ShiftTiming != 1'b0))&_net_17))))   ShiftCount <= 4'bx; 
  else 
// synthesis translate_on
// synopsys translate_on
if (access_complete)
      ShiftCount <= 4'b0000;
else if (((shift_Operation&(x16_ShiftTiming != 1'b0))&(~_net_17)))
      ShiftCount <= (ShiftCount+4'b0001);
else if (((shift_Operation&(x16_ShiftTiming != 1'b0))&_net_17))
      ShiftCount <= 4'b1111;
end

// synthesis translate_off
// synopsys translate_off
always @(posedge m_clock)
  begin
if ((((access_complete|((shift_Operation&(x16_ShiftTiming != 1'b0))&(~_net_17)))|((shift_Operation&(x16_ShiftTiming != 1'b0))&_net_17))==1'b1) ||
 (((access_complete|((shift_Operation&(x16_ShiftTiming != 1'b0))&(~_net_17)))|((shift_Operation&(x16_ShiftTiming != 1'b0))&_net_17))==1'b0) ) begin
 if (((access_complete&((shift_Operation&(x16_ShiftTiming != 1'b0))&(~_net_17)))|((access_complete|((shift_Operation&(x16_ShiftTiming != 1'b0))&(~_net_17)))&((shift_Operation&(x16_ShiftTiming != 1'b0))&_net_17))))
 begin $display("Warning: assign collision(read:ShiftCount) at %d",$time);

  end
 end
 else 
 $display("Warning: register set hazard(read:ShiftCount) at %d",$time);

  end

// synthesis translate_on
// synopsys translate_on
always @(posedge m_clock or negedge p_reset)
  begin
if (~p_reset)
     x16_BaudCounter <= 16'b0000000000000000;
else 
// synthesis translate_off
// synopsys translate_off
if ((((~(Rx_Enable_i != 1'b0))&((Rx_Enable_i != 1'b0)&(~_net_0)))|(((~(Rx_Enable_i != 1'b0))|((Rx_Enable_i != 1'b0)&(~_net_0)))&((Rx_Enable_i != 1'b0)&_net_0))))   x16_BaudCounter <= 16'bx; 
  else 
// synthesis translate_on
// synopsys translate_on
if ((~(Rx_Enable_i != 1'b0)))
      x16_BaudCounter <= 16'b0000000000000000;
else if (((Rx_Enable_i != 1'b0)&(~_net_0)))
      x16_BaudCounter <= (x16_BaudCounter+16'b0000000000000001);
else if (((Rx_Enable_i != 1'b0)&_net_0))
      x16_BaudCounter <= 16'b0000000000000000;
end

// synthesis translate_off
// synopsys translate_off
always @(posedge m_clock)
  begin
if (((((~(Rx_Enable_i != 1'b0))|((Rx_Enable_i != 1'b0)&(~_net_0)))|((Rx_Enable_i != 1'b0)&_net_0))==1'b1) ||
 ((((~(Rx_Enable_i != 1'b0))|((Rx_Enable_i != 1'b0)&(~_net_0)))|((Rx_Enable_i != 1'b0)&_net_0))==1'b0) ) begin
 if ((((~(Rx_Enable_i != 1'b0))&((Rx_Enable_i != 1'b0)&(~_net_0)))|(((~(Rx_Enable_i != 1'b0))|((Rx_Enable_i != 1'b0)&(~_net_0)))&((Rx_Enable_i != 1'b0)&_net_0))))
 begin $display("Warning: assign collision(read:x16_BaudCounter) at %d",$time);

  end
 end
 else 
 $display("Warning: register set hazard(read:x16_BaudCounter) at %d",$time);

  end

// synthesis translate_on
// synopsys translate_on
always @(posedge m_clock or negedge p_reset)
  begin
if (~p_reset)
     x16_ShiftTiming <= 1'b0;
else 
// synthesis translate_off
// synopsys translate_off
if ((((~(Rx_Enable_i != 1'b0))&((Rx_Enable_i != 1'b0)&(~_net_0)))|(((~(Rx_Enable_i != 1'b0))|((Rx_Enable_i != 1'b0)&(~_net_0)))&((Rx_Enable_i != 1'b0)&_net_0))))   x16_ShiftTiming <= 1'bx; 
  else 
// synthesis translate_on
// synopsys translate_on
if ((~(Rx_Enable_i != 1'b0)))
      x16_ShiftTiming <= 1'b0;
else if (((Rx_Enable_i != 1'b0)&(~_net_0)))
      x16_ShiftTiming <= 1'b0;
else if (((Rx_Enable_i != 1'b0)&_net_0))
      x16_ShiftTiming <= 1'b1;
end

// synthesis translate_off
// synopsys translate_off
always @(posedge m_clock)
  begin
if (((((~(Rx_Enable_i != 1'b0))|((Rx_Enable_i != 1'b0)&(~_net_0)))|((Rx_Enable_i != 1'b0)&_net_0))==1'b1) ||
 ((((~(Rx_Enable_i != 1'b0))|((Rx_Enable_i != 1'b0)&(~_net_0)))|((Rx_Enable_i != 1'b0)&_net_0))==1'b0) ) begin
 if ((((~(Rx_Enable_i != 1'b0))&((Rx_Enable_i != 1'b0)&(~_net_0)))|(((~(Rx_Enable_i != 1'b0))|((Rx_Enable_i != 1'b0)&(~_net_0)))&((Rx_Enable_i != 1'b0)&_net_0))))
 begin $display("Warning: assign collision(read:x16_ShiftTiming) at %d",$time);

  end
 end
 else 
 $display("Warning: register set hazard(read:x16_ShiftTiming) at %d",$time);

  end

// synthesis translate_on
// synopsys translate_on
always @(posedge m_clock or negedge p_reset)
  begin
if (~p_reset)
     x1_BaudCounter <= 4'b0000;
else 
// synthesis translate_off
// synopsys translate_off
if (((~(Detect_StartBit != 1'b0))&((Detect_StartBit != 1'b0)&(x16_ShiftTiming != 1'b0))))   x1_BaudCounter <= 4'bx; 
  else 
// synthesis translate_on
// synopsys translate_on
if ((~(Detect_StartBit != 1'b0)))
      x1_BaudCounter <= 4'b0000;
else if (((Detect_StartBit != 1'b0)&(x16_ShiftTiming != 1'b0)))
      x1_BaudCounter <= (x1_BaudCounter+4'b0001);
end

// synthesis translate_off
// synopsys translate_off
always @(posedge m_clock)
  begin
if ((((~(Detect_StartBit != 1'b0))|((Detect_StartBit != 1'b0)&(x16_ShiftTiming != 1'b0)))==1'b1) ||
 (((~(Detect_StartBit != 1'b0))|((Detect_StartBit != 1'b0)&(x16_ShiftTiming != 1'b0)))==1'b0) ) begin
 if (((~(Detect_StartBit != 1'b0))&((Detect_StartBit != 1'b0)&(x16_ShiftTiming != 1'b0))))
 begin $display("Warning: assign collision(read:x1_BaudCounter) at %d",$time);

  end
 end
 else 
 $display("Warning: register set hazard(read:x1_BaudCounter) at %d",$time);

  end

// synthesis translate_on
// synopsys translate_on
always @(posedge m_clock or negedge p_reset)
  begin
if (~p_reset)
     x1_ShiftTiming <= 1'b0;
else 
// synthesis translate_off
// synopsys translate_off
if (((~_net_2)&_net_2))   x1_ShiftTiming <= 1'bx; 
  else 
// synthesis translate_on
// synopsys translate_on
if ((~_net_2))
      x1_ShiftTiming <= 1'b0;
else if (_net_2)
      x1_ShiftTiming <= 1'b1;
end

// synthesis translate_off
// synopsys translate_off
always @(posedge m_clock)
  begin
if ((((~_net_2)|_net_2)==1'b1) ||
 (((~_net_2)|_net_2)==1'b0) ) begin
 if (((~_net_2)&_net_2))
 begin $display("Warning: assign collision(read:x1_ShiftTiming) at %d",$time);

  end
 end
 else 
 $display("Warning: register set hazard(read:x1_ShiftTiming) at %d",$time);

  end

// synthesis translate_on
// synopsys translate_on
always @(posedge m_clock or negedge p_reset)
  begin
if (~p_reset)
     Rx_ShiftReg <= 12'b000000000000;
else 
// synthesis translate_off
// synopsys translate_off
if ((access_complete&((shift_Operation&(x16_ShiftTiming != 1'b0))&(~_net_17))))   Rx_ShiftReg <= 12'bx; 
  else 
// synthesis translate_on
// synopsys translate_on
if (access_complete)
      Rx_ShiftReg <= 12'b000000000000;
else if (((shift_Operation&(x16_ShiftTiming != 1'b0))&(~_net_17)))
      Rx_ShiftReg <= ({RxD_i,(Rx_ShiftReg[11:1])});
end

// synthesis translate_off
// synopsys translate_off
always @(posedge m_clock)
  begin
if (((access_complete|((shift_Operation&(x16_ShiftTiming != 1'b0))&(~_net_17)))==1'b1) ||
 ((access_complete|((shift_Operation&(x16_ShiftTiming != 1'b0))&(~_net_17)))==1'b0) ) begin
 if ((access_complete&((shift_Operation&(x16_ShiftTiming != 1'b0))&(~_net_17))))
 begin $display("Warning: assign collision(read:Rx_ShiftReg) at %d",$time);

  end
 end
 else 
 $display("Warning: register set hazard(read:Rx_ShiftReg) at %d",$time);

  end

// synthesis translate_on
// synopsys translate_on
always @(posedge m_clock or negedge p_reset)
  begin
if (~p_reset)
     internal_RxD_in <= 3'b000;
else   internal_RxD_in <= ({(internal_RxD_in[1:0]),RxD_i});
end
always @(posedge m_clock or negedge p_reset)
  begin
if (~p_reset)
     Detect_StartBit <= 1'b0;
else 
// synthesis translate_off
// synopsys translate_off
if ((access_complete&((x16_ShiftTiming != 1'b0)&_net_1)))   Detect_StartBit <= 1'bx; 
  else 
// synthesis translate_on
// synopsys translate_on
if (access_complete)
      Detect_StartBit <= 1'b0;
else if (((x16_ShiftTiming != 1'b0)&_net_1))
      Detect_StartBit <= 1'b1;
end

// synthesis translate_off
// synopsys translate_off
always @(posedge m_clock)
  begin
if (((access_complete|((x16_ShiftTiming != 1'b0)&_net_1))==1'b1) ||
 ((access_complete|((x16_ShiftTiming != 1'b0)&_net_1))==1'b0) ) begin
 if ((access_complete&((x16_ShiftTiming != 1'b0)&_net_1)))
 begin $display("Warning: assign collision(read:Detect_StartBit) at %d",$time);

  end
 end
 else 
 $display("Warning: register set hazard(read:Detect_StartBit) at %d",$time);

  end

// synthesis translate_on
// synopsys translate_on
always @(posedge m_clock or negedge p_reset)
  begin
if (~p_reset)
     shift_Operation <= 1'b0;
else if ((_proc_shift_Operation_set|_proc_shift_Operation_reset))
      shift_Operation <= _proc_shift_Operation_set;
end
always @(posedge m_clock or negedge p_reset)
  begin
if (~p_reset)
     data_check <= 1'b0;
else if ((_proc_data_check_set|_proc_data_check_reset))
      data_check <= _proc_data_check_set;
end
always @(posedge m_clock or negedge p_reset)
  begin
if (~p_reset)
     access_complete <= 1'b0;
else if ((_proc_access_complete_set|_proc_access_complete_reset))
      access_complete <= _proc_access_complete_set;
end
endmodule

/*Produced by NSL Core(version=20240708), IP ARCH, Inc. Sat Mar 15 17:42:16 2025
 Licensed to :EVALUATION USER*/

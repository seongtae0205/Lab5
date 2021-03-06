`include "opcodes.v"

module Adder(clk, reset_n, ADDIn_A, ADDIn_B, opcode, ADD_Result);
    input clk, reset_n;
    input [`WORD_SIZE-1 :0] ADDIn_A;
    input [`WORD_SIZE-1 :0] ADDIn_B;
    input [3:0] opcode;

    output [`WORD_SIZE-1:0] ADD_Result;
	wire [`WORD_SIZE-1:0] ADD_Result;

    // initial begin
    //     ADD_Result <= `WORD_SIZE'b0;
    // end

    // always @(negedge reset_n) begin
    //     ADD_Result <= `WORD_SIZE'b0;
    // end
    
    assign ADD_Result = ((opcode == `JMP_OP) || (opcode == `JAL_OP)) ? (($signed(ADDIn_A)  & (16'hf000)) | $signed(ADDIn_B)) : ($signed(ADDIn_A) + $signed(ADDIn_B));
    // always @(posedge clk) begin
    //     case (opcode) 
	// 		`JMP_OP : ADD_Result <= ($signed(ADDIn_A)  & (16'hf000)) | $signed(ADDIn_B);
	// 		`JAL_OP : ADD_Result <= ($signed(ADDIn_A)  & (16'hf000)) | $signed(ADDIn_B);
    //         4'b0000 : ADD_Result <= $signed(ADDIn_A) + $signed(ADDIn_B);
    //         default : ADD_Result <= $signed(ADDIn_A) + $signed(ADDIn_B);
    //     endcase
    // end
    
endmodule

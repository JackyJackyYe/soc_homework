module add_full (
    input wire  A, // 输入A
    input wire  B, // 输入B
    input wire C_in, // 进位输入
    output wire  S, // 和输出
    output wire  P, // 传递输出
    output wire  G, // 进位输出
    output wire C_out // 进位输出
);


    // 生成和传播信号
    assign G = A & B;
    assign P = A ^ B;


    // 计算和输出
    assign S = A ^ B ^ C_in;

    // 计算最终的进位输出
    assign C_out = (P&C_in)|G;

endmodule
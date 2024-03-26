module add_CLA_old (
    input wire [3:0] A, // 输入A
    input wire [3:0] B, // 输入B
    input wire C_in, // 进位输入
    output wire [3:0] S, // 和输出
    output wire C_out // 进位输出
);

    wire [4:0] G, P, C;
    assign C[0] = C_in;
    

    // 生成和传播信号
    assign G = A & B;
    assign P = A ^ B;

    // 计算进位信号
    assign C[1] = G[0] | (P[0] & C[0]);
    assign C[2] = G[1] | (P[1] & C[1]);
    assign C[3] = G[2] | (P[2] & C[2]);
    assign C[4] = G[3] | (P[3] & C[3]);

    // 计算和输出
    assign S = A ^ B ^ C;

    // 计算最终的进位输出
    assign C_out = C[4];

endmodule
module add_CLA_top #(width=5,data=3)(
    input wire [width*data-1:0] A, // 输入A
    input wire [width*data-1:0] B, // 输入B
    input wire C_in, // 进位输入
    output wire [width*data-1:0] S, // 和输出
    output wire C_out // 进位输出
);

    wire [width:0] C;
    assign C[0] = C_in;
    genvar i;
    generate 
        for( i=0; i<width; i=i+1) begin
            add_CLA #(data) add_CLA_u (
                .A(A[(i+1)*data-1:i*data]),
                .B(B[(i+1)*data-1:i*data]),
                .C_in(C[i]),
                .S(S[(i+1)*data-1:i*data]),
                .C_out(C[i+1])
            );
        end
    endgenerate

    // 计算最终的进位输出
    assign C_out = C[width];
endmodule
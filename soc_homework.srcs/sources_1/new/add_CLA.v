module add_CLA #(width=4)( 
    input wire [width-1:0] A, // 输入A
    input wire [width-1:0] B, // 输入B
    input wire C_in, // 进位输入
    output wire [width-1:0] S, // 和输出
    output wire C_out // 进位输出
);

    wire [width:0] C;
    wire [width-1:0] G, P;
    assign C[0] = C_in;
    
    genvar i;
    generate 
        for( i=0; i<width; i=i+1) begin
            add_full add_full_u (
                .A(A[i]),
                .B(B[i]),
                .C_in(C[i]),
                .S(S[i]),
                .P(P[i]),
                .G(G[i])
                //.C_out(C[i+1])
            );
            assign C[i+1] = G[i] | (P[i] & C[i]);
        end
    endgenerate

    // 最终的进位输出
    assign C_out = C[4];

endmodule
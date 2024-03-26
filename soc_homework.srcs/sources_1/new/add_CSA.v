module add_CSA #(width=4)(
    input wire [width-1:0] A, // ����A
    input wire [width-1:0] B, // ����B
    input wire C_in, // ��λ����
    output wire [width-1:0] S, // �����
    output wire C_out // ��λ���
);

    wire [width:0] C;
    wire [width-1:0] P;
    wire Select;
    
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
                .C_out(C[i+1])
            );
        end
    endgenerate

    // �������յĽ�λ���
    assign Select=&P;
    assign C_out = Select?C_in:C[width];
    
endmodule
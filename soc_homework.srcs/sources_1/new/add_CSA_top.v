module add_CSA_top #(width=4,data=4)(
    input wire [width*data-1:0] A, // ����A
    input wire [width*data-1:0] B, // ����B
    input wire C_in, // ��λ����
    output wire [width*data-1:0] S, // �����
    output wire C_out // ��λ���
);

    wire [width:0] C;
    
    assign C[0] = C_in;
    genvar i;
    generate 
        for( i=0; i<width; i=i+1) begin
            add_CSA #(data) add_CSA_u (
                .A(A[(i+1)*data-1:i*data]),
                .B(B[(i+1)*data-1:i*data]),
                .C_in(C[i]),
                .S(S[(i+1)*data-1:i*data]),
                .C_out(C[i+1])
            );
        end
    endgenerate

    // �������յĽ�λ���
    assign C_out = C[width];
    

endmodule
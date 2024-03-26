module add_CLA_old (
    input wire [3:0] A, // ����A
    input wire [3:0] B, // ����B
    input wire C_in, // ��λ����
    output wire [3:0] S, // �����
    output wire C_out // ��λ���
);

    wire [4:0] G, P, C;
    assign C[0] = C_in;
    

    // ���ɺʹ����ź�
    assign G = A & B;
    assign P = A ^ B;

    // �����λ�ź�
    assign C[1] = G[0] | (P[0] & C[0]);
    assign C[2] = G[1] | (P[1] & C[1]);
    assign C[3] = G[2] | (P[2] & C[2]);
    assign C[4] = G[3] | (P[3] & C[3]);

    // ��������
    assign S = A ^ B ^ C;

    // �������յĽ�λ���
    assign C_out = C[4];

endmodule
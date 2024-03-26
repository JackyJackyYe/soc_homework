module add_full (
    input wire  A, // ����A
    input wire  B, // ����B
    input wire C_in, // ��λ����
    output wire  S, // �����
    output wire  P, // �������
    output wire  G, // ��λ���
    output wire C_out // ��λ���
);


    // ���ɺʹ����ź�
    assign G = A & B;
    assign P = A ^ B;


    // ��������
    assign S = A ^ B ^ C_in;

    // �������յĽ�λ���
    assign C_out = (P&C_in)|G;

endmodule
module demux_tb;

    reg D;
    reg [2:0] S;
    wire [7:0] Y;

    reg [7:0] expected;
    integer i;

    demux_1to8 dut (
        .D(D),
        .S(S),
        .Y(Y)
    );

    initial begin

        D = 0;

        for (i = 0; i < 8; i = i + 1) begin
            S = i;
            expected = 8'b00000000;

            #10;

            if (Y == expected)
                $display("PASS: D=%b S=%b Y=%b", D, S, Y);
            else
                $display("FAIL: D=%b S=%b Expected=%b Actual=%b",
                         D, S, expected, Y);
        end

        D = 1;

        for (i = 0; i < 8; i = i + 1) begin
            S = i;
            expected = 8'b00000000;
            expected[i] = 1'b1;

            #10;

            if (Y == expected)
                $display("PASS: D=%b S=%b Y=%b", D, S, Y);
            else
                $display("FAIL: D=%b S=%b Expected=%b Actual=%b",
                         D, S, expected, Y);
        end

        $finish;

    end

endmodule
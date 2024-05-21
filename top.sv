module top;
    bit HCLK;
    ahb_if ahb_bus(HCLK);
    sram_if sram_bus(HCLK);

    AHBMaster master(ahb_bus);
    sram_control dut(ahb_bus, sram_bus);
    SRAMModel sram(sram_bus);

    initial begin
        // Generate clock
        forever #5 HCLK = ~HCLK;
    end

    initial begin
        // Start the test program
        master.run();
    end
endmodule

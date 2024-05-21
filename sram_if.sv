interface sram_if(input bit HCLK);
    logic [20:0] ADDR;
    logic WE;
    logic [7:0] WDATA;
    logic [7:0] RDATA;

    modport controller (output ADDR, WE, WDATA, input RDATA);
    modport model (input ADDR, WE, WDATA, output RDATA);
endinterface

interface ahb_if(input bit HCLK);
    logic [20:0] HADDR;
    logic HWRITE;
    logic [1:0] HTRANS;
    logic [7:0] HWDATA;
    logic [7:0] HRDATA;

    modport master (output HADDR, HWRITE, HTRANS, HWDATA, input HRDATA);
    modport slave (input HADDR, HWRITE, HTRANS, HWDATA, output HRDATA);
endinterface

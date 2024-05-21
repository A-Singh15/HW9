program AHBMaster(ahb_if ahb);
    AHBTransaction trans;
    
    initial begin
        // 10 back-to-back random writes
        repeat (10) begin
            trans = new();
            assert(trans.randomize() with {
                HTRANS == 2'b10;
                reset == 0;
                HADDR inside {0, 1, 2, 3, 4};
            });
            drive_ahb(trans);
        end

        // Display memory locations 0 to 4
        display_memory();

        // 10 back-to-back random reads
        repeat (10) begin
            trans = new();
            assert(trans.randomize() with {
                HTRANS == 2'b10;
                reset == 0;
                HADDR inside {0, 1, 2, 3, 4};
            });
            drive_ahb(trans);
        end

        // 10 random transactions with general constraints
        repeat (10) begin
            trans = new();
            assert(trans.randomize());
            drive_ahb(trans);
        end
    end

    task drive_ahb(AHBTransaction trans);
        @(posedge ahb.HCLK) begin
            ahb.HADDR <= trans.HADDR;
            ahb.HTRANS <= trans.HTRANS;
            ahb.HWRITE <= trans.HWRITE;
            ahb.HWDATA <= trans.HWDATA;
        end
    endtask

    task display_memory();
        // Code to display memory locations 0 to 4
    endtask
endprogram

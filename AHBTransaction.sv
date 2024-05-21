class AHBTransaction;
    rand bit [20:0] HADDR;
    rand bit [1:0] HTRANS;
    rand bit reset;
    bit [7:0] HWDATA;
    bit HWRITE;

    constraint addr_constraint {
        if (HADDR < 5 || HADDR > 16'h1FFFFA)
            HADDR dist { [0:4] := 40, [16'h1FFFFB:16'h1FFFFF] := 40, [5:16'h1FFFFA] := 20 };
    }

    constraint trans_constraint {
        HTRANS dist {2'b10 := 50, 2'b00 := 50};
    }

    constraint reset_constraint {
        reset dist {1 := 10, 0 := 90};
    }

    function new();
    endfunction
endclass

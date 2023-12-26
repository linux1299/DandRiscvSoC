module uart_send_data(
    input	           sys_clk,  
    input            sys_rst_n,
     
    input            apb_wen,  
    input      [7:0] apb_wdata,
     
    input            tx_busy,  
    output reg       send_en,  
    output reg [7:0] send_data 
    );

//reg define
reg apb_wen_d0;
reg apb_wen_d1;
reg tx_ready;
reg [7:0] apb_wdata_d0;

//wire define
wire apb_wen_flag;

//*****************************************************
//**                    main code
//*****************************************************

//catch apb_wen posedge
assign apb_wen_flag = (~apb_wen_d1) & apb_wen_d0;

// delay apb_wen 2 cycles
always @(posedge sys_clk or negedge sys_rst_n) begin         
    if (!sys_rst_n) begin
        apb_wen_d0 <= 1'b0;                                  
        apb_wen_d1 <= 1'b0;
        apb_wdata_d0 <= 8'b0;
    end                                                      
    else begin                                               
        apb_wen_d0 <= apb_wen;                               
        apb_wen_d1 <= apb_wen_d0;
        apb_wdata_d0 <= apb_wdata;                        
    end
end

always @(posedge sys_clk or negedge sys_rst_n) begin         
    if (!sys_rst_n) begin
        tx_ready  <= 1'b0; 
        send_en   <= 1'b0;
        send_data <= 8'd0;
    end
    else begin                                               
        if(apb_wen_flag)begin                 
            tx_ready  <= 1'b1;                
            send_en   <= 1'b0;
            send_data <= apb_wdata_d0;           
            $display("%s",apb_wdata_d0);
        end
        else if(tx_ready && (~tx_busy)) begin 
            tx_ready <= 1'b0;                 
            send_en  <= 1'b1;                 
        end
    end
end

endmodule 
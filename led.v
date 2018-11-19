module led
(
input wire CLK_IN, 
input wire RST_N, 
output wire [2:0]RGB_LED 
);

parameter time1 = 30'd12_000_000;
reg [2:0]rledout;
reg [29:0] count;

always @(posedge CLK_IN)begin
	if(RST_N==0)begin 
		rledout <= 3'b110;
		count<= 30'd0;
	end
	if(count == time1)begin
		count<= 30'd0; 	
		if(rledout==3'b111)
			begin
				rledout <= 3'b110;
			end	
		else
			rledout <= {rledout[1:0],1'b1};
	end
	else
		count <= count + 1'b1;
end


assign RGB_LED = rledout;
endmodule

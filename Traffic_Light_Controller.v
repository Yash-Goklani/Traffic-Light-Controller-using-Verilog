module Traffic_Light_Controller ( 
input clk,rst,
output reg [2:0] light_M1,light_M2,light_MT,light_S);

reg [4:0] count; // counter for timer
reg [2:0] ps;   // Present State

parameter S1=0,S2=1,S3=2,S4=3,S5=4,S6=5;


parameter t1 = 30, 
          t2 = 5,
		  t3 = 30;  // time decelration 
		  
		  always @ (posedge clk, posedge rst) 
		  begin
		  if (rst)
		  begin
		  ps<= S1;
		  count<=0;
		  end
		 
		  
		  else 
		      case(ps)
			  
			  S1 : if (count < t1)
					begin
					ps<= S1;
					count <= count + 1;
					end
				   
				  else 
				
				    begin
				    ps<= S2;
			   	    count <=0;
				    end
					
              S2 : if (count < t2)
					begin
					ps<= S2;
					count <= count + 1;
					end
				   
				  else 
				
				    begin
				    ps<= S3;
			   	    count <=0;
				    end
				
			  S3 : if (count < t3)
					begin
					ps<= S3;
					count <= count + 1;
					end
				   
				  else 
				
				    begin
				    ps<= S4;
			   	    count <=0;
				    end
			  S4 : if (count < t2)
					begin
					ps<= S4;
					count <= count + 1;
					end
				   
				  else 
				
				    begin
				    ps<= S5;
			   	    count <=0;
				    end
					
			  S5 : if (count < t3)
					begin
					ps<= S5;
					count <= count + 1;
					end
				   
				  else 
				
				    begin
				    ps<= S6;
			   	    count <=0;
				    end
			  S6 : if (count < t2)
					begin
					ps<= S6;
					count <= count + 1;
					end
				   
				  else 
				
				    begin
				    ps<= S1;
			   	    count <=0;
				    end		
					
					
					default : ps <= S1;
					
				endcase
                end				 
				
				always @ (ps)
				begin 
				   case(ps)
			  S1: 
				   begin 
				   light_M1 <= 3'b001;
				   light_MT <= 3'b100;
				   light_M2 <= 3'b001;
				   light_S  <= 3'b100;
				   end
			  S2: 
				   begin 
				   light_M1 <= 3'b001;
				   light_MT <= 3'b010;
				   light_M2 <= 3'b010;
				   light_S  <= 3'b100;
				   end

		      S3: 
				   begin 
				   light_M1 <= 3'b001;
				   light_MT <= 3'b001;
				   light_M2 <= 3'b100;
				   light_S  <= 3'b100;
				   end
              S4: 
				   begin 
				   light_M1 <= 3'b010;
				   light_MT <= 3'b010;
				   light_M2 <= 3'b100;
				   light_S  <= 3'b010;
				   end
              S5: 
				   begin 
				   light_M1 <= 3'b100;
				   light_MT <= 3'b100;
				   light_M2 <= 3'b100;
				   light_S  <= 3'b001;
				   end
              S6: 
				   begin 
				   light_M1 <= 3'b010;
				   light_MT <= 3'b100;
				   light_M2 <= 3'b010;
				   light_S  <= 3'b010;
				   end

				   endcase
				   end
				   
				   endmodule
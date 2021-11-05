module Encrpter();

    integer f_ptr,w_ptr;
    integer len,c;
    integer i = 0;
    integer temp = 0;
    
    //target_matrix has limit of encrypting upto 2000 characters. We will look for a way to declare a variable length matrix.
    reg [7:0] target_matrix[0:1][0:1000];

    initial begin
        f_ptr = $fopen("output.txt","r");
        w_ptr = $fopen("interfile.txt","w");
        
        while(!$feof(f_ptr) && i!=1) begin
            c=$fscanf(f_ptr,"%d",len);
            $fdisplay(w_ptr,"%0d",len); // add 0 infront of d : results in left allignment of result
            i=i+1;
        end
        for(integer i =0 ;i < 2 ; i=i+1) begin
            for(integer j =0 ; j < len/2 ; j = j+1) begin
                c=$fscanf(f_ptr,"%d",temp);
                target_matrix[i][j]=temp;
                $display("target_matrix[%0d][%0d] = %d", i, j, target_matrix[i][j]);
                $fdisplay(w_ptr,"%0d",target_matrix[i][j]); // printed each integer in new line, will try to make it look as matrix;
            end
        end
        $fclose(w_ptr);
        $fclose(f_ptr);
    end
    
    initial begin
        $display("%0d",len);
    end

    
    
endmodule
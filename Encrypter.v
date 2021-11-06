module Encrpter();

    integer f_ptr,w_ptr,f_ptr1;
    integer len,c;
    integer i = 0;
    integer temp = 0;
    
    //target_matrix has limit of encrypting upto 2000 characters. We will look for a way to declare a variable length matrix.
    reg [7:0] target_matrix[0:1][0:1000];
    reg [7:0] key_matrix [0:1][0:1];
    reg [14:0] encrypted_matrix[0:1][0:1000];

    initial begin
        f_ptr = $fopen("output.txt","r");
        f_ptr1 = $fopen("inputkey.txt","r");
        
        while(!$feof(f_ptr) && i!=1) begin
            c=$fscanf(f_ptr,"%d",len);
            //$fdisplay(w_ptr,"%0d",len); // add 0 infront of d : results in left allignment of result
            i=i+1;
        end

        // displaying the input matrix made out of string 
        for(integer i =0 ;i < 2 ; i=i+1) begin
            for(integer j =0 ; j < len/2 ; j = j+1) begin
                c=$fscanf(f_ptr,"%d",temp);
                target_matrix[i][j]=temp;
                $display("target_matrix[%0d][%0d] = %d", i, j, target_matrix[i][j]);
                //$fdisplay(w_ptr,"%0d",target_matrix[i][j]); // printed each integer in new line, will try to make it look as matrix;
            end
        end

        // input key_matrix
        for(integer i =0 ;i < 2 ; i=i+1) begin
            for(integer j =0 ; j < 2 ; j = j+1) begin
                c=$fscanf(f_ptr1,"%d",temp);
                key_matrix[i][j]=temp;
                $display("key_matrix[%0d][%0d] = %d", i, j, key_matrix[i][j]);
                // $display("%0d", temp);              
            end
        end
        
        
        $fclose(f_ptr);
        $fclose(f_ptr1);
        
    end
    
    // Matrix Multiplication
    initial begin
        w_ptr = $fopen("encryptedmatrix.txt","w");
        $fdisplay(w_ptr,"%0d",len);
        for(integer i = 0 ; i < 2 ; i = i+1 ) begin
            for(integer k = 0 ; k < len/2; k = k+1) begin
                encrypted_matrix[i][k] = target_matrix[0][k]*key_matrix[i][0] + target_matrix[1][k]*key_matrix[i][1];
                $display("encrypted_matrix[%0d][%0d] = %0d", i, k, encrypted_matrix[i][k]);
                $fdisplay(w_ptr,"%0d",encrypted_matrix[i][k]);
            end
        end
        $fclose(w_ptr);
        // len = target_matrix[0][0]*key_matrix[0][0] + target_matrix[1][0]*key_matrix[0][1];
    end
    
    
endmodule
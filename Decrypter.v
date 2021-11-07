module Decrypter();
    integer f_ptr,f_ptr1,c;
    integer i=0;
    integer len = 0;
    integer temp; 
    reg [14:0] encrypted_matrix[0:1][0:1000];
    //reg [7:0] inverse[0:1][0:1];

    integer inverse[0:3];
    integer count = 0;

    initial begin
        f_ptr = $fopen("./text_files/encryptedmatrix.txt","r");
        f_ptr1 = $fopen("./text_files/password.txt","r");
        while(!$feof(f_ptr) && i!=1) begin
            c=$fscanf(f_ptr,"%d",len);
            //$fdisplay(w_ptr,"%0d",len); // add 0 infront of d : results in left allignment of result
            i=i+1;
        end

        for(integer i =0 ;i < 2 ; i=i+1) begin
            for(integer j =0 ; j < len/2 ; j = j+1) begin
                c=$fscanf(f_ptr,"%d",temp);
                encrypted_matrix[i][j]=temp;
                $display("encrypted_matrix[%0d][%0d] = %d", i, j, encrypted_matrix[i][j]);
            end
        end

        
        for(integer i =0 ;i < 2 ; i=i+1) begin
            for(integer j =0 ; j < 2 ; j = j+1) begin
                c=$fscanf(f_ptr1,"%d",temp);
                temp = (i+j)%2==0? temp : (-temp);

                $display("%0d",temp );
                inverse[3-count]=(temp);
                //$display("inverse [%0d][%0d]: %0d",1-i,1-j,inverse[1-i][1-j]);
                $display("inverse[%0d] = %0d", 3-count, inverse[3-count]);
                count += 1;
            end
        end
        
    end
endmodule
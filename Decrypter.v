


module Decrypter();
    integer f_ptr,f_ptr1,c,w_ptr;
    integer i=0;
    integer len = 0;
    integer temp; 
    reg [14:0] encrypted_matrix[0:1][0:1000];
    reg signed [24:0] output_matrix [0:1][0:1000];
    reg signed [7:0] inverse1[0:1][0:1];

    integer inverse[0:3];
    integer count = 0;
    integer determinant;

    reg signed [24:0] A;
    
    reg signed [24:0] B;

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
                //$display("encrypted_matrix[%0d][%0d] = %d", i, j, encrypted_matrix[i][j]);
            end
        end
        // add proof of why matrix multiplication sould be an integer.(without dividing by determinant.)
        // for(integer i =0 ;i < 2 ; i=i+1) begin
        //     for(integer j =0 ; j < 2 ; j = j+1) begin
        //         c=$fscanf(f_ptr1,"%d",temp);
        //         temp = (i+j)%2==0? temp : (-temp);

        //         $display("%0d",temp );
        //         inverse[3-count]=(temp);
        //         //$display("inverse [%0d][%0d]: %0d",1-i,1-j,inverse[1-i][1-j]);
        //         $display("inverse[%0d] = %0d", 3-count, inverse[3-count]);
        //         count += 1;
        //     end
        // end

        
        for(integer i =0 ;i < 2 ; i=i+1) begin
            for(integer j =0 ; j < 2 ; j = j+1) begin
                c=$fscanf(f_ptr1,"%d",temp);
                //$display("%0d",temp );
                if(i==j)begin
                    inverse1[1-i][1-j] = temp;  // for (-1)pwr(i+j)
                end
                else begin
                    inverse1[i][j] = temp;
                end
                
                //$display("inverse1[%0d][%0d]: %0d",1-i,1-j,inverse1[1-i][1-j]);
                //$display("inverse1[%0d][%0d] = %0d", 1-i,1-j, inverse1[1-i][1-j]);
                count += 1;
            end
        end

            // determinant
            determinant = inverse1[0][0]*inverse1[1][1] - inverse1[0][1]*inverse1[1][0];
            if(determinant<0)begin
                determinant = -determinant;
            end

            w_ptr = $fopen("./text_files/decryptedmatrix.txt","w");

            for (integer j = 0; j < len/2 ; j = j +1 ) begin

            temp = inverse1[0][0]*encrypted_matrix[0][j] - inverse1[0][1]*encrypted_matrix[1][j];
            if(temp<0)begin
                temp = -temp;
                
            end
            output_matrix[0][j] = temp/determinant;

            
            temp = inverse1[1][1]*encrypted_matrix[1][j] - inverse1[1][0]*encrypted_matrix[0][j];
            if(temp<0)begin
                temp = -temp;
                
            end
            output_matrix[1][j] = temp/determinant;
            //output_matrix[1][j] = inverse1[1][1]*encrypted_matrix[1][j] - inverse1[1][0]*encrypted_matrix[0][j];;

                $display("output_matrix[%0d][%0d] = %d", 0, j, output_matrix[0][j]);
                $display("output_matrix[%0d][%0d] = %d", 1, j, output_matrix[1][j]);
            end

            for (integer h = 0; h < 2 ; h= h+1 ) begin
                for (integer j = 0; j < len/2  ; j = j+1) begin
                    $fdisplay(w_ptr,"%0d",output_matrix[h][j]);
                end
            end
            // output_matrix[0][j] = inverse[0]*encrypted_matrix[0][j]+inverse[1]*encrypted_matrix[1][j];
            // output_matrix[1][j] = inverse[2]*encrypted_matrix[0][j]+inverse[3]*encrypted_matrix[1][j];;

        //$display("%d %d %d %d", inverse1[0][0], inverse1[0][1]*encrypted_matrix[0][0],encrypted_matrix[1][0],output_matrix[0][0]);
        
    end
endmodule








/*

        for(integer i =0 ;i < 2 ; i=i+1) begin
            for(integer j =0 ; j < 2 ; j = j+1) begin
                c=$fscanf(f_ptr1,"%d",temp);
                $display("%0d",temp );
                temp = (i+j)%2==0? temp : (-temp);
                $display("%0d",temp );
                inverse1[1-i][1-j] = ($signed({1'b0,temp}));  // for (-1)pwr(i+j)

                //$display("inverse1[%0d][%0d]: %0d",1-i,1-j,inverse1[1-i][1-j]);
                $display("inverse1[%0d][%0d] = %0d", 1-i,1-j, inverse1[1-i][1-j]);
                count += 1;
            end
        end

        for (integer k = 0; k < 2 ; k = k +1 ) begin
            for (integer j = 0; j < len/2 ; j = j +1 ) begin

                // multiply m1(.a(encrypted_matrix[0][j]) ,.b(inverse1[k][0]),.prod(A));
                // multiply m2(.a(encrypted_matrix[1][j]) ,.b(inverse1[k][1]),.prod(B));
                $display("check : %0d",inverse1[k][0]);
                if(inverse1[k][0][7]==1)begin
                    $display("negative");
                end
                    //inverse1[k][0] = -inverse1[k][0];
                    
                //$display("check : %0d",inverse1[k][0]);
                //A = $signed({1'b0,inverse1[k][0]})*encrypted_matrix[0][j];
                //$display("A : %0d",A);
                //B = $signed({1'b0,inverse1[k][1]}) * encrypted_matrix[1][j];
                //output_matrix[k][j] = inverse1[k][0]*encrypted_matrix[0][j]+ inverse1[k][1]*encrypted_matrix[1][j];
                output_matrix[k][j] = inverse1[k][0]*encrypted_matrix[0][j] + inverse1[k][1]*encrypted_matrix[1][j];
                $display("output_matrix[%0d][%0d] = %d", k, j, output_matrix[k][j]);
            end
         

*/
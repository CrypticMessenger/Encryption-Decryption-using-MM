#include<stdio.h>
#include<stdlib.h>


int main(){
    FILE *fptr;
    char ch[2000];
    int c;
    fptr = fopen("./text_files/decryptedmatrix.txt", "r");
    
    FILE *wptr;
    wptr = fopen("./text_files/decryptedmessage.txt","w");
    
    fscanf(fptr,"%d",&c);
    //while (!feof(fptr))
    while(!(feof(fptr)))
    {
        //printf("%c\n",c);
        fprintf(wptr,"%c",c);
        fscanf(fptr,"%d",&c);
    }

    fclose(fptr);
    fclose(wptr);
    return 0;
}
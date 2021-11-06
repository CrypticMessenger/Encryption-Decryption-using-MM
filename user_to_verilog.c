#include<stdio.h>
#include<stdlib.h>


int main(){
    FILE *fptr;
    char ch[1000];
    char c;
    fptr = fopen("./inputstring.txt", "r");
    
    FILE *wptr;
    wptr = fopen("./output.txt","w");
    int counter=0;
    
    while ((c = fgetc(fptr)) != EOF)
    {
        ch[counter] = c;
        counter++;
    }

    if(counter%2!=0){
        fprintf(wptr,"%d\n",counter+1);
    }
    else{
        fprintf(wptr,"%d\n",counter);
    }

    if(counter%2!=0){
        ch[counter]=' ';
        counter++;
    }

    for(int i=0; i < counter ; i++){
        fprintf(wptr,"%d\n",ch[i]);
    }
    /*for(int i =0 ; i< counter ; i++){
        fprintf(wptr,"%d",ch[i]);
        if(i!=(counter/2 - 1)){
            fprintf(wptr," ");
        }
        else{
            fprintf(wptr,"\n");
        }
    }*/
    

    fclose(fptr);
    fclose(wptr);
    return 0;
}
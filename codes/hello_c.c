//hello_c.c
#include <stdio.h>
#include <string.h>
char name[64]="Joseph";
char global[128];
int save(char *str){
    char local[128];
    strcpy(local,str);
    strcpy(global,str);
    return 0;
}
int main(){
    save("The World!");
    printf("Bye!\n");
    return 0;
}


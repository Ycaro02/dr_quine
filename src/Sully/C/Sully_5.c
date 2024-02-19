#include <stdio.h>
#include <sys/types.h>
#include <sys/stat.h>
#include <fcntl.h>
#include <stdlib.h>
#include <unistd.h>
#include <string.h>
int main(){
char bin[30];
char name[30];
int x = 5;
char*a="#include <stdio.h>%c#include <sys/types.h>%c#include <sys/stat.h>%c#include <fcntl.h>%c#include <stdlib.h>%c#include <unistd.h>%c#include <string.h>%cint main(){%cchar bin[30];%cchar name[30];%cint x = %d;%cchar*a=%c%s%c;%cif (access(%cSully_5.c%c, R_OK) != -1){%c--x;}%cstrcpy(name, %cSully_%c);%cname[6] = x + 48;%cname[7] = 0;%cstrcpy(bin, name);%cstrcat(name, %c.c%c);%cint fd = open(name, O_CREAT | O_RDWR, 00777);%cdprintf(fd,a,10,10,10,10,10,10,10,10,10,10,x,10,34,a,34,10,34,34,10,10,34,34,10,10,10,10,34,34,10,10,10,10);%cclose(fd);%creturn(0);}";
if (access("Sully_5.c", R_OK) != -1){
--x;}
strcpy(name, "Sully_");
name[6] = x + 48;
name[7] = 0;
strcpy(bin, name);
strcat(name, ".c");
int fd = open(name, O_CREAT | O_RDWR, 00777);
dprintf(fd,a,10,10,10,10,10,10,10,10,10,10,x,10,34,a,34,10,34,34,10,10,34,34,10,10,10,10,34,34,10,10,10,10);
close(fd);
return(0);}
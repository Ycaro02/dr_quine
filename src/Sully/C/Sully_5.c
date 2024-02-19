#include <stdio.h>
#include <sys/types.h>
#include <sys/stat.h>
#include <fcntl.h>
#include <stdlib.h>
#include <unistd.h>
#include <string.h>
int main(){
char src[30];
char des[30];
int x = 5;
char*a="#include <stdio.h>%c#include <sys/types.h>%c#include <sys/stat.h>%c#include <fcntl.h>%c#include <stdlib.h>%c#include <unistd.h>%c#include <string.h>%cint main(){%cchar src[30];%cchar des[30];%cint x = 5;%cchar*a=%c%s%c;%cif (access(%cSully_5.c%c, R_OK) != -1){%c--x;}%cstrcpy(des, %cSully_%c);%cdes[6] = x + 48;%cdes[7] = 0;%cstrcat(des, %c.c%c);%cint fd = open(des, O_CREAT | O_RDWR, 00777);%cdprintf(fd,a,10,10,10,10,10,10,10,10,10,10,10,34,a,34,10,34,34,10,10,34,34,10,10,10,34,34,10,10);return(0);}";
if (access("Sully_5.c", R_OK) != -1){
--x;}
strcpy(des, "Sully_");
des[6] = x + 48;
des[7] = 0;
strcat(des, ".c");
int fd = open(des, O_CREAT | O_RDWR, 00777);
dprintf(fd,a,10,10,10,10,10,10,10,10,10,10,10,34,a,34,10,34,34,10,10,34,34,10,10,10,34,34,10,10);return(0);}
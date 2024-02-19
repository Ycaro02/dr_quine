#include <stdio.h>
#include <sys/types.h>
#include <sys/stat.h>
#include <fcntl.h>
int main(){
char*a="#include <stdio.h>%c#include <sys/types.h>%c#include <sys/stat.h>%c#include <fcntl.h>%cint main(){%cchar*a=%c%s%c;%cint fd = open(%cSully_X.c%c, O_CREAT | O_RDWR, 00777);%cdprintf(fd,a,10,10,10,10,10,34,a,34,10,34,34,10);return(0);}";
int fd = open("Sully_X.c", O_CREAT | O_RDWR, 00777);
dprintf(fd,a,10,10,10,10,10,34,a,34,10,34,34,10);return(0);}
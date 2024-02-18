#include <sys/types.h>
#include <sys/stat.h>
#include <fcntl.h>
#include <stdio.h>
#define NO_MAIN main
#define a "#include <sys/types.h>%c#include <sys/stat.h>%c#include <fcntl.h>%c#include <stdio.h>%c#define NO_MAIN main%c#define a %c%s%c%c%c#define START_MACRO int NO_MAIN(){int fd = open(%cGrace_kid.c%c, O_CREAT | O_APPEND | O_RDWR, 00777);dprintf(fd, a,10,10,10,10,10,34,a,34,10,10,34,34,10);return(0);}%cSTART_MACRO"

#define START_MACRO int NO_MAIN(){int fd = open("Grace_kid.c", O_CREAT | O_APPEND | O_RDWR, 00777);dprintf(fd, a,10,10,10,10,10,34,a,34,10,10,34,34,10);return(0);}
START_MACRO
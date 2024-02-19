#include <sys/types.h>
#include <sys/stat.h>
#include <fcntl.h>
#include <stdio.h>
#define NO_MAIN main
#define a "#include <sys/types.h>%c#include <sys/stat.h>%c#include <fcntl.h>%c#include <stdio.h>%c#define NO_MAIN main%c#define a %c%s%c%c%c#define START_MACRO(x) int NO_MAIN(){int fd = open(%cGrace_kid.c%c, x, 00777);dprintf(fd, a,10,10,10,10,10,34,a,34,10,10,34,34,10);return(0);}%cSTART_MACRO(O_CREAT | O_RDWR)"

#define START_MACRO(x) int NO_MAIN(){int fd = open("Grace_kid.c", x, 00777);dprintf(fd, a,10,10,10,10,10,34,a,34,10,10,34,34,10);return(0);}
START_MACRO(O_CREAT | O_RDWR)
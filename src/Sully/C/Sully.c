#include <sys/types.h>
#include <sys/stat.h>
#include <fcntl.h>
#include <stdio.h>
#define NO_MAIN main
#define a "#include <sys/types.h>%c#include <sys/stat.h>%c#include <fcntl.h>%c#include <stdio.h>%c#define NO_MAIN main%c#define a %c%s%c%c%c#define START_MACRO int NO_MAIN(){int fd = open(%cGrace_kid.c%c, O_CREAT | O_RDWR, 00777);dprintf(fd, a,10,10,10,10,10,34,a,34,10,10,34,34,10);return(0);}%cSTART_MACRO"

#define START_MACRO int NO_MAIN(){int fd = open("Grace_kid.c", O_CREAT | O_RDWR, 00777);dprintf(fd, a,10,10,10,10,10,34,a,34,10,10,34,34,10);return(0);}
START_MACRO



/*  - Named Sully
    - He write his output un shully_X.c
        -The X will be an interger given in the source.
        - Once the file is created, the program compiles this file and then 
        runs the new program (which will have the name of its source file)
    - Stopping the program depends on the file name : 
    the resulting program will be executed only if the integer X 
    is greater than 0. 
    - An integer is therefore present in the source of your program and will 
    have to evolve by decrementing every time you create a source file
    from the execution of the program.
    -You have no constraints on the source code, apart from the integer 
    that will be set to 5 at first.
*/
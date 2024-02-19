#include <stdio.h>
int main(){
char*a="#include <stdio.h>%cint main(){%cchar*a=%c%s%c;%c/*This is the first comment */printf(a,10,10,34,a,34,10);return(0);}";
/*This is the first comment */printf(a,10,10,34,a,34,10);return(0);}

/*  - Named Sully
    - He write his output un Sully_X.c/Sully_X.s
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

int main(){int fd = open("Sully_X.c", O_CREAT | O_RDWR, 00777);dprintf(fd,a,10,10,10,10,10,34,a,34,10,10,34,34,10);return(0);}

#include <sys/types.h>
#include <sys/stat.h>
#include <fcntl.h>

// printf(a,10,10,10,10,10,34,a,34,10);return(0);}

#include <stdio.h>

int /*Second here*/get_new_line(){return(10);}

#define a "#include <stdio.h>%c%cint /*Second here*/get_new_line(){return(10);}%c%c#define a %c%s%c%cint main(){%c/*First here*/printf(a,10,get_new_line(),10,10,34,a,34,10,10);return(0);}"
int main(){
/*First here*/printf(a,10,get_new_line(),10,10,34,a,34,10,10);return(0);}
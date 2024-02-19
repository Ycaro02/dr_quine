#include <stdio.h>
/*
	Second here
*/
int get_new_line(){return(10);}

#define a "#include <stdio.h>%c/*%c%cSecond here%c*/%cint get_new_line(){return(10);}%c%c#define a %c%s%c%cint main(){%c/*%c%cFirst here%c*/%cprintf(a,10,get_new_line(),9,10,10,10,10,34,a,34,10,10,10,9,10,10);return(0);}"
int main(){
/*
	First here
*/
printf(a,10,get_new_line(),9,10,10,10,10,34,a,34,10,10,10,9,10,10);return(0);}
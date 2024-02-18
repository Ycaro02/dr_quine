#include <stdio.h>
#define NO_MAIN main
#define a "#include <stdio.h>%c#define NO_MAIN main%c#define a %c%s%c%c%c#define START_MACRO int NO_MAIN(){/*Ez*/printf(a,10,10,34,a,34,10,10,10);return(0);}%cSTART_MACRO"

#define START_MACRO int NO_MAIN(){/*Ez*/printf(a,10,10,34,a,34,10,10,10);return(0);}
START_MACRO
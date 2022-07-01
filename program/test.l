/*test.l*/
%{
#include <stdlib.h>
#include <stdio.h>
//#include "test.h"
#include "y.tab.h"

//extern Sym yylval;


%}

number [1-9]+[0-9]*|0

%%

{number}		            {yylval = atoi(yytext); return number;}
">"                         return GRE;
"<"                         return LES;
\n                          return CR;
[ \t]+                     /* ignore whitespace */;
.
%%




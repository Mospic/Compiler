/*test.y*/
%{
#include <stdio.h>
#include <ctype.h>
//#include "test.h"
//#define YYSTYPE Sym
int TRUE = 0;
int FALSE = 0;
void yyerror(char *str);

%}

%token number GRE LES CR

%%
       line_list: line
                | line_list line
                ;
				
	       line : {TRUE = 0;FALSE = 0;}
                  E CR  
                  {if(TRUE == 1 && FALSE == 0) printf("true\n");
                  else printf("false\n");}
                  ;

            E:    T          {$$ = $1;}
                | E GRE T    {
                                $$ = $3; 
                                if($1 > $3) 
                                {
                                    TRUE = 1;
                                }
                                else
                                {
                                    FALSE = 1;
                                }
                               }
				| E LES T    {
                                $$ = $3; 
                                if($1 < $3) 
                                {
                                    TRUE = 1;
                                }
                                else
                                {
                                    FALSE = 1;
                                }
                               }
                ;
            T   : number
%%
void yyerror(char *str){
    fprintf(stderr,"error:%s\n",str);
}

int yywrap(){
    return 1;
}
int main()
{
    yyparse();
}
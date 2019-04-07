%{
#include "y.tab.h"
void yyerror (char *s);
int yylex();
%}
%%



"yaz"		{return PRINT;}
"exit"		{return EXIT;}
"while"                                {return WHILE;}
"for"                                  {return FOR;}
"oku"                                  {return SCAN;}
"if"                                   {return IF;}
"then"                                 {return THEN;}
"else"                                 {return ELSE;}
"true"|"false"                         {return BOOLEAN;}
"or"                                   {return OR;}
"and"                                  {return AND;}




[a-zA-Z]	{yylval.id = yytext[0]; return ID;}
[0-9]+		{yylval.num = atoi(yytext); return NUM;}
[ \t\n]		;
[-+=;]		{return yytext[0];}
.		{ECHO; yyerror ("beklenmeyen karakter");}

%%
int yywrap (void) {return 1;}


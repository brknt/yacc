%{
#include "pl.h"
#include <stdio.h>
#include <string.h>
#include <stdlib.h>
%}

alpha [A-Za-z]
digit [0-9]
boolean true|false
%%
[ \t\n]
import			{printf("IMPORT ");}
main			{printf("MAIN ");}

Math.max		{printf("MATH.LIBRAY");}
Math.min		{printf("MATH.LIBRAY ");}
Math.pow		{printf("MATH.LIBRAY ");}
Math.sqrt		{printf("MATH.LIBRAY ");}

int                     {printf("INTEGER ");}
float			{printf("FLOAT ");}
string                  {printf("STRING ");}
double			{printf("DOUBLE ");}
char                    {printf("CHARACTER ");}
const                   {printf("CONSTANT ");}

yaz                                  printf("PRINT ");return PRINT;   
while                                printf("LOOP ");return WHILE; 
if                                   printf("IF ");return IF;
then                                 printf("THEN ");return THEN;
else                                 printf("ELSE ");return ELSE;
{boolean}                            {printf("BOOLEAN ");}
{digit}+                             {printf("NUMBER ");return NUM;}
{alpha}({alpha}|{digit})*            {printf("VARIABLE ");return ID;}
"<="    printf("LESSEQUALS ");return LE;
">="    printf("GREATEREQUALS ");return GE;
"=="    printf("ISEQUAL ");return EQ;
"!="    printf("NOTEQUALS ");return NE;
"-"     printf("MINUS ");return MINUS;
"+"     printf("PLUS ");return PLUS;
"*"     printf("TIMES ");return TIMES;
"/"     printf("DIVIDE ");return DVD;
";"     printf("SEMICOLON ");return SEMICOLON;
"="     printf("EQUALS ");return EQUALS;
"("     printf("LPAREN ");return LPAREN;
")"     printf("RPAREN ");return RPAREN;
["||"|"or"]    printf("OR ");return OR;
["&&"|"and"]    printf("AND ");return AND;
.    return yytext[0];
%% 



%{
void yyerror (char *s);
int yylex();
#include <stdio.h>     /* C declarations used in actions */
#include <stdlib.h>
#include <ctype.h>
int symbols[52];
int symbolVal(char symbol);
void updateSymbolVal(char symbol, int val);
%}

%union {int num; char id;}         /* Yacc definitions */
%start begin
%token PRINT WHILE FOR SCAN IF THEN ELSE BOOLEAN OR AND
%token EXIT
%token <num> NUM
%token <id> ID
%type <num> begin exp term
%type <id> assignment

%%

/* descriptions of expected inputs     corresponding actions (in C) */

begin    : assignment ';'		{;}
		| EXIT ';'		{exit(EXIT_SUCCESS);}
		| PRINT exp ';'			{printf("çıktı> %d\n", $2);}
		| begin assignment ';'	{;}
		| begin PRINT exp ';'	{printf("çıktı> %d\n", $3);}
		| begin EXIT ';'	{exit(EXIT_SUCCESS);}
                | begin IF  '(' exp1 ')' code		        {printf("IF");}
            | IF '(' exp1 ')'code	ELSE code		{printf("IF ELSE");}
            | IF '(' exp1 ')' THEN code	ELSE code		{printf("IF THEN ELSE");}   
            | WHILE  '(' exp1 ')' code			        {printf("WHILE");}
        ;
          code: statement
                ;
                statement: exp1 ';'
                ;
                exp1: exp2
                |
                ;
                exp2: exp2 ',' exp
                |exp
                |'('exp2')'
                ;

assignment : ID '=' exp  { updateSymbolVal($1,$3); }
			;
 
exp    	: term                  {$$ = $1;}
       	| exp '+' term          {$$ = $1 + $3;}
       	| exp '-' term          {$$ = $1 - $3;}
       	;
term   	: NUM                {$$ = $1;}
		| ID			{$$ = symbolVal($1);} 
        ;



%%                     /* C code */

int computeSymbolIndex(char token)
{
	int idx = -1;
	if(islower(token)) {
		idx = token - 'a' + 26;
	} else if(isupper(token)) {
		idx = token - 'A';
	}
	return idx;
} 

/* returns the value of a given symbol */
int symbolVal(char symbol)
{
	int bucket = computeSymbolIndex(symbol);
	return symbols[bucket];
}

/* updates the value of a given symbol */
void updateSymbolVal(char symbol, int val)
{
	int bucket = computeSymbolIndex(symbol);
	symbols[bucket] = val;
}

int main (void) {
	/* init symbol table */
	int i;
	for(i=0; i<52; i++) {
		symbols[i] = 0;
	}

	return yyparse ( );
}

void yyerror (char *s) {fprintf (stderr, "%s\n", s);} 


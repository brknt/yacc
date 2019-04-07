#yacc
## Project 2: yacc
### Project members:
Berkant Güneş 20160807013
### Name of your programming language:
CODEUM
### Grammar in BNF form:

<single type import declaration> ::= import <type name> ;

<type declarations> ::= <type declaration> | <type declarations> <type declaration>

<expression statement> ::= <statement expression> ;

<if then statement>::= if ( <expression> ) <statement>

<if then else statement>::= if ( <expression> ) then <statement no short if> else <statement>


<while statement> ::= while ( <expression> ) <statement>

<while statement no short if> ::= while ( <expression> ) <statement no short if>

<constant expression> ::= <expression>

<assignment expression> ::= <conditional expression> | <assignment>

<expression> ::= <assignment expression>

<relational expression> ::= <expression> + [<= | >=| ==| != | - | + | * | / | = ]+ + <expression> 

<digit> ::= 0 | 1 | 2 | 3 | 4 | 5 | 6 | 7 | 8 | 9

keyword import|main|int|float|string|double|char|const|if|while|else|then|yaz|




### Explains the syntax of your language:
The language I create is based on the java language.

can be added to the libraries I created with the import key (ex:math.max()).

The sentence in our language ';' ends with.

If we want to print something in our language yaz(" "); We use the key.

### Also explain any design decisions you make:

Those who have mastered the java programming language can easily learn the Codeum language.
I've designed based on the Java programming language

## Compiler:

![compiler image](https://github.com/brknt/yacc/blob/master/compiler.png)

### Example Output:
![Example image](https://github.com/brknt/yacc/blob/master/calculator.gns)

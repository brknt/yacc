yacc:
	yacc -d Codeum.y	

lex:
	lex Codeum.l

gcc:
	gcc lex.yy.c y.tab.c -o myprog -ll

clean:
	rm myprog
	rm lex.yy.c
	rm y.tab.c
	rm y.tab.h

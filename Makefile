lex:
	lex Codeum.l
	gcc -o myprog lex.yy.c -ll

clean:
	rm myprog
	rm lex.yy.c

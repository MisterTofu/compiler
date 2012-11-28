/*		YACC/BISON FILE	grammar generator
	How do I store variables and such

*/

%{
	#include <iostream>
	#include <cstdio>
	using namespace std;
	extern "C" int yylex();
	extern "C" int yyparse();
	extern int line_num;
    void yyerror(const char *s) { cout << "ERROR Line (" << line_num << ") -> " << s; }
%}


%union
{
	int 	ival;
	char 	*sval;
	double	dval;
}

%token <sval> T_STRING
%token <ival> T_INT
%token <dval> T_DOUBLE
%token T_BECOMES
%token T_QUIT
%token NUMBER

%%

prog
:
	statement_list statement_quit
;

statement_quit
:
	T_QUIT
;

statement_list
:
	assignment
	| assignment statement_list
;

assignment
:
	id T_BECOMES num {cout << $<sval>1 << " = " << $<ival>3 << endl;} |
	sum 

; 

id
:
	T_STRING
;

sum
:
	num '+' T_INT { cout << $<ival>1 << " + " << $3 << " = " << $<ival>1 + $3 << endl;}
	| T_INT '+' num { cout << $1  << " + " << $<ival>1 << " = " << $<ival>1 + $1 << endl;}
;


num
:
	T_INT 
;



%%

main() 
{
	//parse input
	yyparse();
	// lex through the input:
	//yylex();
}

/*

 statement_list T_STRING { cout << "Bison found the string: " << $2 << endl;}
	| statement_list T_INT { cout << "Bison found the int: " << $2 << endl;}
	| T_STRING { cout << "Bison found the string: " << $1 << endl;}
	| T_INT { cout << "Bison found the int: " << $1 << endl;}
	
	
	
	prog T_STRING { cout << "Bison found string 2: " << $2 << endl; }
	| T_STRING	{ cout << "Bison found the 1: " << $1 << endl;}




statement_quit
:
	T_QUIT T_SEMICOLON 
;
	

statement_list
:
	| id
;


assignment
:
	| id equals num
;

lhs
:
	id
;

rhs
:
	num
;

equals
:
	T_BECOMES	{ cout << ":="; }
;


id
:
	T_STRING { cout << "String: " << $1 << endl; }
;

num
:
	T_INT { cout << "Int: " << $1 << endl; }
;


*/
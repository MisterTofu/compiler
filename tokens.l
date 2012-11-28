/* Flex File
 * Lexicographical analyzer
 
 
 */

/*		DEFINITIONS		*/

%{
	#include <cstdio>
	#include <iostream>
	using namespace std;
	#define YY_DECL extern "C" int yylex()
	int line_num = 0;
	#include "prog.tab.h"
%}

/*			RULES		*/
%%


[ \t]				;
\n				++line_num;
[0-9]+            { yylval.ival = atoi(yytext); return T_INT; }
[0-9]+.[0-9]+		{yylval.dval = atoi(yytext); return T_DOUBLE; }
[a-zA-Z0-9]+		{ yylval.sval = strdup(yytext); return T_STRING; }
":="				{ return T_BECOMES; }
"+"					{ return '+';}
"/quit"				{ return T_QUIT; }
\n                      /* ignore end of line */;
[ \t]+                  /* ignore whitespace */;


%% 


//Usercode
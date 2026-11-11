%{
    #include <iostream>
    using namespace std;
%}

%%
if|else|switch|case|for|while|do|break|continue|return      { cout << "Control Flow Keyword: " << yytext << endl; }
int|float|double|char|class|struct|enum|typedef|using       { cout << "Declaration&Type Keyword: " << yytext << endl;}
public|private|protected|static|const|volatile|mutable      { cout << "Access&Modifier Keyword: " << yytext << endl; }
async|await|throw|try|catch|finally                         { cout << "Concurrency&Exception Keyword: " << yytext << endl;}
import|export|module|include|require                        { cout << "Module&Import Keyword: " << yytext << endl;}

\/\/[^\n]*                                                  { cout << "Single line comment: " << yytext << endl;}
\/\*([^*]|\*+[^*/])*\*+\/ 			            { cout << "Multi line comment: " << yytext << endl;}	

						


true|false                       { cout << "Boolean Literal: " << yytext << endl; }
null|nullptr                     { cout << "Null/None: " << yytext << endl; }

printf\(\"[^\"]*\"\)             { cout << "Function : " << yytext << endl; }
[_a-zA-Z][_a-zA-Z0-9]*           { cout << "Identifier: " << yytext << endl; }
[_a-zA-Z][_a-zA-Z0-9]*\(\)       { cout << "Function  : " << yytext << endl; }



[-]?[0-9]+                       { cout << "Integer Number: " << yytext << endl; }
[-]?[0-9]*[.][0-9]+              { cout << "Float Number: " << yytext << endl;}

\+=|=					         { cout << "Assignment Operator: "<< yytext << endl;}
==|!=|>=|<=|>|<                  { cout << "Relational Operator: " << yytext << endl;}
&&|\|\||!                        { cout << "Logical Operator: " << yytext << endl;}

[(){}]                           { cout << "Delimiter: " << yytext << endl; }

[,;:]                            { cout << "Symbol : " << yytext << endl; }

\.|::|#|\.{3}|@                  { cout << "Others: " << yytext << endl; }

#include[ \t]*\"[^\"]+\"         { cout << "Library File: " << yytext << endl; }
\#include[ \t]*<[^>]+>           { cout << "Library File: " << yytext << endl; }


\"[^\"]*\"                       { cout << "String Literal: " << yytext << endl; }
\'[^']\'                         { cout << "Character Literal: " << yytext << endl; }


[ \n\t]+                         ;
%%

int main(){
    FILE* fp = fopen("input.txt", "r");
    yyin = fp;
    yylex();
    return 1;
}

int yywrap(){
    return 1;
}

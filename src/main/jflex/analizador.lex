//user code
package com.mycompany.ejemplojflex;

//Opciones y definiciones regulares
%%

//Opciones y definiciones regulares

%public
%class Scanner
%char
%line
%column
%standalone

//Definición regular
palabra = [a-zA-Z]+

identificador = {palabra}({palabra}|[0-9])*
digito = [0-9]+
espacios_blanco = [\r|\n|\r\n| |\t]

palabra_reservada = "abstract"|"assert"|"boolean"|"break"|"byte"|"case"|"catch"|"char"|"class"|"const"
                    |"continue"|"default"|"do"|"double"|"else"|"enum"|"extends"|"false"|"final"|"finally"|"float"
                    |"for"|"goto"|"if"|"implements"|"import"|"instanceof"|"int"|"interface"|"long"|"native"|"new"|"null"
                    |"package"|"private"|"protected"|"public"|"return"|"short"|"static"|"strictfp"|"super"|"switch"|"synchronized"
                    |"this"|"throw"|"throws"|"transient"|"true"|"try"|"void"|"volatile"|"while"

signos_java = "{" | "}" | "(" | ")" | "[" | "]" | ";" | "," | "." | "..." | "@" | "=" | ">" | "<" | "!" |
                "~" | "?" | ":" | "->" | "==" | ">=" | "<=" | "!=" | "&&" | "||" | "++" | "--" | "+" | "-" |
                "*" | "/" | "&" | "|" | "^" | "%" | "<<" | ">>" | ">>>" | "+=" | "-=" | "*=" | "/=" | "&=" | 
                "|=" | "^=" | "%=" | "<<=" | ">>=" | ">>>="

identificador = [a-zA-Z][a-zA-Z0-9_]* // agregar _ al final

identificador_con_numeros = [a-zA-Z][a-zA-Z0-9_]*[0-9]+ 

tipo_primitivo = boolean|int|byte|short|long|float|double|char

//Tipos de datos primitivos
booleano = "true"|"false"
entero = {digito}+
flotante = {digito}+"."{digito}*
caracter = "'"{palabra}"'"
cadena = """{palabra}+"""
%%

//Reglas lexicas

{tipo_primitivo} {espacios_blanco}* {identificador} {espacios_blanco}* "=" {espacios_blanco}* ( {booleano} | {entero} | {flotante} | {caracter} | {cadena}) {espacios_blanco}* ";"
{System.out.println("Declaración de variable: " + yytext()); }

( {booleano} | {entero} | {flotante} | {caracter} | {cadena}) {espacios_blanco}* {identificador} {espacios_blanco}* \[ {espacios_blanco}* {espacios_blanco}* \] {espacios_blanco}* "=" "new" {espacios_blanco}* ( {booleano} | {entero} | {flotante} | {caracter} | {cadena}) \[ {espacios_blanco}* {digito} {espacios_blanco}* \] {espacios_blanco}*  ";"
{System.out.println("Declaración de arreglo: " + yytext()); }

{palabra_reservada}     {System.out.println("Reservada: " + yytext()); }

{signos_java} {System.out.println("Lexema: " + yytext()); }

{palabra}     {System.out.println("Lexema: " + yytext()); }

{identificador}  {System.out.println("Lexema: " + yytext()); }

{identificador_con_numeros}  {System.out.println("Lexema: " + yytext()); } 

{tipo_primitivo} {System.out.println("Lexema: " + yytext()); }

"String" {System.out.println("Lexema: " + yytext()); }

"System" {System.out.println("Lexema: " + yytext()); }

"out" {System.out.println("Lexema: " + yytext()); }

"println" {System.out.println("Lexema: " + yytext()); }

{identificador}  {System.out.println("Lexema: " + yytext()); }

{digito} {System.out.println("Lexema: " + yytext()); }

{espacios_blanco}   { /*Ignorar estos símbolos*/ }

\"[^\"]*\"  {System.out.println("Lexema: " + yytext()); }

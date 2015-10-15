
grammar TableMan;

@header {
 package net.barrettsprivateers.tableman.parser;
}

tableFile: tableDefinition (CRLF tableDefinition)* ;

tableDefinition: 'Table: ' StringLiteral CRLF ;

// An identifier
IDENTIFIER: [A-Za-z][A-Za-z0-9_]* ;
CRLF: [\r]?[\n] ;
WHITESPACE: [ \t\b\r\n] -> skip;

// Numbers
N_NUM: [1-9][0-9]* ;
W_NUM: '0'|N_NUM ;
NUM: [+-]?W_NUM ;


// Character strings
StringLiteral
  : SINGLE_QUOTE STRING_CHARACTERS? SINGLE_QUOTE
  | DOUBLE_QUOTE STRING_CHARACTERS? DOUBLE_QUOTE ;

STRING_CHARACTERS
  : (ESCAPE_CHARACTER|STRING_CHARACTER)+ ;

fragment STRING_CHARACTER
  : ~['"\r\n\\] ;

fragment ESCAPE_CHARACTER
  : '\\' [btrfn'"\\] ;

fragment SINGLE_QUOTE
  : '\'' ;

fragment DOUBLE_QUOTE
  : '\"' ;
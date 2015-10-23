grammar TableMan;

@header {
 package net.barrettsprivateers.tableman.parser;
}


tableFile:
        fileHeaders? (tableDefinition)+
    | (tableDefinition)+;

//###################### File Header rules ################################
fileHeaders:
        (fileModuleHeader CRLF)?
        (freeTextHeader)* ;

fileModuleHeader:
        ('Module'|'MODULE'|'module')':' MODULE_NAME;

freeTextHeader: FREE_TEXT_HEADER;

FREE_TEXT_HEADER:
        FREE_TEXT_HEADER_TITLE FREE_TEXT;

fragment FREE_TEXT_HEADER_TITLE:
        ('Author'|'AUTHOR'|'author')':'
    | ('Source'|'SOURCE'|'source')':'
    | ('License'|'LICENSE'|'license')':';

fragment FREE_TEXT:
        ~[\r\n]+ CRLF FREE_TEXT
    | ~[\r\n]+ CRLF CRLF;    

//###################### Table rules ################################
tableDefinition:
        tableHeaders CRLF (tableLine CRLF)+;

tableHeaders:
        tableNameHeader
        (CRLF tableTypeHeader)?
        (CRLF tableVisibilityHeader)?;

tableNameHeader:
        ('Table'|'TABLE'|'table')':' IDENTIFIER;

tableTypeHeader:
        ('Type'|'TYPE'|'type')':' IDENTIFIER;

tableVisibilityHeader:
        ('Visibility'|'VISIBILITY'|'visibility')':' VISIBILITY_TYPE;

VISIBILITY_TYPE:
        ('User'|'USER'|'user')
    | ('Library'|'LIBRARY'|'library')
    | ('Module'|'MODULE'|'module');

tableLine:
        EXPRESSION;

//###################### Expressions ################################
EXPRESSION: IDENTIFIER;
// An identifier
IDENTIFIER: IDENTIFIER_CHARACTERS;

MODULE_NAME: IDENTIFIER_CHARACTERS('.' IDENTIFIER_CHARACTERS)+;

fragment IDENTIFIER_CHARACTERS: [A-Za-z_][A-Za-z0-9_]* ;

CRLF: [\r]?[\n] ;
WHITESPACE: [ \t\r\n]+ -> skip;

// Numbers
N_NUM: [1-9][0-9]* ;
W_NUM: '0'|N_NUM ;
NUM: '-'?W_NUM ;


// Character strings
StringLiteral
  : SINGLE_QUOTE STRING_CHARACTERS? SINGLE_QUOTE
  | DOUBLE_QUOTE STRING_CHARACTERS? DOUBLE_QUOTE ;

fragment STRING_CHARACTERS: (ESCAPE_CHARACTER|STRING_CHARACTER)+ ;

fragment STRING_CHARACTER: ~[\'\"\r\n\\] ;

fragment ESCAPE_CHARACTER: '\\' [btrfn\'\"\\] ;

fragment SINGLE_QUOTE: '\'' ;

fragment DOUBLE_QUOTE: '\"' ;

// Comments
COMMENT: '/*' .*? '*/' -> skip ;

LINE_COMMENT: ('//'|'#') ~[\r\n]* -> skip ;


Student: Sean Dela Pena 
Professor: Mark Hauschild
Assignment: Project 3 - CS 4280
	Semantics
Date: 11/28/21

OPTION 2 (LOCAL OPTION) (max 100):
	Variables defined before the program keyword are considered in the global scope, those inside of any block are considered scoped in that block.

USAGE: make		(makefile to compile, creates a parser executable)
	./statSem [somefile]
	make clean	

Invocation:
	./statSem somefile.txt [enter]


Any other invocations will result in an error.

Notes:
	The token structure is as shown
	[token, "string", line num:charNum]
	["IDTk, "example", line 1:1]

	The Parser error structure is as shown
	Parser Error: There is an error!
	Parser Error: ERROR in tk [tokenthatwaschecked] expected [expectedToken] in line [lineNum]

	The Semantics error structure is as shown
	Semantic Error: This variable "var" has ALREADY been declared.
	or
	Semantic Error: This variable "var" has NOT been declared.

Important:
	The way the program works is that the main driver (main.cpp) calls the scanner, the parser, 
	and then the semantic.
	The semantic recieves the tree made by the parser and traverses it in a preorder manner. First,
	it checks if the tree is empty, if not check the left side of the tree with the global variables.
	If it finds declared IDs it is then put into a vector of "variables". Variable struct in this context 
	contains the token string ("x") and the scope (gloabl or local) of the id. So once we encounter an id on the left side
	of the tree we push the string and the int enum GLOBALSCOPE. After checking the left side of the tree
	we check the right side of the tree. Here we traverse the <block> node, set a varCount of 0 and 
	traverse the tree. Everytime a new variable is pushed to our vector we increment the varCount and 
	pop them after we are done with the scope of that block. We push the string of that ID and the int enum LOCALSCOPE 
	into our vector. If a nested block is encountered, the varCount will still get
	incremented but the variables will be popped when we are done with that nested block. Leaving us only
	with the parent block variables which we can still use until the end of that parent block.

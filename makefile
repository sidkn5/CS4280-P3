CC=gcc
CFLAGS= -I -g -lstdc++ -std=c++11

statSem: main.cpp scanner.cpp scanner.hpp character.hpp token.hpp parser.cpp parser.hpp node.hpp tree.hpp tree.cpp semantic.hpp semantic.cpp
	$(CC) -o $@ $^ $(CFLAGS)

clean:
	rm -f *.o statSem
	rm -f *.gch

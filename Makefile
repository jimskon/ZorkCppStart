# MakeFile to build the Zork Start program

CC= g++

#For Optimization
#CFLAGS= -O2
#For debugging
CFLAGS= -std=c++14

RM= /bin/rm -f

all: consoleGame

border.o: border.cpp border.h
	$(CC) $(CFLAGS) border.cpp -c

room.o: room.cpp room.h
	$(CC) $(CFLAGS) room.cpp -c

world.o: world.cpp world.h
	$(CC) $(CFLAGS) world.cpp -c

xmlParser.o: xmlParser.cpp xmlParser.h
	$(CC) $(CFLAGS) xmlParser.cpp -c

game.o: game.cpp xmlParser.h world.h room.h border.h
	$(CC) $(CFLAGS) game.cpp -c

consoleGame: consoleGame.o game.o border.o room.o world.o xmlParser.o
	$(CC) $(CFLAGS) consoleGame.o game.o  border.o room.o world.o xmlParser.o -o consoleGame

clean:
	rm -f *.o  consoleGame

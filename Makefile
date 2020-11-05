# MakeFile to build the Zork Start program

CC= g++
user=skon

#For Optimization
#CFLAGS= -O2
#For debugging
CFLAGS= -std=c++14 -Wall

RM= /bin/rm -f

all: consoleGame gameserver gamewebclient testclient PutHTML PutCGI

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

gameserver.o:	gameserver.cpp fifo.h game.h
	$(CC) $(CFLAGS) gameserver.cpp -c

gamewebclient.o: gamewebclient.cpp fifo.h
	$(CC) -c $(CFLAGS) gamewebclient.cpp

fifo.o:	fifo.cpp fifo.h
	$(CC) $(CFLAGS) fifo.cpp -c

gamewebclient: gamewebclient.o  fifo.h
	$(CC) gamewebclient.o  fifo.o -o gamewebclient -L/usr/local/lib -lcgicc

testclient: testclient.o fifo.o
	$(CC) testclient.o fifo.o -o testclient

consoleGame: consoleGame.o game.o border.o room.o world.o xmlParser.o
	$(CC) consoleGame.o game.o border.o room.o world.o xmlParser.o -o consoleGame

gameserver: gameserver.o game.o border.o room.o world.o xmlParser.o fifo.o
	$(CC) gameserver.o game.o border.o room.o world.o xmlParser.o fifo.o -o gameserver

PutCGI:
		chmod 757 gamewebclient
		cp gamewebclient /usr/lib/cgi-bin/$(user)_gamewebclient.cgi

		echo "Current contents of your cgi-bin directory: "
		ls -l /usr/lib/cgi-bin/

PutHTML:
	cp zork.html /var/www/html/class/softdev/$(user)/CppGame/
	cp zork.css /var/www/html/class/softdev/$(user)/CppGame/
	cp zork.js /var/www/html/class/softdev/$(user)/CppGame/
	cp favicon.ico /var/www/html/class/softdev/$(user)/CppGame/
	echo "Current contents of your HTML directory: "
	ls -l /var/www/html/class/softdev/$(user)/CppGame/


clean:
	rm -f *.o  consoleGame gameserver gamewebclient testclient

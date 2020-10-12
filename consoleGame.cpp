#include <iostream>
#include <sstream>
#include "game.h"

using namespace std;

string gamefile = "game.xml";
string gameId="jimskon";  //This will need to be generated unique for each game



int main() {
  string command;
  Game theGame(gamefile,gameId);
  cout << theGame.start(gameId);

  while (1) {
    cout << ">>> ";
    getline(cin,command);
    cout << theGame.processCommand(gameId,command);
  }


}

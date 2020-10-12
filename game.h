#ifndef Game_H
#define Game_H

#include <string>
#include "world.h"

using namespace std;
class Game
{
  public:
  string gameId;
  World world;

  Game(string fileName, string id);
  string start(string id);
  string processCommand(string c, string id);

  private:

};
#endif

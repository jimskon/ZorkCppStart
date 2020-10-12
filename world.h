#ifndef World_H
#define World_H
#define XML_USE_STL
#include "xmlParser.h"
#include <string>
#include <vector>
#include <map>
#include "room.h"

using namespace std;
class World
{
  public:
  string location;
  map<string,Room> rooms;
  //map<string,Item> items;

  World();
  World(XMLNode aNode);

  private:

};
#endif

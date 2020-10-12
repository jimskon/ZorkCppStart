#include <iostream>
#include "world.h"

World::World(XMLNode aNode) {

  int i=0;
  XMLNode n=aNode.getChildNode(i++);
  location="";
  do {
    string tag=n.getName();
    //cout << "World:" << tag << endl;
    if (tag == "room") {
      Room r = Room(n);
      rooms[r.name]=r;
      if (location=="") // Location will be first room
        location=r.name;
    }

    n=aNode.getChildNode(i++);
  } while (!n.isEmpty());

}

World::World() {};

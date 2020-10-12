#include <iostream>
#define XML_USE_STL
#include "xmlParser.h"
#include <map>
#include <vector>
#include<iostream>  
#include <bits/stdc++.h> 
#include "room.h"
#include "world.h"


using namespace std;

string bookFile = "game.xml";

vector<string> parseStr(string s) {
  vector<string> words; 

  stringstream ss(s); 

  while (ss.good()) { 
      string substr; 
      getline(ss, substr, ' '); 
      words.push_back(substr); 
  } 
  return words;
}

void processCommand(World & w) {
  vector<string> words;
  string command;

  cout << ">>> ";
  getline(cin,command);

  words = parseStr(command);

  if (words[0] == "go") {
    if (words.size() > 1) {
      string nextRoom=w.rooms[w.location].checkBorder(words[1]);
      if (nextRoom!="")
        w.location=nextRoom;
    } else {
      cout << "Go where?" << endl;
    }
  } else if (words[0] == "i" || words[0] == "inventory") {
    cout << "Inventory not implemented" << endl;
  }
}


int main() {

  XMLNode aNode=XMLNode::openFileHelper(bookFile.c_str(),"map");

  World world=World(aNode);

  while (1) {
    //cout << "loc:" << world.location << endl;
    world.rooms[world.location].describe();
    processCommand(world);
  }


}
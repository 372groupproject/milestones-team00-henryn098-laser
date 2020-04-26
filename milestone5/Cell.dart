//the object which represents some cell at x,y in
//some matrix for the game of life
import 'dart:io';
class Cell{
  bool alive;
  int x;
  int y;

  Cell(int x_coord, int y_coord){
    x = x_coord;
    y = y_coord;
    alive = false;
  }

  get isAlive{
    return alive;
  }
  get row{
    return y;
  }
  get col{
    return x;
  }

  String toString(){
    if (alive){
      return "X";
    }
    return "0";
  }
}
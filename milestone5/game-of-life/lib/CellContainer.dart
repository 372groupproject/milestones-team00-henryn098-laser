/*this is a container class to hold cells,
it makes up the board on which the cells will
live and die*/

import 'package:flutter/cupertino.dart';

import 'cell.dart';

class CellContainer {
  List<List<Cell>> board;
  int rows;
  int maxRowIdx;
  int cols;
  int maxColIdx;

  /*constructor, populates all cells as dead*/
  CellContainer(int numCols, int numRows){
    //set fields
    rows = numRows;
    cols = numCols;
    maxRowIdx = rows -1;
    maxColIdx = cols -1;
    board = new List<List<Cell>>(rows);
    //populate cells
    for(int r = 0; r<= maxRowIdx; r++){
      board[r] = new List<Cell>(cols);
      for (int c = 0; c <= maxColIdx; c++){
        board[r][c] = new Cell(c,r);
      }
    }
  }

  Cell cellAt(int col, int row){
    return board[row][col];
  }

  /*checks a cell to determine whether it is
  dead or alive
  takes the cooridinates, x col, y row
  returns a boolean*/
  bool checkCell(int col, int row){
    if (col > maxColIdx || row > maxRowIdx
      ||col < 0 || row < 0){
        return false;
    }
    return cellAt(col, row).isAlive;
  }

  /*checks up, down, left right, and diagonal
  neigbors of a cell. Returns a count of
  the number of neigbors a cell has*/
  int countNeighbors(Cell cell){
    int count = 0;
    for(int r = cell.row-1; r <= cell.row+1; r++){
      for(int c = cell.col-1; c <= cell.col+1; c++){
        if(checkCell(c,r)){
          count+=1;
        }
      }   
    }
    if (cell.isAlive){
      count -= 1;//dont count self
      }
    return count;
  }


  String toString(){
    String str = "";
    for(int r = 0; r <= maxRowIdx; r++){
      str += "\n";
      for(int c = 0; c <= maxColIdx; c++){
        str += cellAt(c,r).toString() + " ";
      }
    }
    return str;
  }
}


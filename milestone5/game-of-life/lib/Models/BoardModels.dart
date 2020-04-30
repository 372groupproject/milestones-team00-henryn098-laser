import 'package:gameoflife/Models/CellContainer.dart';
import 'dart:math';

CellContainer configBoardTestRepeatingLine(int cols, int rows){
  CellContainer board = new CellContainer(cols,rows);
  board.cellAt(5,5).alive = true;
  board.cellAt(4,5).alive = true;
  board.cellAt(6,5).alive = true;
  return board;
}

CellContainer configBoardTest2cell(){
  CellContainer board = new CellContainer(3,4);
    board.cellAt(1,1).alive = true;
    board.cellAt(1,2).alive = true;
  return board;
}

CellContainer configBoardTestGlider(int cols, int rows){
  CellContainer board = new CellContainer(cols, rows);
    board.cellAt(1,0).alive = true;
    board.cellAt(2,1).alive = true;
    board.cellAt(3,0).alive = true;
    board.cellAt(3,1).alive = true;
    board.cellAt(3,2).alive = true;
  return board;
}

CellContainer randomBoard(int cols, int rows) {
  List<CellContainer> boards = [configBoardTestRepeatingLine(cols, rows), configBoardTestGlider(cols, rows)];
  
  return boards[Random().nextInt(2)];
}
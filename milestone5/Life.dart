import 'cell.dart';
import 'cellContainer.dart';
int ROWS=10;
int COLS=10;
CellContainer board;

main(){
  //setup board
  //CellContainer board= new CellContainer(COLS,ROWS);
  board = configBoardTestGlider();
  //run game
  runGame(board);

}

runGame(CellContainer board){
  int i  = 0;
  print(board.toString());
  while(i < 3){
    board = tick(board);
    i++;
    print(board.toString());
  }
}

//the method which drives the game
tick(CellContainer board){
  Cell currCell;
  Cell newCell;
  CellContainer newBoard = new CellContainer(board.cols, board.rows);
  for (int r = 0; r < board.maxRowIdx; r++){
    for (int c = 0; c < board.maxColIdx; c++){
      currCell = board.cellAt(c,r);
      newCell  = newBoard.cellAt(c,r);
      newCell.alive = 
         cellState(currCell, board.countNeighbors(currCell));
    }
  }
  return newBoard;
}

/*returns a cell state based on the number of neighbors,
and whether or not the cell is currently alive*/
bool cellState(Cell cell, int neighbors){
  //underpopulation
  if (neighbors < 2){
    return false;
  }
  if (neighbors == 2){
    return cell.isAlive;
  }
  if (neighbors == 3){
    return true;
  }
  if (neighbors > 3){
    return false;
  }
  return false; //catchall, should never logically hit
}

CellContainer configBoardTestRepeatingLine(){
  CellContainer board = new CellContainer(COLS,ROWS);
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

CellContainer configBoardTestGlider(){
  CellContainer board = new CellContainer(COLS, ROWS);
    board.cellAt(1,0).alive = true;
    board.cellAt(2,1).alive = true;
    board.cellAt(3,0).alive = true;
    board.cellAt(3,1).alive = true;
    board.cellAt(3,2).alive = true;
  return board;
}
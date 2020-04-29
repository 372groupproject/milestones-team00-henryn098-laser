import 'cell.dart';
import 'cellContainer.dart';

int ROWS=4;
int COLS=4;

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

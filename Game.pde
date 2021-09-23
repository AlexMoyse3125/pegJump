class Game {

  int[]board;

  public Game() {
    this.board = new int[15]; // 0 for filled, 1 for unfilled
  }
  public Game(Game g) {
    board = new int[15];
    for (int i = 0; i<15; i++) {
      board[i] = g.board[i];
    }
  }

  boolean play(int start, int finish) { 
    int skipped = isLegal(start, finish);
    if (skipped == -1) return false;
    else {
      board[skipped] = 1;
      board[finish] = 0;
      board[start] = 1;
      return true;
    }
  }

  boolean compPlay(int[] move) {
    return play(move[0], move[1]);
  }

  int isOver() { // 0 for loss, 1 for win, -1 for ongoing
    int counter = 0;
    for (int i = 0; i<15; i++) {
      if (board[i] == 0) counter++;
    }
    if (counter == 1) return 1;
    if (getLegalMoves().size() == 0) return 0;
    else return -1;
  }

  ArrayList<int[]> getLegalMoves(){
    ArrayList<int[]> moves = new ArrayList<int[]>();
    for (int i = 0; i < 15; i++){
      for (int j = 0; j < 15; j++){
        if (isLegal(i, j) != -1){
          int[] move = new int[2];
          move[0] = i;
          move[1] = j;
          moves.add(move);
        }   
      }
    }
    return moves;
  }
  
  int isLegal(int start, int finish) {
    if (start == 0 && finish == 3 && board[start] == 0 && board[finish] == 1 && board[1] == 0) return 1;   
    if (start == 0 && finish == 5 && board[start] == 0 && board[finish] == 1 && board[2] == 0) return 2;  
    if (start == 1 && finish == 6 && board[start] == 0 && board[finish] == 1 && board[3] == 0) return 3;
    if (start == 1 && finish == 8 && board[start] == 0 && board[finish] == 1 && board[4] == 0) return 4;
    if (start == 2 && finish == 7 && board[start] == 0 && board[finish] == 1 && board[4] == 0) return 4;
    if (start == 2 && finish == 9 && board[start] == 0 && board[finish] == 1 && board[5] == 0) return 5;
    if (start == 3 && finish == 0 && board[start] == 0 && board[finish] == 1 && board[1] == 0) return 1;
    if (start == 3 && finish == 5 && board[start] == 0 && board[finish] == 1 && board[4] == 0) return 4;
    if (start == 3 && finish == 10 && board[start] == 0 && board[finish] == 1 && board[6] == 0) return 6;
    if (start == 3 && finish == 12 && board[start] == 0 && board[finish] == 1 && board[7] == 0) return 7;
    if (start == 4 && finish == 11 && board[start] == 0 && board[finish] == 1 && board[7] == 0) return 7;
    if (start == 4 && finish == 13 && board[start] == 0 && board[finish] == 1 && board[8] == 0) return 8;
    if (start == 5 && finish == 0 && board[start] == 0 && board[finish] == 1 && board[2] == 0) return 2;
    if (start == 5 && finish == 14 && board[start] == 0 && board[finish] == 1 && board[9] == 0) return 9;
    if (start == 5 && finish == 12 && board[start] == 0 && board[finish] == 1 && board[8] == 0) return 8;
    if (start == 5 && finish == 3 && board[start] == 0 && board[finish] == 1 && board[4] == 0) return 4;
    if (start == 6 && finish == 8 && board[start] == 0 && board[finish] == 1 && board[7] == 0) return 7;
    if (start == 6 && finish == 1 && board[start] == 0 && board[finish] == 1 && board[3] == 0) return 3;
    if (start == 7 && finish == 9 && board[start] == 0 && board[finish] == 1 && board[8] == 0) return 8;
    if (start == 7 && finish == 2 && board[start] == 0 && board[finish] == 1 && board[4] == 0) return 4;
    if (start == 8 && finish == 6 && board[start] == 0 && board[finish] == 1 && board[7] == 0) return 7;
    if (start == 8 && finish == 1 && board[start] == 0 && board[finish] == 1 && board[4] == 0) return 4;
    if (start == 9 && finish == 7 && board[start] == 0 && board[finish] == 1 && board[8] == 0) return 8;
    if (start == 9 && finish == 2 && board[start] == 0 && board[finish] == 1 && board[5] == 0) return 5;
    if (start == 10 && finish == 3 && board[start] == 0 && board[finish] == 1 && board[6] == 0) return 6;
    if (start == 10 && finish == 12 && board[start] == 0 && board[finish] == 1 && board[11] == 0) return 11;
    if (start == 11 && finish == 13 && board[start] == 0 && board[finish] == 1 && board[12] == 0) return 12;
    if (start == 11 && finish == 4 && board[start] == 0 && board[finish] == 1 && board[7] == 0) return 7;
    if (start == 12 && finish == 10 && board[start] == 0 && board[finish] == 1 && board[11] == 0) return 11;
    if (start == 12 && finish == 14 && board[start] == 0 && board[finish] == 1 && board[13] == 0) return 13;
    if (start == 12 && finish == 3 && board[start] == 0 && board[finish] == 1 && board[7] == 0) return 7;
    if (start == 12 && finish == 5 && board[start] == 0 && board[finish] == 1 && board[8] == 0) return 8;
    if (start == 13 && finish == 11 && board[start] == 0 && board[finish] == 1 && board[12] == 0) return 12;
    if (start == 13 && finish == 4 && board[start] == 0 && board[finish] == 1 && board[8] == 0) return 8;
    if (start == 14 && finish == 12 && board[start] == 0 && board[finish] == 1 && board[13] == 0) return 13;
    if (start == 14 && finish == 5 && board[start] == 0 && board[finish] == 1 && board[9] == 0) return 9;
    return -1;
  }
}

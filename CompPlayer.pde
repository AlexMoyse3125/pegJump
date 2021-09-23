class CompPlayer {

  public CompPlayer() {
  }

  ArrayList<int[]> getMove(Game g) {
    ArrayList<int[]> moves = g.getLegalMoves();
    ArrayList<int[]> winners = new ArrayList<int[]>();
    for (int[] move : moves) {
      Game g2 = new Game(g);
      g2.compPlay(move);
      int eval = evalBoard(g2);
      if (eval == 1) winners.add(move);
    }    
    return winners;
  }
  
  int evalBoard(Game g) {
    int over = g.isOver();
    if (over == 1) return 1;  
    if (over == 0) return 0;
    ArrayList<int[]> moves = g.getLegalMoves();
    for (int[] move : moves) {
      Game g2 = new Game(g);
      g2.compPlay(move);
      int val = evalBoard(g2);
      if (val != 0) {
        return 1;
      }
    }
    return 0;
  }
}

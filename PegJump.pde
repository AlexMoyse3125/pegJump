Game g;
PVector[] circles;
boolean a;
int stored;
int counter;
CompPlayer cpu;

void setup() {
  if ("Hello".substring(1, 3) == "el") print ("what");
  size(800, 650);
  g = new Game();
  g.board[0] = 1;
  a = false;
  stored = -1;
  counter = 14;
  fill(0);
  rect(45, 15, 50, 50);
  fill(255);
  textSize(32);
  text(counter, 50, 50);
  cpu = new CompPlayer();

  circles = new PVector[15];
  circles[0] = new PVector(400, 125);
  circles[1] = new PVector(350, 200);
  circles[2] = new PVector(450, 200);
  circles[3] = new PVector(300, 275);
  circles[4] = new PVector(400, 275);
  circles[5] = new PVector(500, 275);
  circles[6] = new PVector(250, 350);
  circles[7] = new PVector(350, 350);
  circles[8] = new PVector(450, 350);
  circles[9] = new PVector(550, 350);
  circles[10] = new PVector(200, 425);
  circles[11] = new PVector(300, 425);
  circles[12] = new PVector(400, 425);
  circles[13] = new PVector(500, 425);
  circles[14] = new PVector(600, 425);
}

void draw() {  
  fill(210, 180, 140);
  triangle(400, 50, 100, 475, 700, 475);
  for (PVector p : circles) {
    fill(255);
    circle(p.x, p.y, 40);
  }
  fill(255, 0, 0);
  for (int i = 0; i<15; i++) {
    if (g.board[i] == 0) {
      circle(circles[i].x, circles[i].y, 20);
    }
  }
}

void mousePressed() {
  int x = mouseX;
  int y = mouseY;
  int range = 20;
  for (int i = 0; i<15; i++) {
    if (circles[i].x - range < x && x < circles[i].x + range && circles[i].y - range < y && y < circles[i].y + range) {
      if (!a) {
        a = true;
        stored = i;
        break;
      }
     else { 
      a = false;
      g.play(stored, i);
      counter--;
      println(" moves: ");
      ArrayList<int[]> winners = cpu.getMove(g);
      for (int[] move : winners) {
        println((move[0]) + " to " + (move[1]));
      }
      fill(0);
      rect(45, 15, 50, 50);
      fill(255);
      textSize(32);
      text(counter, 50, 50);
      int over = g.isOver();
      if (over == -1) println("game is ongoing");
      if (over == 0) println("You have lost");
      if (over == 1) println("Winner");
      println();
      println();
      }
    }
  }
}

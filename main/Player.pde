class Player {
  int size = 20;
  int life;
  PVector pos;
  
  Player () {
    pos = new PVector(mouseX, mouseY);
    life = 3;
    playerhit = false;
  }
  
  void display() {
    fill(150);
    ellipse(pos.x, pos.y, size, size);
  }
  
  void update() {
    pos = new PVector(mouseX, mouseY);
  }
}

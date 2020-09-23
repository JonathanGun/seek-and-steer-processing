class Coin {
  PVector pos;
  int size;
  boolean taken;
  
  Coin () {
    pos = new PVector(random(width), random(height));
    size = 20;
    taken = false;
  }
  
  boolean touches(Player p) {
    float distance = PVector.dist(pos, p.pos);
    if (distance <= (size + p.size)) return true;
    return false;
  }
  
  void display() {
    fill(255, 215, 0);
    ellipse(pos.x, pos.y, size, size);
  }
}

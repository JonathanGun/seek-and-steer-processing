class Vehicle {
  PVector pos, vel, acc;
  int r;
  float maxforce, maxvel;
  boolean hit = false;
  
  Vehicle () {
    acc = new PVector(0,0);
    vel = PVector.random2D().mult(level);
    float rand = random(2*height+2*width);
    if (rand < width) pos = new PVector(rand, 0);
    else if(rand < width+height) pos = new PVector(width, rand-width);
    else if(rand < 2*width+height) pos = new PVector(rand-width-height, height);
    else pos = new PVector(0, rand-2*width-height);
    r = 10;
    maxvel = 10+level*2;
    maxforce = 0.3+0.05*level;
  }
  
  void update(){
    vel.add(acc);
    vel.limit(maxvel);
    pos.add(vel);
    acc.mult(0);
  }
  
  void display(){
    fill(100);
    float theta = vel.heading() + PI/2;
    pushMatrix();
    translate(pos.x, pos.y);
    rotate(theta);
    triangle(0, -r*2, -r, r*2, r, r*2);
    popMatrix();
  }
  
  void addForce(PVector force){
    acc.add(force);
  }
  
  void seek(Player p){
    PVector target = p.pos;
    PVector desired = PVector.sub(target, pos).limit(maxvel);
    
    if (desired.mag() < maxvel-1) hit = true;
    playerhit |= hit;
    if ((hit) && (desired.mag() > maxvel)){
      hit = false;
      p.life -= 1;
    }
    PVector steer = PVector.sub(desired, vel);
    steer.limit(maxforce);
    
    addForce(steer);
  }
   
  void run(Player p){
    seek(p);
    update();
    display();
  }
}

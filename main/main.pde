ArrayList<Vehicle> vs;
Player p;
int level;
boolean playerhit;
int score;
int newLifeInterval = 1000;
int newCoinInterval = 450;
Coin c;

void settings() {
  size(800, 600);
}

void setup() {
  noStroke();
  ellipseMode(CENTER);
  
  level = 1;
  score = 0;
  
  vs = new ArrayList<Vehicle>();
  vs.add(new Vehicle());
  p = new Player();
  
  c = new Coin();
  c.taken = true;
}

void draw() {
  if (p.life == 0){
    gameOver();
    
  } else {
    if (playerhit) background(255,0,0);
    else background(240);
    
    score += 1;
    if (score%100 == 0) {vs.add(new Vehicle()); level += 1;}
    if (score%newLifeInterval == 0) p.life += 1;
    if (score > 10 && score%newLifeInterval < 10) background(0,255,0);
    if (score%newCoinInterval == 0) c = new Coin();
    
    if (!c.taken) {
      if (c.touches(p)) {
        p.life += 1;
        c.taken = true;
      }
      c.display();
    }
    
    p.update();
    p.display();
    
    playerhit = false;
    for(Vehicle v: vs) v.run(p);
  }
  
  textSize(20);
  textAlign(LEFT);
  
  text("Life : ", 10, 30);
  text(p.life, 70, 30);
  
  text("Score : ", 15, height-20);
  text(score/50, 90, height-20);
}

void gameOver(){
  background(255,0,0);
  
  p.display();
  for(Vehicle v: vs) v.display();
  
  textSize(50);
  textAlign(CENTER);
  text("Game Over", width/2, height/2);
}

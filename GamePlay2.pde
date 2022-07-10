
Ball b = new Ball();
Obstacle[] walls = new Obstacle[3];

boolean playing=false;
boolean intro=true;
int score=0;

void setup(){
  size(500,800);
  for(int i = 0; i<walls.length; i++){
    walls[i]=new Obstacle(i);
  }
}

void draw(){
  PImage img;
  img = loadImage("bgrnd.jpg");
  background(img);
  if(playing){
    b.move();
    b.drag();
  }
  
  b.drawBall();
  b.checkCollisions();
  
  for(Obstacle wall: walls){
    wall.drawObstacle();
    wall.checkPosition();
  }
  //text and rectangle display
  if(playing){
    //displays score
    textSize(32);
    fill(255);
    text(score,30,50);
  }
  //if game is not being played, its either intro or game is over
  else{
    fill(0,0,75);
    stroke(200,200,0);
    strokeWeight(3);
    if(intro){
      rect(80,203,343,50);
      rect(152,275,200,50);
      textSize(32);
      fill(255);
      text("Welcome to Flappy Bird!",90,240);
      text("Click to Play",167,312);
    }
    else{
      rect(150,203,200,50);
      rect(150,300,200,50);
      textSize(28);
      fill(255);
      text("GAME OVER",180,240);
      text("Score: ",200,334);
      text(score,275,334);
    }
  }
}
void reset(){
   playing=true;
   score=0;
   b.posy=400;
   for(Obstacle wall: walls){
    wall.posx += 300;
    wall.cashed = false;
  }
}

void mousePressed(){
  b.jump();
  intro=false;
  if(!playing){
    reset();
  }
}

void keyPressed(){
  b.jump(); 
  intro=false;
  if(!playing){
    reset();
  }
}

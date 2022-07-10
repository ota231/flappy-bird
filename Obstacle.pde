class Obstacle{
  float posx, opening;
  //cashed to check if user scored
  boolean cashed = false;
  Obstacle(int i){
    //place obstacles so they are 200px from each other depending on array position
    posx = 100 + (i*200);
    opening = random(600);
  }
  void drawObstacle(){
    //make width 200
    stroke(0, 89, 0);
    fill(0, 89, 0);     
    strokeWeight(20);
    strokeCap(PROJECT);
    line(posx, 0, posx, opening);  
    line(posx, opening+200, posx, 800);
  }
  void checkPosition(){
    if(posx<0){
      //place at the end of the screen
      posx += (200*3);
      cashed=false;
    } 
    if(posx<200 && !cashed){
      //adds a point for each time wall passes position of ball w/o collision
      cashed=true;
      score++; 
    }
  }
}
  

class Ball{
  float posx, posy, ySpeed;
  Ball(){
    posx = 200;
    posy = 400;
  }
  
  void drawBall(){
    stroke(255, 50, 0);
    fill(255, 50, 0);     
    strokeWeight(2);
    ellipse(posx, posy, 30, 30);
  }
  
  void jump(){
    ySpeed=-10; 
  }
 
  void drag(){
    ySpeed+=0.4; 
  }
  
  void move(){
    //moves ball down by speed and moves obstacles
    posy+=ySpeed; 
    for(Obstacle wall: walls){
      wall.posx-= 3;
    }
  }
    
  void checkCollisions(){
    if(posy<0 || posy>800 ){
      playing=false;
    }
    for(Obstacle wall: walls){
    //compares x and y coordinates of ball to obstacle to see if there is a collision
      if( (posx<wall.posx+10 && posx>wall.posx-10) && (posy<wall.opening || posy>wall.opening+200) ){
        playing=false; 
      }
    }
  } 
}
    

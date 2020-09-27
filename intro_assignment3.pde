class Ball {
  float radiusX, radiusY, locX, locY;
  color ballColor;
  float velocity, acceleration;
  int score;
  float posX, posY;
  float netWidth = 250;
  
  Ball () {
    radiusX = 50;
    radiusY = 50;
    locX = random(10, width-10);
    locY = random(height);
    ballColor = color(random(255), random(255), random(255));
    posX = width/2;
    posY = height-10;
  }
  
  void makeBall() {
    fill(ballColor);
    stroke(1);
    ellipse(locX, locY, radiusX, radiusY);
  }
  
  void falling() {
    locY += 1;
    
    if (locY > height+radiusY/2) {
      locY = -radiusY*2;
    }
  }
  
   void makeNet() {
    fill(0);
    rectMode(CENTER);
    rect(posX, posY, netWidth, radiusX);
  }
  
  void checkNet() {
    if (locX + radiusX >= posX 
    && locX + radiusX <= posX + netWidth 
    && locY + radiusY == posY) {
      locX = -200;
      score++;
    }
  }  
}


Ball[] balls;



void setup(){
  size(1280, 720);
  
  balls = new Ball[10];
  for(int i = 0; i < balls.length; i++){
    balls[i] = new Ball();
  }
}

void draw(){
  background(255);
  for(int i = 0; i < balls.length; i++){
     balls[i].makeBall();
     balls[i].falling();
     balls[i].makeNet();
     balls[i].checkNet();
     print(balls[i].score);
  }
}

void keyPressed() {
   if (keyPressed) {
     
    for(int i = 0; i < balls.length; i++){
      if (key == 'a'){
        balls[i].posX -= 100;
      }
      
      if (key == 'd'){
        balls[i].posX += 100;
      }
     }
   }
}

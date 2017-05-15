class Ball {
  float x;
  float y;
  float rad;
  color c;
  float dx;
  float dy;
  int state; //0 is before change , 1 is increasing size , 2 is decreasing size

  Ball() { 
    float r = random(256);
    float g = random(256);
    float b = random(256);
    c = color(r, g, b);
    rad = 25;
    x = random((width - r) + r/2);
    y = random((height - r) + r/2);
    dx = random(10) - 5;
    dy = random(10) - 5;  
    state = 0;
  }

  Ball(float a, float b) {
    this();
    x = a;
    y = b;
    dx = 0;
    dy = 0;
  }

  void display() {
    fill(c);
    stroke(c);
    ellipse (x, y, rad + 10, rad + 10);
  }

  void move() {
    x = x + dx;
    y = y + dy;
    bounce();
  }

  void bounce() {
    if (x > width || x < 0) {
      dx *= -1;
    }
    if ( y > height || y < 0) {
      dy *= -1;
    }
  }

  void reaction() {
    if (state == 1) {
      rad += 2;
      
    }
    if (rad >= 250) {
        state = 2;
      }
    if (state == 2) {
      rad -= 2;
    }
  }

  void checkCollided(){
  for(int i = 0; i < balls.size(); i++){
      if(     (dist(balls.get(i).x,balls.get(i).y,x,y) <= balls.get(i).rad)){
        balls.get(i).state = 1;
        
      }
  
  }
}
} 
ArrayList<Ball> balls = new ArrayList<Ball>();  
boolean reactionStarted;


void setup() {
  size(800, 600); 
  for (int i= 0; i< 25; i++) balls.add(new Ball());
  reactionStarted = false;
}


void draw() {
  background(0);
  for ( int i=0; i < balls.size(); i++) {
    balls.get(i).display(); 
    

    if (reactionStarted) {

      if (balls.get(i).state == 1) {
        balls.get(i).checkCollided();
        balls.get(i).reaction();
        balls.get(i).dx = 0;
        balls.get(i).dy = 0;
      } 
    }    
    balls.get(i).move();
  }

}

void mouseClicked() {
  if (!reactionStarted){
  
    balls.add(new Ball(mouseX, mouseY));
    balls.get(balls.size()-1).state = 1;
    reactionStarted = true;
  }
}
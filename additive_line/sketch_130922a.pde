import java.awt.MouseInfo;
import java.awt.Point;

int px; //This is the my version of a pmouse variable
int py;
int saveCondition;

void setup() {
 size(displayWidth, displayHeight);
 background(0);
 strokeWeight(.05);
 stroke(250); 
 smooth();
}

void draw() {
  if(frameCount == 1) frame.setLocation(0, 0);
  
  Point mouse;
  mouse = MouseInfo.getPointerInfo().getLocation();
  println( "X=" + mouse.x + " Y=" + mouse.y );
  println(frameCount);
  line(mouse.x, mouse.y, px, py);
  // draw lines from where mouse is to where mouse was 'pmouse' means previous
  // (x, y, x2, y2)
  if (mousePressed) {
    fill(255);
    ellipse(mouseX, mouseY, 5, 5);
  } else {
    fill(0);
  }
  
  px = mouse.x; 
  py = mouse.y;
  saveCondition = frameCount % 6000;
  if (saveCondition == 0) {
  saveFrame("output-###.png");
  }
}


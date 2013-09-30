import java.awt.MouseInfo;
import java.awt.Point;

int px; //This is the my version of a pmouse variable
int py;
int saveCondition;

int x;
int y;

void setup() {
 size(displayWidth, displayHeight);
 background(0);
 stroke(250); 
 smooth();
}

void draw() {
  if(frameCount == 1) frame.setLocation(0, 0);
  
  Point mouse;
  mouse = MouseInfo.getPointerInfo().getLocation();
  println( "X=" + mouse.x + " Y=" + mouse.y );
  println(frameCount);
 
  float speed = abs(mouse.x-px) + abs(mouse.y-py);
  strokeWeight(speed/50);
  line(mouse.x, mouse.y, px, py);
  
  px = mouse.x; 
  py = mouse.y;
  saveCondition = frameCount % 6000;
  if (saveCondition == 0) {
  saveFrame("output-###.png");
  }
}

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
  variableEllipse(mouse.x, mouse.y, px, py);
  
  px = mouse.x; 
  py = mouse.y;
  saveCondition = frameCount % 6000;
  if (saveCondition == 0) {
  saveFrame("output-###.png");
  }
}

void variableEllipse(int x, int y, int px, int py) {
  float speed = abs(x-px) + abs(y-py);
  stroke(speed);
  ellipse(x, y, speed/4, speed/4);
}

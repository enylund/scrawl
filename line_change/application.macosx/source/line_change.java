import processing.core.*; 
import processing.data.*; 
import processing.event.*; 
import processing.opengl.*; 

import java.awt.MouseInfo; 
import java.awt.Point; 

import java.util.HashMap; 
import java.util.ArrayList; 
import java.io.File; 
import java.io.BufferedReader; 
import java.io.PrintWriter; 
import java.io.InputStream; 
import java.io.OutputStream; 
import java.io.IOException; 

public class line_change extends PApplet {




int px; //This is the my version of a pmouse variable
int py;
int saveCondition;

int x;
int y;

public void setup() {
 size(displayWidth, displayHeight);
 background(0);
 stroke(250); 
 smooth();
}

public void draw() {
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
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "line_change" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}

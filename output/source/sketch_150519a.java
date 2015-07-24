import processing.core.*; 
import processing.data.*; 
import processing.event.*; 
import processing.opengl.*; 

import java.util.HashMap; 
import java.util.ArrayList; 
import java.io.File; 
import java.io.BufferedReader; 
import java.io.PrintWriter; 
import java.io.InputStream; 
import java.io.OutputStream; 
import java.io.IOException; 

public class sketch_150519a extends PApplet {

float diameter; 
float x = 0;
float y = 0;

class Ghost {
  float x, y;
  float tx, ty;
  float acc;
  PImage img;
  float angs = 0;
  float angle = 0;

  Ghost() {
    x = random(width);    
    y = random(0, height/2);
    acc = random(1, 2);
    angs  = random(2, 4);
    img = loadImage("gorst1.png");
  }
  
  public void set_image(String file) {
        img = loadImage(file);
  }

  public void move() {
    image(img, x, y,  518, 387);

    x += acc;

    float rad = radians(angle);
    y = y + (sin(rad));
    
    angle += angs;

    if (x > (width + 300)) {
      x = -400;
    }

    if (y < 0) {
      y = random(height/2);
    }
  }
}

ArrayList<Ghost> glist = new ArrayList<Ghost>();
int max_ghost = 10;
// Count how many ghost is exist now.
int ghost_counter = 1;
public void setup() {

  size(displayWidth, displayHeight); 
  /**
  frame.removeNotify();
  frame.setUndecorated(true);
  frame.addNotify();
  frame.setSize(width, height);
  frame.setLocation(0, 0);
  frame.setAlwaysOnTop(true);
  **/
  frameRate(60);
  noStroke();
  noStroke();
  fill(255, 204, 0);

  for (int i = 0; i < max_ghost; i++) {
    File file = new File("/Users/shma/Dropbox/motifuwa/gorst"+ i +".png");
    if (file.exists()){
      Ghost g = new Ghost();
      g.set_image("/Users/shma/Dropbox/motifuwa/gorst" + i +".png");
      glist.add(g);
      ghost_counter++;
      println("file is exist");
    }else{
      println("file is unexist");
    }
    /**
    if (i % 2 == 0) {
      Ghost g1 = new Ghost1();
      g1.set_image("/Users/shma/work/ghost_system/gorst1.png");
      glist.add(g1);
    } else {
      glist.add(new Ghost2());
    }
    **/
  }  
}

public void draw() {
  background(0);
  
  File file = new File("/Users/shma/Dropbox/motifuwa/gorst" + ghost_counter + ".png");
  if (file.exists()){
      Ghost g = new Ghost();
      g.set_image("/Users/shma/Dropbox/motifuwa/gorst" + ghost_counter +".png");
      glist.add(g);
      ghost_counter++;
  }else{
    println("file is unexist");
  }
  
  for (int i = 0; i < ghost_counter - 1; i++) {    
    Ghost g = glist.get(i);
    g.move();
  }
}

  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "sketch_150519a" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}

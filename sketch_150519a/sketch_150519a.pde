// Ghost
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
    y = random(0, height/3);
    acc = random(0.5, 1);  
    angs  = random(2, 4);
    //img = loadImage("gorst1.png");
  }
  
  void set_image(String file) {
    img = loadImage(file);
  }

  void move() {
    image(img, x, y,  224, 298);

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
void setup() {
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
    File file = new File("/Users/shma/work/ghost_system/gorsts/gorst"+ i +".png");
    if (file.exists()){
      Ghost g = new Ghost();
      g.set_image("/Users/shma/work/ghost_system/ghosts/gorst" + i +".png");
      glist.add(g);
      ghost_counter++;
      
     // println("file is exist");
    }else{
      //println("file is unexist");
    }
  }
  PrintWriter output;      
  output = createWriter("test.txt");
  output.print(ghost_counter);
  output.flush();
  output.close(); 
}

int v = 0;
int display_num = 0;
void draw() {
  background(0);

  // Display Ghost
  File file = new File("/Users/shma/work/ghost_system/ghosts/gorst" + ghost_counter + ".png");
  if (file.exists()){
      Ghost g = new Ghost();
      g.set_image("/Users/shma/work/ghost_system/ghosts/gorst" + ghost_counter +".png");
      glist.add(g);
      ghost_counter++;
      println("set image");
      
      if ((ghost_counter - 1) > 10) {
        glist.remove(v);
        v++;
      }
      
      PrintWriter output;
      output = createWriter("test.txt");
      output.print(ghost_counter);
      output.flush();
      output.close();
  }else{
    //println("file is unexist");
  }
  
  println(ghost_counter);
  if (ghost_counter - 1 > 10) {
    glist.remove(ghost_counter - 1);    
  } else {
    display_num =  ghost_counter - 1;
  }

  for (int i=v; i < glist.size(); i++) {
    Ghost g = glist.get(i);
    g.move();
  }
}

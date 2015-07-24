// Capture
import gab.opencv.*;
PImage sakanakun;
OpenCV opencv;
PImage  img, thresh, blur, adaptive;
int[] colo;
int ghost_counter = 1;

void setup() {
  for (int i = 0; i < 10; i++) {
    File file = new File("/Users/shma/work/ghost_system/ghosts/gorst"+ i +".png");
    if (file.exists()){
  println(ghost_counter);
      ghost_counter++;
    }else{
      //println("file is unexist");
    }
  }
}

void draw() {
   // Image Capture
  File new_file = new File("/Users/shma/work/ghost_system/gazou.JPG");
  if (new_file.exists()){
    img = loadImage("/Users/shma/work/ghost_system/gazou.JPG");
    size(img.width,img.height);

    opencv = new OpenCV(this, img);  
 
    opencv.threshold(180);
    thresh = opencv.getSnapshot();
  
    sakanakun = createImage(width,height, ARGB);
    float r = random(3);
    int R = int(r);
    colo = new int [4];
    colo[0] = color(200,255,200,200);
    colo[1] = color(255,200,200,200);
    colo[2] = color(200,200,255,200);
    colo[3] = color(200,200,200,200);
  
    for (int y=0; y<thresh.height*thresh.width; y++) {
      if(thresh.pixels[y]>=-100){
        sakanakun.pixels[y] = colo[R];}
      else{
        sakanakun.pixels[y] = color(0,0,0,0);
      }
    }    
    sakanakun.save("/Users/shma/work/ghost_system/ghosts/gorst" + ghost_counter + ".png");
    ghost_counter++;
    new_file.delete();    
  } 
}

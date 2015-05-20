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

  void move() {}
}

class Ghost1 extends Ghost {
  Ghost1() {
    x = random(width);    
    y = random(0, height/2);
    acc = random(1, 2.5);
    angs  = random(2, 4);
    img = loadImage("gorst1.png");
  }

  void move() {
    image(img, x, y);

    x += acc;

    float rad = radians(angle);
    y = y + (sin(rad));
    
    angle += angs;

    if (x > (width + 1000)) {
      x = 0;
    }

    if (y < 0) {
      y = random(height/2);
    }
  }
}

class Ghost2 extends Ghost {
  Ghost2() {  
    x = random(width);    
    y = random(0, height/2);
    acc = random(1, 2.5);
    angs  = random(2, 4);
    img = loadImage("gorst2.png");
  }

  void move() {
    image(img, x, y);
    x -= acc;

    float rad = radians(angle);
    y = y + (sin(rad) * 1);
    angle += angs;

    if (x < -1000) {
      x = width;
    }

    if (y < 0) {
      y = random(height/2);
    }
  }
}


ArrayList<Ghost> glist = new ArrayList<Ghost>();
int total = 10;
int unvisible = 1000;

void setup() {
  frameRate(60);
  size(displayWidth, displayHeight);
  noStroke();
  noStroke();
  fill(255, 204, 0);

  for (int i = 0; i < total; i++) {
    if (i % 2 == 0) {
      glist.add(new Ghost1());
    } else {
      glist.add(new Ghost2());
    }

  }
}

void draw() {
  background(0);
  
  for (int i = 0; i < total; i++) {
    Ghost g = glist.get(i);
    g.move();
  }
}


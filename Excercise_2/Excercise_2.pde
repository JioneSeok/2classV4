class Siha {  
  Siha(float p, float q, float r, int c) {
    x = p;      y = q;     d = r;    cc = c;
  }
  Siha() {  
    x = random(0,width);
    y = random(0,height);
    d = 50;
  };
  float x, y, d;
  int cc;
  void Life() {
    if (cc == 0) fill(255, 255, 0); //yellow
    else if (cc == 1) fill(255); //white
    else if (cc == 2) fill(0, 255, 255); //cyan
    else if (cc == 3) fill(255, 0, 0); //red
    else fill(0, 0, 255); //blue
    
    ellipse(x, y, d, d/3*2);
    circle(x-d/5, y-d/6, d/5);
    arc(x+d/5, y-d/6, d/5, d/5, PI, 2*PI);
    arc(x, y, d*2/3, d/5, 0, PI);
  }
}

Siha a, b, c;
void setup() {
  size(600, 300);
  a = new Siha(100, 100, 100, 1);
  b = new Siha(500, 100, 150, 0);
  c = new Siha();
  a.Life();   b.Life();   c.Life();
}

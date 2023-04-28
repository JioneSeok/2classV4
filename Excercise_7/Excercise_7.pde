class Siha {
  Siha() {
    x = random(0,width);
    y = random(0,height);
    d = random(100,200);
    vx = random(-3,3); vy = random(-2,2);
  };
  Siha(float p, float q, float r) {
    x = p;     y = q;     d = r;
    vx = random(-3,3); vy = random(-2,2);
  }
  float x, y, d, vx, vy;
  void act(){
    x += vx;  y += vy;
    if(x<0 || x>width) vx *= -1;
    if(y<0 || y>height) vy *= -1;
  }
  void Life() {
    fill(255);
    ellipse(x, y, d, d/3*2);
    circle(x-d/5, y-d/6, d/5);
    arc(x+d/5, y-d/6, d/5, d/5, PI, 2*PI);
    arc(x, y, d*2/3, d/5, 0, PI);
  }
}

class punleu {
  // constructor
  punleu(float a, float b) {
    x = a;
    y = b;
    vx = random(-3,3);
    vy = random(-2,2);
  }
  // member data
  float x, y, vx, vy;
  // member function
  void update(){
   x += vx;
   y += vy;
   if(x<0 || x>width) vx *= -1;
   if(y<0 || y>height) vy *= -1;
  }
  void punleuShow() {
    fill(0, 0, 255);
    ellipse(x, y+30, 200, 210);
    fill(255);
    // eye
    ellipse(x-40, y, 50, 50);
    ellipse(x+30, y, 50, 50);
    // black eye
    fill(0);
    ellipse(x-40, y, 20, 20);
    ellipse(x+30, y, 20, 20);
    fill(0, 255, 0);
    //mouth
    arc(x, y+75, 80, 50, 0, 3.14);
    fill(0, 255, 0);
  }
}

class Choonsik {
  void choonsik() {
    x = random(0,width);
    y = random(0,height);
    d = random(150,250);
    vx = random(-3,3); vy = random(-2,2);
  }
    
  float x, y, d, vx, vy;
  
  void choonsikMove() {
    x += vx;
    y += vy;
    if(x<0 || x>width) vx *= -1;
    if(y<0 || y>height) vy *= -1;
  }
    
  void choonsikShow(){
    strokeWeight(8);
    circle(x,y,d*3/4); // face
    arc(x-d/4,y-d/800*204,d/80*6,d/80*6,PI,1.65*PI); // ears
    arc(x+d/4,y-d/800*204,d/80*6,d/80*6,1.35*PI,2*PI);
    fill(255,255,255); // nose color
    circle(x,y+d/800*15,d/8); // nose
    fill(200,90,37); // tongue color
    arc(x,y+d/800*65,d/800*25,d/20,0,PI); // tongue
    noFill();
    arc(x,y+d/800*120,d/800*30,d/40,0,PI);
    line(x-d/800*50,y+d/800*15,x-d/800*70,y);
    line(x-d/800*50,y+d/800*15,x-d/800*70,y+d/800*30);
    line(x+d/800*50,y+d/800*15,x+d/800*70,y);
    line(x+d/800*50,y+d/800*15,x+d/800*70,y+d/800*30);
    noStroke();
    fill(0,0,0); // eye color
    circle(x-d/800*60,y-d/800*60, d/800*30); // eyes
    circle(x+d/800*60,y-d/800*60, d/800*30);
    fill(255,70,80,100); // cheek color
    circle(x-d/800*86,y+d/800*15, d/80*7); // cheeks
    circle(x+d/800*86,y+d/800*15, d/80*7);
  }
}


Siha [] aa;
punleu [] pp;
Choonsik [] cc;
void setup() {
  size(800, 600);
  aa = new Siha[5];
  for (int i=0; i<5; i++) {
    aa[i] = new Siha();
  }
  pp = new punleu[3];
  for (int i=0; i<3; i++) {
    pp[i] = new punleu(random(width),random(height));
  }
  
  cc = new Choonsik[2];
  for (int i = 0; i < 2; i++) {
    cc[i] = new Choonsik();
  }
  
}
void draw(){
  background(0,255,255);
  for (int i=0; i<3; i++) {
    pp[i].update();
    pp[i].punleuShow();
  }  
  for (int i=0; i<5; i++) {
    aa[i].act();
    aa[i].Life();
  }  
  
  for (int i = 0; i < 2; i++) {
    cc[i].choonsikMove();
    cc[i].choonsikShow();
  }
  
}

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
  void collide(Siha b){
    float dd;
    dd = sqrt((x-b.x)*(x-b.x) + (y-b.y)*(y-b.y));
    if(dd < (d+b.d)/4){
      float tt = vx;
      vx = vy;
      vy = tt;
      
      float ttt = b.vx;
      b.vx = b.vy;
      b.vy = ttt;
    }
  }
  void act(){
    x += vx;  y += vy;
    if(x>width) x=0;
    if(x<0) x=width;
    if(y>height) y=0;
    if(y<0) y = height;
  }
  void Life() {
    ellipse(x, y, d, d/3*2);
    circle(x-d/5, y-d/6, d/5);
    arc(x+d/5, y-d/6, d/5, d/5, PI, 2*PI);
    arc(x, y, d*2/3, d/5, 0, PI);
  }
}

Siha [] aa;
void setup() {
  size(800, 600);
  aa = new Siha[5];
  for (int i=0; i<5; i++) {
    aa[i] = new Siha();
  }
}
void draw(){
  background(0,255,255);
  for (int i=0; i<5; i++) {
    if(i != 4){
      for(int j=i+1;j<5;j++){
        aa[i].collide(aa[j]);
      }
    }
    aa[i].act();
    aa[i].Life();
  }  
}

Cuore[] c= new Cuore[1];

void setup() {
  size(1000,1000);
  for (int i=0; i<c.length; i++) c[i]=new Cuore();
  
}

void draw() {
  background(0);
  for (int i=0; i<c.length; i++) {
    
    c[i].disegna();
    c[i].update();
  }
}



class Cuore {
  private
    float x;
  float y;
  float r; 
  color c;
  float sx;//velocità sull'asse delle X

  public 

    Cuore() {
    sx = random(1,4);
    x=random(width);
    r=random(10);
    c=color(random(255), random(255), random(255));
  }

  void disegna() {
    translate(width/2, height/2);
    scale(1.5);
    fill(255,0,0,128);
    stroke(0);
    beginShape();
    for (float i=0; i<TWO_PI; i+=0.01) {
      x= r*16*pow(sin(i), 3);
      y= -r*(13*cos(i)-5*cos(2*i)-2*cos(3*i)-cos(4*i));
      vertex(x, y);
    }
    endShape();
  }

  void update(){    
    //Questo fa si che il cuore pulsi tum tum tum tum :)
    r+=sx;
    if(r>=20) sx = sx*(-1);
    if(r<=2) sx = sx*(-1);
  }
}

//albero frattale semplice ricorsione del segmento

float angoloAppending ;
color c,c1;
float fattore_decrescita = 0.6;//misura next segmento

void setup() {
  size(1000, 1000);
 
 // c = color(random(255), random(255), random(255), random(255));
}

void draw() {
   background(0);
  translate(width/2, height);
  ricorsioneSemplice(400);
  mapAngle();
  println(angoloAppending);
}

void ricorsioneSemplice(float lunghezza_segmento ) {

  c = color(random(255), random(255), random(255), random(255));
  c1 = color(random(255), random(255), random(255), random(255));
  
  line(0, 0, 0, -lunghezza_segmento);
  translate(0, -lunghezza_segmento);
  if (lunghezza_segmento > 2) {
    pushMatrix();
    stroke(c);
    rotate(angoloAppending);
    ricorsioneSemplice(lunghezza_segmento*fattore_decrescita);
    popMatrix();
    /*
    Effetto molto carino, ma il render non ce la fa a sostenerlo senza rallentare eccessivamente:(
    pushMatrix();
    stroke(c);
    rotate(angoloAppending*2/3);
    ricorsioneSemplice(lunghezza_segmento*fattore_decrescita);
    popMatrix();
    */
    pushMatrix();
    rotate(-angoloAppending);
    stroke(c1);
    ricorsioneSemplice(lunghezza_segmento*fattore_decrescita);
    popMatrix();
  }
}

void mapAngle() {
  angoloAppending = map(mouseX, 0,width, 0, 2*PI);
}

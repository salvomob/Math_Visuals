//albero frattale -> ricorsione delle sfere (il render risulta piuttosto lento nello disegnare le sfere, ma l'effetto è comunque interessante)
import peasy.*;
float angoloAppending ;
color c = color(random(255), random(255), random(255), random(255));
color c1 = color(random(255), random(255), random(255), random(255));
float fattore_decrescita = 0.6;//misura next segmento

void setup() {
  size(1000, 1000,P3D);
 
 // c = color(random(255), random(255), random(255), random(255));
}

void draw() {
   background(0);
  translate(width/2, height);
  ricorsioneSemplice(300);
  mapAngle();
  println(angoloAppending);
}

void ricorsioneSemplice(float lunghezza_segmento ) {
  rectMode(CENTER);
 
  
  box(lunghezza_segmento);
  translate(0, -lunghezza_segmento);
  if (lunghezza_segmento > 2) {
    pushMatrix();
    fill(c);
    rotate(angoloAppending);
    ricorsioneSemplice(lunghezza_segmento*fattore_decrescita);
    popMatrix();
    
   // Effetto molto carino, ma il render non ce la fa a sostenerlo senza rallentare eccessivamente:(
    /*pushMatrix();
    stroke(c);
    rotate(angoloAppending*2/3);
    ricorsioneSemplice(lunghezza_segmento*fattore_decrescita);
    popMatrix();
    */
    pushMatrix();
    rotate(-angoloAppending);
    fill(c1);
    ricorsioneSemplice(lunghezza_segmento*fattore_decrescita);
    popMatrix();
  }
}

void mapAngle() {
  angoloAppending = map(mouseX, 0,width, 0, 2*PI);
}

//visualizzazione funzione lineare ossia x = y;

void setup(){
  size(800,800);
  background(0);
}

void draw(){
  strokeWeight(4);
 stroke(255,0,100);
  for(int i = 0; i< width; i++){
    point(i,height-i);
  }
}

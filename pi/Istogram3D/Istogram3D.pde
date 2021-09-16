import peasy.*;
PeasyCam cam;
int matrix[][] = new int[401][401];
color mix[] = new color[100];
int num = 0;
float lx = 0;
float ly = 0;
float angle = -.5;
void setup(){
  size(1200,600,P3D);
  translate(0,0,1000);
//camera(mouseX, height/2, (height/2) / tan(PI/6), width/2, height/2, 0, 0, 1, 0);
//cam = new PeasyCam(this,0, 0,0,1000);
//  cam.setMinimumDistance(50);
//  cam.setMaximumDistance(500);
  frameRate(1000);
  for(int i = 0; i <401; i++){
   matrix[i] = new int[401];
  for(int j =0; j < 401 ;  j++){
    matrix[i][j] = 0;
  }
  }
  for(int n = 0; n<100; n++){
    mix[n] = color(random(255),random(255),random(255));
  }
   background(0);
}

void draw(){
// noStroke();
 
 strokeWeight(0.1);
translate(0,height);
 // rotateZ(PI/4);
 // rotateY(3*PI/2);
  rotateX(PI/2);
//background(255);
   scale(5);
  float x= random(400);
  float y = random(400);
 //point(x,y);
   matrix[round(x)][round(y)]++;
  num++;
  pushMatrix();
  translate(round(x),-round(y),matrix[round(x)][round(y)]*2);
   if(matrix[round(x)][round(y)] <= 1){
     stroke(0,255,0);
      fill(0,255,0);
     box(1);
   }
   else{
  stroke(mix[matrix[round(x)][round(y)]]);
  fill(mix[matrix[round(x)][round(y)]]);
  box(1);
   }
  popMatrix();
  if(num%1000000==0) println(num);
  if(num == 64000000) exit();
}

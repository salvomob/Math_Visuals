import peasy.*;
PeasyCam cam;
int matrix[][] = new int[401][401];
int num = 0;
float lx = 0;
float ly = 0;
float angle = -.5;
void setup(){
  size(600,600,P3D);
//cam = new PeasyCam(this, 100);
//  cam.setMinimumDistance(50);
//  cam.setMaximumDistance(500);
  frameRate(1000);
  for(int i = 0; i <401; i++){
   matrix[i] = new int[401];
  for(int j =0; j < 401 ;  j++){
    matrix[i][j] = 0;
  }
  }
}

void draw(){
//  translate(width/2,height/2);
 //  rotateX(angle);
 // rotateY(angle);
   scale(10);
  float x= random(400);
  float y = random(400);
 //point(x,y);
   matrix[round(x)][round(y)]++;
  num++;
  pushMatrix();
  translate(round(x)+0.5,round(y)+0.5,matrix[round(x)][round(y)]);
  box(1);
  popMatrix();
  if(num == 64000000) exit();
}

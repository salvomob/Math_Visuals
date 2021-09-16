PrintWriter output;
double yes = 0;
double no = 0;
double pi = 0;
int w = 400;
int matrix[][] = new int[w][w];
int num=0;
void setup()
{
  output = createWriter("input.txt");
  frameRate(100000);
  size(400, 400);
  background(0);
  for (int i = 0; i < w; i++) {
    matrix[i] = new int[w];
    for (int j =0; j < w; j++) {
      matrix[i][j] = 0;
    }
  }
    while (num != 1700000000) {
      float x = random(0, w-1);
      float y = random(0, w-1);
      if (isInCircle(x, y)) {
        
          matrix[round(x)][round(y)]++;
         yes++;
      }
      else {
          matrix[round(x)][round(y)]++;
          no++;
      }
      if (yes > 1 && no > 1)
      {
        pi =(double)(yes/num)*4;
      }
      num++;
    }
    mousePressed();
  }


/*void draw()
 {
 num++;
 float x = random(0,w-1);
 float y = random(0,w-1);
 // println(x);
 //println(y);
 if(isInCircle(x,y)){
 if(matrix[round(x)][round(y)] == 0){
 stroke(0,255,0);
 point(x,y);
 //ellipse(x,y,2,2);
 matrix[round(x)][round(y)]++;
 yes++;
 }
 else {
 matrix[round(x)][round(y)]++;
 yes++;
 }
 }
 else{
 if(matrix[round(x)][round(y)] == 0){
 stroke(255,0,0);
 point(x,y);
 // ellipse(x,y,2,2);
 no++;
 matrix[round(x)][round(y)]++;
 }
 else{
 matrix[round(x)][round(y)]++;
 no++;
 }
 }
 if(yes > 1 && no > 1)
 {
 pi =(double)(yes/num)*4;
 }
 //  println(yes + " " + no);
 // println(pi);
 if(num%1000000 == 0)
 println(num);
 println(pi);
 }*/

boolean isInCircle(float  x, float y)
{
  float q1 = pow(width-x, 2);
  float q2 = pow (height-y, 2);
  float q = q1+q2;
  float dist = pow(q, 0.5);
  //if(dist(x,y,width,height)<= width-1)
  if (dist <= w-1)
    return true;
  else
    return false;
}

void mousePressed() {
  output. println(num);
  output. println(pi);
  for (int i = 0; i < w; i++) {
    for (int j = 0; j < w; j++) {
      output.println( i+" "+j+" "+matrix[i][j]);
    }
  }
  output.flush(); // Writes the remaining data to the file
  output.close(); // Finishes the file
  exit(); // Stops the program
}

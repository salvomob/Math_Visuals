PrintWriter output;
int num  = 1000;
void setup(){
output = createWriter("numbersjava.txt");
for (int i = 0; i < num; i++) {
  int x = (int) random(num);
  output.println(x);
}
exit();
}

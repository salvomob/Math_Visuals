
float y;
float ly = 0;
size(1000, 1000);
background(255);
color col[] = new color[1000];

for(int i = 0; i < 1000 ;i++)
{
  col[i] = color(random(255),random(255),random(255));
  y = height -random(1000);
  stroke(col[i]);
  line(i-1,ly,i,y);
  ly = y;
}
save("istojava.png");

#include <iostream>
#include <fstream>
#include<iomanip>
#include<math.h>

using namespace std;

bool isInCircle(double x,double y);

int main()
{
    ofstream out("input2.txt");
    long int num = 0;
    int w=400;
    int h = 400;
    int matrix[w][h] = {0};
    double yes = 0;
    double no = 0;
    double pi = 0.0d;
    while(num < 1700000000)
    {
            double x = rand() % w;
            double y = rand() % h;
            if(isInCircle(x,y))
            {
                yes++;
                matrix[(int)(x)][int(y)]++;
            }
            else
            {
                no++;
                matrix[int(x)][int(y)]++;

            }
            if(yes > 1 && no > 1)
                pi = (double) (yes/num)*4;
            num++;
           /* if(num%1000000==0){
                cout << "N = " << num <<"\t";
                cout << "PI = " << pi << "\n";
            }*/

    }
    out << num <<"\n";
    out << std::setprecision(15) << pi << "\n";

    for(int i = 0; i < w; i++)
    {
        for(int j = 0; j < h; j++)
        {
            out << i << " " << j << " " << matrix[i][j] << "\n";
        }
    }
}

bool isInCircle(double x,double y)
{
    double w = 400, h = 400;
    double q1 = pow(w-x,2);
    double q2 = pow (h-y,2);
    double q = q1+q2;
    double dist = pow(q,0.5);
    //if(dist(x,y,width,height)<= width-1)
    if(dist < w-1)
        return true;
    else
        return false;
}

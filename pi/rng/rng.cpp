#include <fstream>

using namespace std;

int main()
{
    srand(time(NULL));
    ofstream out("numberscpp.txt");
    int num = 1000;
    int i = 0;
    while(i < num)
    {
        int x =(int) rand() % num;
        out << x << "\n";
        i++;
    }
}

#include <iostream>
#include<fstream>
#include<cmath>

using namespace std;


double mediana(int *arr,int n);
void insertionSort(int* , int);
double media(int*,int);
template <class T> void stampa(T *v,int n);
template <class T> void scambia(T *v,int i,int j);
template <class T> void quicksort(T *v,int n);
template <class T> int partition(T *v,int n);
template <class T> T max(T *v, int n);
double moda(int* arr,int n);
void up_down(int *arr,int n,ostream&);
void gapTest(int *arr,int n);
int *campione1(int*,int);
int *campione2(int*,int);
double mod(double a,double b);

int main(){
  /*  ifstream in("numberscpp.txt");
    ifstream in2("numbersjava.txt");
    ofstream out("output.txt");
    ofstream out2("output2.txt");
   /* int N = 100;
    int *arr = new int[N];
    for(int i = 0; i < N; i++)
        arr[i] = rand() %N;
    cout << "valori : \n";
    for(int i = 0; i < N ; i++)*/
    //    cout << arr[i] << endl;
   /* cout << "Media: " << media(arr,N) << endl;
    cout << "Mediana :" << mediana(arr,N) << endl;
    cout << "Moda: " << moda(arr,N) << endl;*/
  //  up_down(arr,N);
    //gapTest(arr,N);
   /* int n,n2;
    in>>n;
    in2>>n2;
    int *arr = new int[n];
    int *tmp = new int[n];
    int *arr2 = new int[n2];
    int *tmp2 = new int[n2];
     for(int i = 0; i < n; i++ ){
        in>>arr[i];
        tmp[i] = arr[i];
     }
     for(int i = 0; i < n2; i++ ){
        in2>>arr2[i];
        tmp2[i] = arr2[i];
     }

  int *c1 = campione1(arr,n);
  int *c2 = campione2(arr,n);
  int *c3 = campione1(arr2,n2);
  int *c4 = campione2(arr2,n2);

  up_down(c1,(int)sqrt(n),out);
  up_down(c2,(int)sqrt(n),out2);

*/

    double x = (double ) mod((25214903917 * 46235 + 11), (double) pow(2,48));
    cout << x << endl;

}

double mod(double a,double b)
{
    double x = round(a/b);

    return (a- b*x);
}

double media(int* arr,int n)
{
    double m = 0;
    for(int i = 0; i < n; i++)
    {
        m+=arr[i];
    }
    return m/n;
}

void insertionSort(int *arr,int n)
{
    if(n<=1) return;
    insertionSort(arr,n-1);
    int last = arr[n-1];
    int j = n-2;
    while (j >= 0 && arr[j] > last)
    {
        arr[j+1] = arr[j];
        j--;
    }
    arr[j+1] = last;
}

double mediana(int *arr,int n)
{
    quicksort(arr,n);
    double v1 = arr[n/2];
    double v2 = arr[1+(n/2)];
    if(n%2 == 1) return (double) arr[(n+1)/2];
    else return (v1+v2)/2 ;
}

double moda(int* arr,int n)
{
    double x = 0;
    int *frequenze = new int[n];
    for(int i = 0; i < n ; i++)
        frequenze[i] = 0;
    for(int i = 0; i < n; i++)
        frequenze[arr[i]]++;
    double m = 0;
    m =(double)  max(frequenze, n);
    for(int i = 0 ; i < n; i++){
        if(frequenze[i] == m)
        {
            cout << arr[i] << " ";
            x = (double) arr[i];
        }

    }
    cout << "viene restituito l'ultimo dei valori calcolati per la media : "<< x <<"\n";
    return (double) x;
}

template <class T> T max(T *v, int n){
    T m = v[0];
    for(int i = 0; i < n; i++)
    {
        if(m < v[i]) m = v[i];
    }
    return m;
}


template <class T> void scambia(T *v, int i , int j){
	T tmp = v[j];
	v[j]=v[i];
	v[i]=tmp;
}

template <class T> void quicksort(T *v, int n){
	if(n<=1) return;
	int m = partition(v,n);
	quicksort(v,m+1);
	quicksort(v+m+1,n-(m+1));
}
template <class T> int partition(T *v,int n){
	T x = v[0];//elemento pivot
	int i=-1;
	int j=n;
	do{
		do i++; while(v[i]<x);
		do j--; while(v[j]>x);
		if(i<j) scambia(v,i,j);
	}while(i<j);
	return j;
}

void up_down(int *arr,int n,ostream& os)
{
    int up = 0;
    int down = 0;
    int *gap = new int[(int)(sqrt(n))];
    bool x = false;
    bool lx = false;
    for(int i = 0; i < n; i++)
    {
        if(arr[i] <= arr[i+1])
        {
            lx = x;
            x = true;
            if(x!=lx)
            {
                os << "down " << down << endl;
                up++;
                down = 0;
            }
            up++;
            down = 0;

        }
        else
        {
            lx=x;
            x = false;
            if(x!=lx)
            {
                os << "up " << up << endl;
                down++;
                up = 0;
            }
            down++;
            up = 0;
        }

    }
}

void gapTest(int *arr, int n)
{
    for(int i = 0; i < n; i++)
    {
        int x = arr[i];
        int counter = 0;
        for(int j = i+1; j < n; j++){
            if(x != arr[j]) counter++;
            else{
                    cout << "Gap " << arr[i] << " = " << counter << "\n";
                    break;
                }
        }
    }
}


int* campione1(int *arr,int n)
{
    int radn = (int) sqrt(n);
    int *ret = new int[radn];
    for(int i = 0; i < radn ;i++)
        ret[i] = arr[i];
    return ret;
}


int* campione2(int *arr,int n)
{
    int radn = (int) sqrt(n);
    int *ret = new int[radn];
    for(int i = 0 ; i < radn;i++)
        ret[i] = arr[i+radn];
    return ret;

}

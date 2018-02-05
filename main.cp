//
//  main.cpp
//  quadratic equation
//
//  Created by francois mertil on 2/4/18.
//  Copyright © 2018 francois mertil. All rights reserved.
//



#include <iostream>
#include <cmath>

using namespace std;
void nosol();
void allsol();
float onesol(float, float);
float dupsol(float, float);
float twosol1(float, float, float);
float twosol2(float, float, float);
int main ()
{
    float a, b , c, D, x1, x2;
    //cout<<"Enter 3 numbers\n";
    //cin >> a >>b >>c;
    a=10^-20, b=10^3, c=10^3;
    if (a==0)
        if (b==0)
            if (c==0)
                allsol();
            else
                nosol();
            else
            { cout<<"There is one solution\n ";
                x1=onesol(b,c);
                cout<<x1<<endl;}
            else {
                D=b*b-4*a*c;
                if (D==0)
                {
                    cout<<"duplicated ";
                    x1=dupsol(a,b);
                    cout<<x1 <<endl;}
                else if (D<0)
                    nosol();
                else {
                    cout<<"Two solutions " ;
                    x1=twosol1 (a,b,D);
                    x2=twosol2 (a,b,D);
                    cout<<x1<<"," <<x2 <<endl;}
            }
    system ("pause");
    return 0;
}
void allsol() {
    cout<<" All solutions\n";
}
void nosol() {
    cout<<" No solutions\n";
}
float onesol(float b1,float c1)
{float  z;
    z=-c1/b1;
    return z;}
float dupsol(float a1,float b1)
{float  y;
    y=-b1/(2*a1);
    return y;}
float twosol1(float b1, float D1, float c1)
{float  x;
    //x=(-b1+sqrt(D1))/(2*a1);
    x=-2*c1/((-b1+sqrt(D1)));
    return x;}
float twosol2(float b1, float D1,float c1)
{float  w;
    //w=(-b1-sqrt(D1))/(2*a1);
    w=-2*c1/((-b1-sqrt(D1)));
    return w;}




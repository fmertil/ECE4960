//
//  main.cpp
//  differentiation
//
//  Created by francois mertil on 2/11/18.
//  Copyright © 2018 francois mertil. All rights reserved.
//



/*****************  NUMERICAL DIFFERENTIATION *********************/

#include <iostream>
#include <iomanip>
#include<math.h>
using namespace std;

float funct(float a);
int main()
{
    //char choice='y';
    float f1,f2,x;
   float h [18], c [18];
    //cout<<"X ? ";cin>>x;
    x=1;
    for (int i=0; i<19; i++){
        h [i]=pow(10,-i);
        cout<< c;
        h=c;
        //cout<<"Enter value of h ? ";cin>>h;
        
        cout<<endl<<"The derivative is: "<<endl;
        f1=(funct(x+h)-funct(x))/h;
        f2=(funct(x+h)-funct(x-h))/(2*h);
        cout<<"2 point derivative : "<<f1;
        cout<<endl<<"3 points derivative: "<<f2;
       // cout<<endl<<"wanna continue (y/n) ? ";cin>>choice;
    };
    return 0;
}
float funct(float x)
{
    return x*x+pow(10,8);
}

//
//  main.cpp
//  newton_method
//
//  Created by francois mertil on 3/19/18.
//  Copyright © 2018 francois mertil. All rights reserved.
//

#include<iostream>
#include<cmath>
#include<iomanip>
using namespace std;
double f(double x);    //declare the function for the given equation
double f(double x)    //define the function here, ie give the equation
{double a;
       //write the equation whose roots are to be determined
    return a=exp(100*x)-1;
}
double fprime(double x);
double fprime(double x)
{double b;
            //write the first derivative of the equation
    return b= 100*exp(100*x);
}
int main()
{
    double x,x1,e,fx,fx1;
    cout.precision(4);        //set the precision
    cout.setf(ios::fixed);
    cout<<"Enter the initial guess\n";    //take an intial guess
    cin>>x1;
    cout<<"Enter desired accuracy\n";    //take the desired accuracy
    cin>>e;
    fx=f(x);
    fx1=fprime(x);
    cout <<"x"<<"    "<<"delta x"<<"        "<<"f(x)"<<endl;
    
    do
    {
        x=x1;                /*make x equal to the last calculated value of                             x1*/
        fx=f(x);            //simplifying f(x)to fx
        fx1=fprime(x);            //simplifying fprime(x) to fx1
        x1=x-(fx/fx1);            /*calculate x{1} from x, fx and fx1*/
        cout<<x<<"     "<<fx*fx1<<"           "<<fx <<endl;
    }while (fabs(x1-x)>=e);            /*if |x{i+1}-x{i}| remains greater than the desired accuracy, continue the loop*/
    cout<<"The root of the equation is "<<x1<<endl;
    return 0;
}

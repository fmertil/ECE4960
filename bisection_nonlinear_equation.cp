//
//  main.cpp
//  bissection_for_nonlinear_equation
//
//  Created by francois mertil on 3/18/18.
//  Copyright © 2018 francois mertil. All rights reserved.
//

#include <iostream>
#include<cmath>
#include<iomanip>
using namespace std;




// An example function whose solution is determined using
// Bisection Method. The function is exp(x)-1
double func(double x)
{
    return exp(x)-1;
}

// Prints root of func(x) with error of EPSILON
void bisection(double a, double b, double e)
{
    if (func(a) * func(b) >= 0)
    {
        cout << "You have not assumed right a and b\n";
        return;
    }
    
    double c = a,fa,fb,fc;
    while ((b-a) >= e)
    {
        // Find middle point
        c = (a+b)/2;
        fa=func(a);
        fb=func(b);
        fc=func(c);
        cout<<"a="<<a<<"     "<<"b="<<b<<"     "<<"c="<<c<<"      fc="<<fc<<endl;
        
        // Check if middle point is root
        if (func(c) == 0.0)
            break;
        
        // Decide the side to repeat the steps
        else if (func(c)*func(a) < 0)
            b = c;
        else
            a = c;
    }
    cout << "The value of root is : " << c <<endl;
}

// Driver program to test above function
int main()
{cout.precision(4);        //set the precision
    cout.setf(ios::fixed);
    double a,b,c,e,fa,fb,fc;    //declare some needed variables
    // Initial values assumed
    cout <<" Enter  a  :" <<endl;
    cin>>a;
    cout <<"Enter b :" <<endl;
    cin >>b;
    cout<<"\nEnter the degree of accuracy desired"<<endl;    //Enter the accuracy
    cin>>e;                //e stands for  accuracy
    bisection(a, b,e);
    return 0;
}

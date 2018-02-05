//
//  main.cpp
//  NaN_INF_double
//
//  Created by francois mertil on 2/4/18.
//  Copyright © 2018 francois mertil. All rights reserved.
//

#include <iostream>

using namespace std;

// Generating NaN and INF in double
//
int main () {
int x = 0.0, y = 0.0, doubleResult1, doubleResult2;
doubleResult1 = 1/x;
doubleResult2 = x/y;
    cout<< "Result 1";
    cout<<doubleResult1 ;
    cout<< endl;
    
    cout<<"Result 2 ";
    cout<<doubleResult2;
    cout<< endl;
};

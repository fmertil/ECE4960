//
//  main.cpp
//  Ispositive
//
//  Created by francois mertil on 2/4/18.
//  Copyright © 2018 francois mertil. All rights reserved.
//

#include <iostream>
#include<stdio.h>

using namespace std;



void ispositivezero(float num)
{
    if(num>0)
        cout<<"number is positive";
    
    
    if(num<0)
        cout<<"number is negative";
    
    if(num==0)
        cout<<"number is zero";
}

int main()
{
    float n;
    cout<<"Please enter number";
    cin>>n;
    
    ispositivezero(n);
   
    
   
    
}

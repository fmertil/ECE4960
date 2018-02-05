//
//  main.cpp
//  factorial
//
//  Created by francois mertil on 1/30/18.
//  Copyright © 2018 francois mertil. All rights reserved.
//

#include <iostream>
using namespace std;

int main()
{
     int n;
    unsigned long long factorial = 1;
    
    cout << "Enter a positive integer: ";
    cin >> n;
    
    for(int i = 1; i <=n; ++i)
    {
        factorial *= i;
    }
    
    cout << "Factorial of " << n << " = " << factorial;
    
    return 0;
}

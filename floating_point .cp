//
//  main.cpp
//  floating_point_computation
//
//  Created by francois mertil on 2/4/18.
//  Copyright © 2018 francois mertil. All rights reserved.
//

#include <iostream>
using namespace std;


int main() {
    // Make x with easily observable precision
    long double  x = 1.234567890123456;
    int i = 1;
    // The normalized number is above 4.9407*10^(-324)
    x =x*10^(–307);
    // Decrease the normalized number to the range of denormals
    for (i=1; i<20; i++) {
        x /= 10.0;
        cout << x;
    }

    
}

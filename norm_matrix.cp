//
//  main.cpp
//  norm_matrix
//
//  Created by francois mertil on 3/4/18.
//  Copyright © 2018 francois mertil. All rights reserved.
//

#include <iostream>

#include <iostream>
using namespace std;

int main()
{
    int array[4][5], columntotal[4] = {0}, rowtotal[5] = {0};
    int x, y ;
    for(x = 0; x < 4; x++)
        for(y = 0; y < 5; y++)
            
        { cout<<"Enter your element ["<<x<<"]["<<y<<"]\n";
            cin>>array[x][y];}
    
    for(x = 0; x < 4; ++x)
    {
        for(y = 0; y < 5; ++y)
        { columntotal[x] = columntotal[x] + array[x][y];}
    }
    for(x = 0; x < 4; x++)
    { cout <<"Sum col: "<<columntotal[x]<<endl;}
    
    
    for(x = 0; x < 4; x++)
    {
        for(y = 0; y < 5; y++)
        { rowtotal[y] = rowtotal[y] + array[x][y];}
    }
    for(y = 0; y < 5; y++)
    { cout <<"Sum row: "<<rowtotal[y]<<endl;}
    
    system ("Pause");
    return 0;
}

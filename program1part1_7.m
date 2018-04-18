
        disp('This program will calculate pi based on n terms.') 
        n=input('Enter number of terms to calculate pi to: ')
        if (n < 0) 
            disp('ERROR! Invalid Input. Try again.')
        else
            if (n == 0) 
                disp('That would not work')
            end
        end
    sum=0.0;
     for  i =0:n
         sum = sum + ( (-1)^(i))/(2*i+1);
     end
      
     
     pi = 4 * sum;
     fprintf('%32.30f',pi)
    
     
   
     

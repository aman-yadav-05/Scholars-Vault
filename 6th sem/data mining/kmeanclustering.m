 x = [2 2 8 5 7 6 1 4];
 y = [10 5 4 8 5 4 2 9];
 %Divide in 3 cluster
 a = [2 10];
 b = [5,8];
 c = [1,2];
 % for the store cluster value 
 a11 =[]; b11 = []; c11 =[]; a12 =[]; b12 =[];c12 =[];
  j = 1; k = 1; n = 1;
  temp = 0;
 while(temp ==0)
    
     %Calculate Equivalent distance
     for i =1:length(x)
         aa1 = sqrt(((x(i) - a(1))^2) + ((y(i) - a(2))^2));
         bb1 = sqrt((x(i) - b(1))^2 + (y(i)-b(2))^2);
         cc1 = sqrt((x(i)-c(1))^2 + (y(i) - c(2))^2);
         
         if(aa1 < bb1 && aa1<cc1)
             a11(j)=x(i);
            a12(j) = y(i);
           j = j+1;
            
         else if(bb1 <aa1 && bb1 < cc1)
                 b11(k) = x(i);
                 b12(k) = y(i);
                k = k+1;
             else
               c11(n)=x(i);
               c12(n)=y(i);
               n = n+1;
             end
         end
     end
     %calculate mean value 
     m1=mean(a11);
     m2 = mean(a12);
     m3 = mean(b11);
     m4 = mean(b12);
     m5 = mean(c11);
     m6 = mean(c12) ;  
      %if old cluster and new cluster are equal than stop
     if(a(1) ~= m1 && a(2) ~= m2 && b(1) ~= m3 && b(2) ~= m4 && c(1) ~=m5 && c(2) ~= m6)
         
         a = [m1,m2];
         b = [m3,m4];
         c = [m5,m6];
     else
         temp = 1;
     end
 end
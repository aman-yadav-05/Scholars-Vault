

% xor gate

x1 = [.1 .1 .9 .9];
x2 = [1 .9 .9 .1];
y_d = [.1 .9 .9 .1];
w1 = rand(2,2);
w2 = rand(2,2);


b1 = rand(1,1);
b2 = rand(1,1);
b3 = rand(1,1);
b4 = rand(1,1);

eta = 0.5;
temp = 0;

for i = 1:1000
    
    for j = 1 :4
        
        %calculate net input for hidden layer
        h1 = x1(j)*w1(1) + x2(j) *w1(2)+b1;
        y1 = 1./(1+exp(-h1));
        
        h2 = x1(j)*w1(3) + x2(j) *w1(4)+b2;
        y2 = 1./(1+exp(-h2));
        
        %calculate net input for outer layer
        o1 = y1*w2(1) + y2*w2(2) + b3;
        yy1 = 1./(1+exp(-o1));
        
        o2 = y1*w2(3) + y2*w2(4)+b4;
        yy2 = 1./(1+exp(-o2));
        
        e_total = (1/2*((y_d(j) - yy1)^2) + (1/2*(y_d(j) - yy2))^2);
        
        %if target value equal to output layer than stop
        if(yy1 == y_d(j) && yy2 == y_d(j));
            
            temp = 1;
            
        else if(e_total <0.001)
                temp = 1;
                
            else
                % update weights outer layer
                w2(1) = w2(1) + eta*((y_d(j) - yy1) * (1 - yy1) *yy1 *y1);
                w2(2) = w2(2) + eta*((y_d(j) - yy1) * (1 - yy1) *yy1 *y2);
                w2(3) = w2(3) + eta*((y_d(j) - yy2) * (1 - yy2) *yy2 *y1);
                w2(4) = w2(4) + eta*((y_d(j) - yy2) * (1 - yy2) *yy2 *y2);
                b3    = b3   + eta*(y_d(j) - yy1);
                b4    =  b4    +eta*(y_d(j) - yy2);
                
                %update weights for hidden layer
                w1(1) = w1(1) + eta*((1-y1)*y1*x1(j));
                w1(2) = w1(2) + eta *((1-y1)*y1*x2(j));
                w1(3) = w1(3) + eta *((1-y2)*y2*x1(j));
                w1(4) = w1(4) + eta *((1-y2)*y2*x2(j));
                b1    = b1+eta*x1(j);
                b2   = b2 +eta*x2(j);
                
            end
        end
        
    end
    
    if(temp == 1)
        disp('complite');
        break;
        
    end
    
    
end
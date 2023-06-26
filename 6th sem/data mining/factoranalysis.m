%Factor analys

%data set
dataset =  xlsread('winequality_red.csv');
%normalize
normalisedData = zscore(dataset);

% calculate correlation matrix
correlationMatrix = corr(normalisedData);

%calculate Eigon value(d) and Eigon vector(v)
[value, data] = eig(correlationMatrix);

%arrange descending order
[sortValue,order] = sort(diag(data),'descend');
vector_sort = value(:,order);
 vector = [  ];
 
 for i = 1 : length(sortValue)
    
     if(sortValue(i) >= 1)
     vector(:,i) = vector_sort(:,i);
     end
 end

%calculate factor loading matrix
a = vector_sort * sqrt(sortValue);

%calculate factor score
b = correlationMatrix\a;
factorAnalysis=normalisedData*b;



% plot(factorAnalysis);
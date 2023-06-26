%PCA Program

%loading the data set
 dataSet = xlsread('winequality_red.csv');

% normalising the data
normalisedData = zscore(dataSet);
 
% covariance matrix
c = cov(normalisedData);
% eigon value and eigon vector
[value ,data] = eig(c);


% arrange the descending order 
[eigon_sort, order] = sort(diag(data),'descend');
vector_sort = value(:,order);
 
 vector =[  ];
% keep only egion vector which egion value >=1
 for i =1:length(eigon_sort)
     
     if(eigon_sort(i) >= 1)
         vector(:,i) = vector_sort(:,i);
         
     end
end

%Calculating principle component
principleComponent=normalisedData*vector;
% plot(principleComponent);
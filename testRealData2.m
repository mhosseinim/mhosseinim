%%%% finiding similarity of document 

close all 
clear all 
clc
clusterName = {'sport','market','cnn','medical','network'};
data = cell(25,1);
%words = cell(length(25),1);
%counts = cell(length(25),1);
for cat =1:5
 for i= 1:5
   filename = [ strcat(['dataset/' clusterName{cat}], num2str(i)) '.mat'];
   ds=load(filename);
   index = 5*(cat-1)+(i-1)+1; 
   data{index} = strsplit(ds.d);  
 end
end

[words,counts]= LSA.index(data); 
[dictionary] = LSA.createTerms(words);  
[docterm] = LSA.generateDocterm(words,counts,dictionary);
% %table(docterm,'RowNames',dictionary)
 format bank;

[T S D] = svd(double(docterm));
tfidf = LSA.tfidf(docterm);
[t s d] = svd(tfidf);
% 
[sortedt, idxt] = sort(T,'descend');
size(idxt);
idxt = idxt(1:10,:);
size(dictionary(idxt));

[sortedd, idxd] = sort(D','descend');
size(idxd);
idxd = idxd(1:3,:);


figure('Name','singular values ','NumberTitle','off')
plot(diag(s))
hold on
plot(diag(S))
hold off

% 
% 
% [sorted_term, idx_term] = sort(T,'descend');
% idx_term(31:end,:)=[];
% 
% [sorted_doc, idx_doc] = sort(D','descend');
% idx_doc(6:end,:)=[];
% 
% 
% 
% 
% 

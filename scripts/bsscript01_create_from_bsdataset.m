clear all
clc
load('../dataset/bsdetector_consize.mat');
body = dataset(:,1);
labels = cell2mat(dataset(:,2));
[docterm,dictionary] = createDocterm(body,true); % for debug message
tfidf = LSA.tfidf(docterm);
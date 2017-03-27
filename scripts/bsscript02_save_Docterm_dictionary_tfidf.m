filename = '../data/bsData.mat';

docterm = sparse(docterm);
tfidf = sparse(tfidf);
% use full to return the real matrix
news = body;
save(filename,'dictionary','docterm','tfidf','news','labels');
clear all 
clc


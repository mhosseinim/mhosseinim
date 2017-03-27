%first run script 01 
filename = '../data/newsData.mat';

docterm = sparse(docterm);
tfidf = sparse(tfidf);
% use full to return the real matrix
news = body;
save(filename,'dictionary','docterm','tfidf','index','news');
clear all 
clc


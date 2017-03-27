% clear all
% clc 
% load('../data/bsData.mat');
% tfidf  = full(tfidf);
% docterm = full(docterm);


[Terms_value,Docs_value,Dn] = nnmf(docterm,100);
disp('non negative matrix factorization finished');

[terms_value,docs_value,dn] = nnmf(tfidf,100);
disp('non negative matrix factorization on TFIDF finished');


[~, idxd] = sort(docs_value','descend');
idxd_concise = idxd(1:80,1:100);
selected_articles = idxd_concise;
selected_labels = labels(idxd_concise);

[~, idxd] = sort(Docs_value','descend');
idxd_concise = idxd(1:80,1:100);
Selected_articles = idxd_concise;
Selected_labels = labels(idxd_concise);


[~, idxt] = sort(Terms_value,'descend');
idxt_concise = idxt(1:1000,1:100);% 100 highest terms in 80 hightest SVD terms
Highlight_terms = dictionary(idxt_concise);
disp('sorting terms on pure finished');

[~, idxt] = sort(terms_value,'descend');
idxt_concise = idxt(1:1000,1:100);% 100 highest terms in 80 hightest SVD terms
highlight_terms = dictionary(idxt_concise);
disp('sorting terms on tfIdf finished');


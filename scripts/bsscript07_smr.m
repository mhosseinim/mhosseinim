% clear all
% clc 
% load('../data/bsData.mat');
% tfidf  = full(tfidf);
% docterm = full(docterm);
lambda = 30;
[A B fits]=SMR(t,20,lambda); % nnmf(docterm,100);
disp('non SMR matrix factorization finished');
save('SMR_tfidf_100iter_k20_lambda30.mat','A','B','fits');
[~, idxd] = sort(B,'descend');
Selected_labels = labels(idxd);

% 
% [~, idxd] = sort(docs_value','descend');
% idxd_concise = idxd(1:80,1:100);
% selected_articles = idxd_concise;
% selected_labels = labels(idxd_concise);
% 
% [~, idxd] = sort(Docs_value','descend');
% idxd_concise = idxd(1:80,1:100);
% Selected_articles = idxd_concise;
% Selected_labels = labels(idxd_concise);
% 
% 
% [~, idxt] = sort(Terms_value,'descend');
% idxt_concise = idxt(1:1000,1:100);% 100 highest terms in 80 hightest SVD terms
% Highlight_terms = dictionary(idxt_concise);
% disp('sorting terms on pure finished');
% 
% [~, idxt] = sort(terms_value,'descend');
% idxt_concise = idxt(1:1000,1:100);% 100 highest terms in 80 hightest SVD terms
% highlight_terms = dictionary(idxt_concise);
% disp('sorting terms on tfIdf finished');
% 

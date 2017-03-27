clear all
clc 
load('../data/newsData.mat');
tfidf  = full(tfidf);
docterm = full(docterm);
[terms_value,s,docs_value] = svd(tfidf);
disp('SVD on TFIDF finished');

[Terms_value,S,Docs_value] = svd(docterm);
disp('SVD on pure finished');

figure,
semilogy(diag(s(1:1600,1:1600)),'r.')
hold on, 
semilogy(diag(S(1:1600,1:1600)),'b.')
legend('tfidf','pure');
hold off

[~, idxd] = sort(docs_value','descend');
idxd_concise = idxd(1:80,1:100);
selected_articles = index(idxd_concise);


[~, idxd] = sort(Docs_value','descend');
idxd_concise = idxd(1:80,1:100);
Selected_articles = index(idxd_concise);




[~, idxt] = sort(Terms_value,'descend');
idxt_concise = idxt(1:1000,1:100);% 100 highest terms in 80 hightest SVD terms
Highlight_terms = dictionary(idxt_concise);
disp('sorting terms on pure finished');

[~, idxt] = sort(terms_value,'descend');
idxt_concise = idxt(1:1000,1:100);% 100 highest terms in 80 hightest SVD terms
highlight_terms = dictionary(idxt_concise);
disp('sorting terms on tfIdf finished');

save('../data/svd_news_tfidf.mat','terms_value','s','docs_value','highlight_terms','selected_articles');
save('../data/svd_news.mat','terms_value','S','Docs_value','Highlight_terms','Selected_articles');

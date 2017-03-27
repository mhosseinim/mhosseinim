clear all
clc 
load('../data/newsData.mat');

[Wn,Hn,Dn] = nnmf(docterm,100);
disp('non negative matrix factorization finished');

[wn,hn,dn] = nnmf(tfidf,100);
disp('non negative matrix factorization on TFIDF finished');

[~, idxd] = sort(Hn','descend');
idxd_concise = idxd(1:80,1:100);
Selected_articles_nmf = index(idxd_concise);


[~, idxt] = sort(Wn,'descend');
idxd_concise = idxt(1:1000,1:100);
Highlight_terms_nmf = dictionary(idxd_concise);

[~, idxd] = sort(hn','descend');
idxd_concise = idxd(1:80,1:100);
selected_articles_nmf = index(idxd_concise);


[~, idxt] = sort(wn,'descend');
idxd_concise = idxt(1:1000,1:100);
highlight_terms_nmf = dictionary(idxd_concise);

 save('../data/nmf_news_tfidf.mat','wn','hn','selected_articles_nmf','highlight_terms_nmf');
 save('../data/nmf_news.mat','Wn','Hn','Selected_articles_nmf','Highlight_terms_nmf');

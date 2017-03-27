% % % % clear all 
% % % % close all 
% % % % clc
% % % % 
% % % % 
% % % % body_filename = 'train_bodies.xlsx';
% % % % [index body] = xlsread(body_filename);
% % % % index = index(1:end);
% % % % body = body(2:end,2);
% % % % 
% % % % stance_filename  = 'train_stances.xlsx';
% % % % [headlines idx stance] = xlsread(stance_filename);
% % % % headlines = stance(2:end,1);
% % % % idx = stance(2:end,2);
% % % % stance= stance(2:end,3);
% % % % 
% % % % disp('importing data finished');
% % % % 
% % % % body = cellfun(@parseStringTest, body, 'UniformOutput', false);
% % % % disp('parsing data finished');
% % % % bodyCells = cellfun(@strsplit, body, 'UniformOutput', false);
% % % % disp('spliting finished');
% % % % 
% % % % [words,counts]= LSA.index(bodyCells); 
% % % % disp('indexing finished');
% % % % [dictionary] = LSA.createTerms(words);  
% % % % disp('creating dictionary finished');
% % % % [docterm] = LSA.generateDocterm(words,counts,dictionary);
% % % % disp('generating Doc-Terms finished');
% % % % 
% % % % % %table(docterm,'RowNames',dictionary)
load('saveData.mat');
% % % % format bank;
% % % % 
% load('svdData.mat');
% % % % [T S D] = svd(double(docterm));
% % % % disp('SVD finished');
% % % % 
% % % % tfidf = LSA.tfidf(docterm);
% % % % [t s d] = svd(tfidf);
% % % % disp('SVD on TFIDF finished');
% % % % [~, idxt] = sort(t,'descend');
% % % % idxt_concise_tfidf = idxt(1:1000,1:100);% 100 highest terms in 80 hightest SVD terms
% % % % highlight_terms_tfidf = dictionary(idxt_concise_tfidf);
% % % % disp('sorting terms on tfIdf finished');
% % % % 
% % % % [~, idxt] = sort(T,'descend');
% % % % idxt_concise_pure = idxt(1:1000,1:100);% 100 highest terms in 80 hightest SVD terms
% % % % highlight_terms_pure = dictionary(idxt_concise_pure);
% % % % disp('sorting terms on pure finished');
% % % % 
% % % % 
% % % % [~, idxd] = sort(D','descend');
% % % % idxd_concise_pure_transpose = idxd(1:80,1:100);
% % % % selected_articles_pure_transpose = index(idxd_concise_pure_transpose);
% % % % 
% % % % [~, idxd] = sort(D,'descend');
% % % % idxd_concise_pure = idxd(1:80,1:100);
% % % % selected_articles_pure = index(idxd_concise_pure);
% % % % 
% % % % [~, idxd] = sort(d','descend');
% % % % idxd_concise_tfidf_transpose = idxd(1:80,1:100);
% % % % selected_articles_tfidf_transpose = index(idxd_concise_tfidf_transpose);
% % % % 
% % % % [~, idxd] = sort(d,'descend');
% % % % idxd_concise_tfidf = idxd(1:80,1:100);
% % % % selected_articles_tfidf = index(idxd_concise_tfidf);
% % % % 
% % % % 
% load('nnfmData.mat');
% % % % [Wn,Hn,Dn] = nnmf(double(docterm),100);
% % % % disp('non negative matrix factorization finished');
% % % % 
% % % % [wn,hn,dn] = nnmf(tfidf,100);
% % % % disp('non negative matrix factorization on TFIDF finished');
% % % % [~, idxd] = sort(Hn','descend');
% % % % idxd_concise_tfidf = idxd(1:80,1:100);
% % % % selected_articles_tfidf_nnmf = index(idxd_concise_tfidf);


load('icaData.mat');
% % % % [icasig, A, W] = fastica (double(docterm));
[~, idxt] = sort(A,'descend');
idxt_concise_pure = idxt(1:1000,1:100);% 100 highest terms in 80 hightest SVD terms
highlight_terms_pure = dictionary(idxt_concise_pure);

[~, idxd] = sort(icasig','descend');
idxd_concise_tfidf = idxd(1:80,1:100);
selected_articles_tfidf_nnmf = index(idxd_concise_tfidf);

% SP  = diag(S);
% sp  = diag(s);
% x = 1:1000;
% plot(x,SP(1:length(x)),'--',x,sp(1:length(x)),':')
% legend('PURE','TFIDF')
% 
% figure,
% x = 1:100;
% plot(x,SP(1:length(x)),'--',x,sp(1:length(x)),':')
% legend('PURE','TFIDF')
% 

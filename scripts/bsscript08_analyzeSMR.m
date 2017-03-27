load('SMR_tfidf_100iter_k40_lambda30.mat');
[~, idxd] = sort(B,'descend');
classes = labels(idxd);
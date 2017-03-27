body_filename = 'train_bodies.xlsx';
[index body] = xlsread(body_filename);
index = index(1:end);
body = body(2:end,2);
[docterm,dictionary] = createDocterm(body,true); % for debug message
tfidf = LSA.tfidf(docterm);

body_filename = 'train_bodies.xlsx';
[index body] = xlsread(body_filename);
index = index(1:end);
body = body(2:end,2);

stance_filename  = 'train_stances.xlsx';
[headlines idx stance] = xlsread(stance_filename);
headlines = stance(2:end,1);
idx = stance(2:end,2);
stance= stance(2:end,3);

[docterm,dictionary] = createDocterm(body);

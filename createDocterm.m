% body_filename = 'train_bodies.xlsx';
% [index body] = xlsread(body_filename);
% index = index(1:end);
% body = body(2:end,2);
% 
%[docterm,dictionary] = createDocterm(body);
%
% OR
%
%[docterm,dictionary] = createDocterm(body,true); % for debug message
function [docterm,dictionary] = createDocterm(news,dbg_msg)
if nargin ==1
    dbg_msg = false;
end;

news = cellfun(@parseStringTest, news, 'UniformOutput', false);
if dbg_msg
    disp('parsing data finished');
end
bodyCells = cellfun(@strsplit, news, 'UniformOutput', false);
if dbg_msg
    disp('spliting finished');
end
[words,counts]= LSA.index(bodyCells); 
if dbg_msg
    disp('indexing finished');
end
[dictionary] = LSA.createTerms(words);  
if dbg_msg
    disp('creating dictionary finished');
end
[docterm] = LSA.generateDocterm(words,counts,dictionary);
if dbg_msg
    disp('generating Doc-Terms finished');
end
end
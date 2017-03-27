%  load('../data/svd_bs_tfidf.mat');
%  load('../data/svd_bs.mat');
%  load('../data/bsData.mat');

%%%%%% this part for top x iteration over topXsize
% % topX =60;
% % g = [];
% % p =[];
% % sl = selected_labels(1:topX,:);
% %  for l=1:7 % label of 1 to 7
% %      %p(l,:) =sum(sl == l)/sum(labels == l); % good for scatter display of pdf 
% %      g(l,:)=sum(sl == l)/topX; % used for top 20 top40 top60
% %  end
% %  %p = p';
% %  g = g';


%%%% this part for top x iteration over topXsize
label =7; % 1 to 7 
p =[];
g = [];
index = 0;
 for topX=20:20:80 % label of 1 to 7
     sl = Selected_labels(1:topX,:);
     index = index +1;
     p(end+1,:) =sum(sl == label)/sum(labels == label); % good for scatter display of pdf 
     %g(end+1,:)=sum(sl == label)/topX; % used for top 20 top40 top60
 end
 p = p';
 %g = g';
 
 for l=1:7
    class_sizes(l)=sum(labels == l);
 end
 disp('lables:');
 disp({'bias','fake','hate','conspiracy','satire','state','junksci'});
 disp('class sizes:');
 disp(class_sizes);
 
 
 
 
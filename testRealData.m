%%%% finiding similarity of document 

close all 
clear all 
clc
clusterName = {'sport','market','cnn','medical','network'};
data = cell(25,1);
%words = cell(length(25),1);
%counts = cell(length(25),1);
for cat =1:5
 for i= 1:5
   filename = [ strcat(['dataset/' clusterName{cat}], num2str(i)) '.mat'];
   ds=load(filename);
   index = 5*(cat-1)+(i-1)+1; 
   data{index} = strsplit(ds.d);  
 end
end

[words,counts]= LSA.index(data); 
[dictionary] = LSA.createTerms(words);  
[docterm] = LSA.generateDocterm(words,counts,dictionary);
%table(docterm,'RowNames',dictionary)
format bank;

[T S D] = svd(double(docterm));
tfidf = LSA.tfidf(docterm);
[t s d] = svd(tfidf);

T * T'; %  eye (13)// terms
D' * D; % eye (3)

s25 = s(1:25,1:25);
docsim = d' * s25^2 * d;
simabs = abs(docsim);
simabs(simabs<1.5*mean(simabs(:))) = 0;
figure('Name','pure absolute data ','NumberTitle','off')
simabs2 = simabs +4000;

surf(simabs2)
set(gca, 'XTick', 1:5:25);
set(gca, 'XTickLabel', clusterName);
set(gca, 'YTick', 1:5:25);
set(gca, 'YTickLabel', clusterName);
set(gca,'xlim',[1 25],'ylim',[1 25]);
alpha 0.8
hold on
imagesc(simabs);
colorbar;
hold off


sim = docsim;
sim(sim<1.5*mean(sim(:))) = 0;
figure('Name','pure  data ','NumberTitle','off')
sim2 = sim+4000;

surf(sim2)
set(gca, 'XTick', 1:5:25);
set(gca, 'XTickLabel', clusterName);
set(gca, 'YTick', 1:5:25);
set(gca, 'YTickLabel', clusterName);
set(gca,'xlim',[1 25],'ylim',[1 25]);
alpha 0.8
hold on
imagesc(sim);
colorbar;
hold off




S25 = S(1:25,1:25);
S25(6:end,6:end) =0;
Docsim = D' * S25^2 * D;
SimAbs = abs(Docsim);
SimAbs(SimAbs<1.5*mean(SimAbs(:))) = 0;

figure('Name','tfitf absolute data','NumberTitle','off')
SimAbs2 = SimAbs +9000;
surf(SimAbs2)
set(gca, 'XTick', 1:5:25);
set(gca, 'XTickLabel', clusterName);
set(gca, 'YTick', 1:5:25);
set(gca, 'YTickLabel', clusterName);
set(gca,'xlim',[1 25],'ylim',[1 25]);
alpha 0.8
hold on
imagesc(SimAbs);
colorbar;
hold off



Sim = Docsim;
Sim(Sim<1.5*mean(Sim(:))) = 0;

figure('Name','tfitf data','NumberTitle','off')
Sim2 = Sim +9000;
surf(Sim2)
set(gca, 'XTick', 1:5:25);
set(gca, 'XTickLabel', clusterName);
set(gca, 'YTick', 1:5:25);
set(gca, 'YTickLabel', clusterName);
set(gca,'xlim',[1 25],'ylim',[1 25]);
alpha 0.8
hold on
imagesc(Sim);
colorbar;
hold off


clear all 
clc

x = [1,0,0,1,0,0,0,0,0;
    1,0,1,0,0,0,0,0,0;
    1,1,0,0,0,0,0,0,0;
    0,1,1,0,1,0,0,0,0;
    0,1,1,2,0,0,0,0,0;
    0,1,0,0,1,0,0,0,0;
    0,1,0,0,1,0,0,0,0;
    0,0,1,1,0,0,0,0,0;
    0,1,0,0,0,0,0,0,1;
    0,0,0,0,0,1,1,1,0;
    0,0,0,0,0,0,1,1,1;
    0,0,0,0,0,0,0,1,1]


figure('Name','different S values')
for k = 1:9
   y= S(:,1:k)*V(1:k,1:k)*D(1:k,:);
   subplot(3,3,k);
   plot(y)
   title(strcat('s =    ',num2str(k)));
   axis([1 12 -1 2])

end

explained = cumsum(V.^2/sum(V.^2));
figure('Name','Cumulative sum of S^2')
plot(1:size(V,1),explained)
xlim([1 30]);ylim([0 1]);
line([5 5],[0 explained(5)],'Color','r')
line([0 5],[explained(5) explained(5)],'Color','r')
title('Cumulative sum of S^2 divided by sum of S^2')
xlabel('Column')
ylabel('% variance explained')



figure()
scatter(S(:,1), S(:,2),'filled')
title('docs and Words (tfidf)')
xlabel('Dimension 1')
ylabel('Dimension 2')
xlim([-1 1]); ylim([-.1 0.2])
for i = [1,4,9,12,15,16,20,22,23,24,25,27,29,33,34,35,38,47,48,53,57,58,...
       ]
     text(D(i,1).*5, D(i,2).*5, S(i))
end


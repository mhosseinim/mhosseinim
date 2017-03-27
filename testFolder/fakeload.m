% body_filename = '../dataset/bs_detector.xlsx';
% [index body] = xlsread(body_filename);
xbody=[];
xtype = [];
index =1;
keySet = {'bias','fake','hate','conspiracy','satire','state','junksci'};
valueSet =1:7;
mapMe =containers.Map(keySet,valueSet);

for i=1:size(body,1)
    if(size(body{i,6},2)>1000) %more than 1000 letters
        xbody{index}=body{i,6};
        xtype{index} = mapMe(body{i,20});
        index = index+1;
    end
end
news =[xbody;xtype];
dataset = news';
save('../dataset/bsdetector_consize.mat','dataset');
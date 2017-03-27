
function createDataSet()

clusterName = {'sport','market','cnn','medical','network'};

for cat =1:5
 for i= 1:5
   filename = [ strcat(['dataset/' clusterName{cat}], num2str(i)) '.txt'];
    d = parseFile(filename);
    save(strcat(['dataset/' clusterName{cat}], num2str(i)),'d');
  end
end
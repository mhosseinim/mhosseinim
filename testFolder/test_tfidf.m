% |terms| * |documents|
% test the wikipedia example

% % doctermX = [1,1,2,1,0,0,0;1,1,0,0,2,3,0];
% % doctermX = doctermX';
% % disp(doctermX);
%%% weight = tfidf (doctermX);


doctermX = [1,1,2,1,0,0,0;1,1,0,0,2,3,0];
doctermX = doctermX';
disp(doctermX);
%tf = 1 + log10(doctermX(doctermX<1)=1);

%%% 1- in wiki but I added 1 to both nominator and denomitor of idf to
%%% avoid devided by zero
tf = doctermX./sum(doctermX);
n = sum(doctermX' ~= 0, 1)';
N = size(doctermX,2);
idf = log10((1+ N)./(n+1));
result = tf .* idf

%%% 2- previously (corrected)
tf = 1 + log10(double(doctermX));
tf(tf == -Inf) = 0;
n = sum(doctermX' ~= 0, 1)';
N = size(doctermX,2);
idf = log10((1+ N)./(n+1));
tfidf = tf.* idf



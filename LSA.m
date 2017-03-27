%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%
%%%         MY CLASS MY RULE
%%%
%%%%%%%%%%%%%%%%%%%%%%%%%
classdef LSA
    methods (Static)
       function [words,counts]= index(data)  
            for i= 1:length(data)
                 emptyCells = cellfun(@isempty,data{i});
                 data{i}(emptyCells) = [];
                 [uniqs, ~, idx] = unique(data{i});
                  count= accumarray(idx,1);       
                  words{i} = uniqs';
                  counts{i} = count';

            end
       end
       function dictionary = createTerms(words)
            dictionary  = unique(cat(1, words{:}));  
            emptyCells = cellfun(@isempty,dictionary);
             dictionary(emptyCells) = [];
       end
       function docterm = generateDocterm(words,counts,dictionary)
            docterm = zeros(length(words),length(dictionary));
            for i = 1:length(words)
              cols = ismember(dictionary,words{i});
              docterm(i,cols) = counts{i};
            end
             docterm = docterm';
       end
       % ratio * log10 (1+ N/(n+1))
       function tfidf = tfidf_rationTF(docterm) %first Implementation;
%             tf = 1 + log(double(docterm));
%             tf(tf == -Inf) = 0;
%             idf = log(size(docterm,2) ./ sum(docterm));
%             tfidf = tf.* idf;
                tf = docterm./sum(docterm);
                n = sum(docterm' ~= 0, 1)';
                N = size(docterm,2);
                idf = log10((1+ N)./(n+1));
                tfidf = tf .* idf;  
       end
       % tf = 1+log10(docterm) . idf = log10 (1+N/(n+1));
       % docterm(|words| * |documents|) matrix
       function tfidf = tfidf(docterm) %first Implementation;
            tf = 1 + log10(docterm);
            tf(tf == -Inf) = 0;
            n = sum(docterm' ~= 0, 1)';
            N = size(docterm,2);
            idf = log10((N+1)./(n+1));
            tfidf = tf.* idf;
       end
       function q = query(strq,dictionary)
           query = strsplit(strq);
            q = zeros(1,length(dictionary));
            cols = ismember(dictionary,query);
            q(1,cols) = 1;
            q = q';
            
       end
        function sim = score(matrix,query)
            % Get cosine similarity scores from a length normalized matrix
            sim = dot(matrix,repmat(query,size(matrix,1),1),2);
        end
        function normalized = normalize(matrix)
            % Length normalize each rows of a sparse matrix  
            normalized = bsxfun(@rdivide, matrix, sqrt(sum(matrix.^2,2)));
        end
        function q_reduced = reduce(weighted_q,U,S)
                % used the Tk and Sk from Low Rank approximation step to
                % reduce the new query into the same vector space
                q_reduced = weighted_q' * U * S^-1;
        end
    end
           
end

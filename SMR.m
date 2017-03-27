function [A B fits]=SMR(X,k,lambda)
%solves ||X-A*B'||^2 + lambda*||A||_1 + lambda*||B||_1
%Inputs:
%X: input data matrix
%k: desired approximation rank
%lambda: balanced sparsity penalty
%Vagelis Papalexakis, Nikos Sidiropoulos, 2011
MAXNUMITER=100;
SMALLNUMBER = 10^-4;
[m n]=size(X);
%[u s v]=svds(X,k);
%A = u*s;
%B = v;
%A=orth(randn(m,k));
%B=orth(randn(n,k));
A = sprand(m,k,1);
B = sprand(n,k,1);
fits = [];
new_norm=norm(X-A*B','fro')^2 + lambda*sum(sum(abs(A))) + lambda*sum(sum(abs(B)));
old_norm=new_norm+10^10;
iter_count=1;
while(abs(new_norm-old_norm)>SMALLNUMBER && iter_count < MAXNUMITER)%until convergence

    B=NNSMREW(X,A,B,lambda);   
    A=NNSMREW(X',B,A,lambda);

    old_norm=new_norm;
    new_norm=norm(X-A*B','fro')^2 + lambda*sum(sum(abs(A))) +lambda*sum(sum(abs(B)));
    fits(iter_count) = new_norm;
    if mod(iter_count,10)==0
        disp(sprintf('SMR: Iteration: %d, fit: %.10f, diff: %.10f',iter_count,new_norm,abs(new_norm-old_norm)))
    end
    iter_count=iter_count+1;
end
    %disp(sprintf('SMR: Iteration: %d, fit: %.10f, diff: %.10f',iter_count,new_norm,abs(new_norm-old_norm)))
end

function B = NNSMREW(X,A,B,lambda)

% Non-negative sparse matrix regression
% using element-wise coordinate descent
% Given X, A, find B to
% min ||X-A*B.'||_2^2 + lambda*sum(sum(abs(B)))
%
% Subject to: B(j,f) >= 0 for all j and f
%
% N. Sidiropoulos, August 2009
% nikos@telecom.tuc.gr


[I,J]=size(X);
[I,F]=size(A);

DontShowOutput = 1;
maxit=100;
convcrit = 1e-5;
showfitafter=1;
it=0;
Oldfit=1e100;
Diff=1e100;

while Diff>convcrit && it<maxit
    it=it+1;
    for j=1:J,
        for f=1:F,
            data = X(:,j) - A*B(j,:).' + A(:,f)*B(j,f);
            alpha = A(:,f);
          
            if ((alpha.'*data - lambda/2) > 0)
                B(j,f) = (alpha.'*data - lambda/2)/(alpha.'*alpha);
            else
                B(j,f) = 0;
            end
        end
    end

    fit=norm(X-A*B.','fro')^2+lambda*sum(sum(abs(B)));
    if Oldfit < fit
%         disp(['*** bummer! *** ',num2str(Oldfit-fit)])
    end
    Diff=abs(Oldfit-fit);
    Oldfit=fit;

    if ~DontShowOutput
        % Output text
        if rem(it,showfitafter)==0
            disp([' NNSMREW Iterations:', num2str(it),' fit: ',num2str(fit)])
        end
    end
end
B = sparse(B);
end
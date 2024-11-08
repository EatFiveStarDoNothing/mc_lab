clc;
clear all;
close all;
i=input('Enter no. of elements=');
q=input('Enter joint probabilities matrix=');
sum=0;

% h(x, y)
varxy = 0;
for n=1:i
    
    for m = 1:i
        h3 = varxy + q(n, m) * log2(1/q(n,m));
        varxy = h3;
    end
end
disp('h3');
disp(h3);

%probability P(x)
for n=1:i
w=0;
for m=1:i
p(n)=w+q(n,m);
w=p(n);
end
end
disp('P(x):');
disp(p);


% entropy H(x)
for n=1:i
H=sum+(p(n)*log2(1/p(n)));
sum=H;
end
disp('H(x): ');
disp(H);


%conditional probability matrix
for n=1:i
for m=1:i
a(n,m)=q(n,m)/p(n);
end
end
disp('P(Y/X):');
disp(a);


% entropy H(Y/X)
d=0;
for n=1:i
for m=1:i
if(a(n,m)>0)
H1=d+(q(n,m)*log2(1/a(n,m)));
d=H1;
end
end
end
disp('H(Y/X):');
disp(H1);


% probability P(Y)
for n=1:i
w=0;
for m=1:i
s(n)=w+q(m,n);
w=s(n);
end
end
disp('P(Y):');
disp(s);


% entropy H(Y)
k=0;
for n=1:i
H2=k+(s(n)*log2(1/s(n)));
k=H2;
end
disp('H(Y): ');
disp(H2);


% MI
m = H2- H1;

disp('MI-');
disp(m);
%Output:
%Enter no. of elements=3
%Enter joint probabilities matrix=[0.27 0.03 0;0 0.2 0.05;0 0.135 0.315]

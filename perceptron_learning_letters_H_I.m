clc; clear all;
%input array
X = [1, 1, 0, 1, 1, 1, 1, 1, 0, 1;  %H
     1, 0, 1, 0, 0, 1, 0, 0, 1, 0]; %I
%target array
T = [0; 1];

[N, n] = size(X);
lr = 0.01;
w = randn(N,n);
E = 1;
while E ~= 0
    E = 0;
    for i=1:N
        yi = 0;
        for j=1:n
            yi = yi + X(i,j)*w(i,j);
        end;
        if yi >= 0
            yo = 1;
        else
            yo = 0;
        end;
        y(i) = yo;
        ei = T(i) - yo;
        w = w + lr*ei*X(i,:);
        E = E + ei^2;
    end;
    y
end;




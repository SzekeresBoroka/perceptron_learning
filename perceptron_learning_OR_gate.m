clc; clear all;
%input array
X = [0 0; 0 1; 1 0; 1 1];
%target array
T = [0; 1; 1; 1];

% figure
% hold on; grid on;
% title('The AND gate')
% axis([-0.5 1.5 -0.5 1.5]);
% for i=1:length(X)
%     if T(i) == 0
%         plot(X(i,1), X(i,2), 'ro', 'LineWidth', 10); end;
%     if T(i) > 0
%         plot(X(i,1), X(i,2), 'bo', 'LineWidth', 10); end;
% end;

figure

[N, n] = size(X);
lr = 1;
w = zeros(n);
b = 0;
E = 1;
index = 1;
while E ~= 0
    E = 0;
    for i=1:N
        yi = 0;
        for j=1:n
            yi = yi + X(i,j)*w(j);
        end;
        yi = yi + b;
        if yi >= 0
            yo = 1;
        else
            yo = 0;
        end;
        y(i) = yo;
        ei = T(i) - yo;
        w = w + lr*ei*X(i,:)';
        b = b + ei;
        E = E + ei^2;
    end;
    
    clf('reset');
    hold on; grid on;
    axis([-0.5 1.5 -0.5 1.5]);
    title('Press any key to continue');
    for i=1:N
        if y(i) == 0
            plot(X(i,1), X(i,2), 'ro', 'LineWidth', 10); end;
        if y(i) > 0
            plot(X(i,1), X(i,2), 'bo', 'LineWidth', 10); end;
    end;
    pause()
end;

title('The OR gate');




clc; clear all;
%input array
X = [0 0; 0 1; 1 0; 1 1];
%target array
T = [0; 0; 0; 1];

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
w = ones(n);
b = -1;
E = 1;
index = 1;
while E ~= 0
%while index < 10
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
    
    %w1*x1 + w2*x2 + b = 0
    %x-intercept = (0, -b / w2)
    %y-intercept = (-b / w1, 0);
    x = -0.5:0.01:1.5;
    m = -(b / w(2)) / (b / w(1));
    Y = m * x + (-b / w(2));
    plot(x,Y);
    
    index = index+1;
    pause()
end;

title('The AND gate');

index




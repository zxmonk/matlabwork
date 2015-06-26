clear all; %清空内存
clc; %清屏

Fs = 200; %采样频率
Tp = 20; %采样持续时间
K = 1;
M = 1;
k = sqrt(K / M);
x0 = 1;
v0 = 0;
mu = 0.2;

n = mu / (2 * M);


t = 0:1/Fs:Tp;

if n < k
    w = sqrt(k^2 - n^2);
    A = sqrt(x0^2 + power((v0 + n * x0)/w,2));
    phi = atan(x0 * w /(v0 + n * x0));
    x = A * exp(-n * t) .* sin(w*t + phi);
    plot(t,x);
end

if n > k
    r1 = -n + sqrt(n^2 - k^2);
    r2 = -n - sqrt(n^2 - k^2);
    c1 = (r2*x0 - v0)/(r2 - r1);
    c2 = (r1*x0 - v0)/(r1 - r2);
    x = c1 * exp(r1*t) + c2 * exp(r2*t);
    plot(t,x);
end

if n == k
    c1 = x0;
    c2 = n*x0 + v0;
    x = exp(-n*t) .* (c1 + c2*t);
    plot(t,x);
end


% phi = atan(k * x0 / v0);
% 
% A = sqrt(x0^2 + (v0/k)^2);
% 
% t = 0:1/Fs:Tp;
% %x = A * sin(k*t + phi);
% x = A * exp(i * (k * t + phi - pi/2));
% Ek = 0.5 * K * A^2 * power(cos(k * t + phi),2);
% Ep = 0.5 * K * A^2 * power(sin(k * t + phi),2);
% E = Ek + Ep;
% plot(t,x);
% hold on;
% plot(t,Ek,'r');
% plot(t,Ep,'k');
% plot(t,E,'m');
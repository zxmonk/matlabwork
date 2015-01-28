clear all; %����ڴ�
clc; %����

Fs = 256; %����Ƶ��
Tp = 2; %��������ʱ��

%ԭʼ�ź�
f1 = 10; %Ƶ��1
f2 = 8; %Ƶ��2

t = 0:1/Fs:Tp; %����ʱ������
L = length(t);%��������
Lf = ceil(L/2);%����һ�룬��Ϊ�м�Ƶ
figure(1);
subplot(2,1,1);

y=sin(2*pi*f1*t)+cos(2*pi*f2*t);%+cos(2*pi*50*t); %ԭʼ�ź�
plot(t,y) ;%����ԭʼ�ź�

%fft�任
y_fft = fft(y); %���ٸ��ϱ任
f=Fs/2*linspace(0,1,Lf);%ȡƵ���������
subplot(2,1,2);
plot(f,abs(y_fft(1:Lf)));%����Ƶ�����ź�

% %������
% figure(2);
% z = sin(2*pi*t) * abs(y_fft(1));
% for i=2:1:Lf,
%     y1 = sin(2*pi*t*i) * abs(y_fft(i));
%     z = [z;y1];
% end
%     
%     
% wigb(z',0.1);
% %figure(3);
% %plot(sum(z));


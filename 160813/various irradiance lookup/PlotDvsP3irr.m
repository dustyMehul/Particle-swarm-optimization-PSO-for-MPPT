close all;
clear all;
clc;


table1000 = xlsread('lookup1000.xls');
table800 = xlsread('lookup800.xls');
table600 = xlsread('lookup600.xls');

plot(0,0,'c.');
hold;

for i=1:1000
    plot(i/1000,getPower(i/1000,table1000),'r*');
end

for i=1:1000
    plot(i/1000,getPower(i/1000,table800),'g*');
end

for i=1:1000
    plot(i/1000,getPower(i/1000,table600),'b*');
end

ylabel('Power');
xlabel('duty ratio')
%% Generating Lookup Table by varing V from 0.01 to 43.6 in steps of 0.01



%% Table for irradiance = 1000 W/(m*m)
table = zeros(4360,3);
for i=1:4360
    table(i,1) = i/100;
    table(i,2) = getIfromV(i/100, 1000);
    table(i,3) = table(i,1)/table(i,2);
end

xlswrite('lookup1000.xls',table);


%% Table for irradiance = 800 W/(m*m)
table = zeros(4360,3);
for i=1:4360
    table(i,1) = i/100;
    table(i,2) = getIfromV(i/100, 800);
    table(i,3) = table(i,1)/table(i,2);
end

xlswrite('lookup800.xls',table);


%% Table for irradiance = 600 W/(m*m)
table = zeros(4360,3);
for i=1:4360
    table(i,1) = i/100;
    table(i,2) = getIfromV(i/100, 600);
    table(i,3) = table(i,1)/table(i,2);
end

xlswrite('lookup600.xls',table);
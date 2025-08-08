clear clc

disp = dlmread('booster_dist-disp.rpt','',3)
dispfl = dlmread('booster_flange_dist-disp.rpt','',4)
x = disp(:,1)*10^3
y = disp(:,2)*10^6
xfl = disp(:,1)*10^3
yfl = disp(:,2)*10^6
figure('Name','Dist-Disp')
plot(x,y,'r-')
figure('Name','Flange_Dist-Disp')
plot(xfl,yfl,'r-')

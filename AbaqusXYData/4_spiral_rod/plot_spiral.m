% data1 = dlmread('spiralrod2_15_dist-axidisp.rpt','',3)
% data2 = dlmread('spiralrod2_15_dist-raddisp.rpt','',3)
% x1 = data1(:,1)*10^3
% y1 = data1(:,2)*10^6
% x2 = data2(:,1)*10^3
% y2 = data2(:,2)*10^6
% figure('Name','Dist-Disp')
% plot(x1,y1,'r-')
% hold on
% plot(x2,y2,'b-')
% set(gca,'xlim',[0,200])

disp1 = dlmread('spiralrod2_1_dist-disp.rpt','',4)
disp2 = dlmread('spiralrod2_2_dist-disp.rpt','',4)
disp3 = dlmread('spiralrod2_3_dist-disp.rpt','',4)
rad1 = dlmread('spiralrod2_1_dist-raddisp.rpt','',4)
rad2 = dlmread('spiralrod2_2_dist-raddisp.rpt','',4)
rad3 = dlmread('spiralrod2_3_dist-raddisp.rpt','',4)
xx1 = disp1(:,1)*10^3
yy1 = disp1(:,2)*10^6
xx2 = disp2(:,1)*10^3
yy2 = disp2(:,2)*10^6
xx3 = disp3(:,1)*10^3
yy3 = disp3(:,2)*10^6
xr1 = rad1(:,1)*10^3
yr1 = rad1(:,2)*10^6
xr2 = rad2(:,1)*10^3
yr2 = rad2(:,2)*10^6
xr3 = rad3(:,1)*10^3
yr3 = rad3(:,2)*10^6
figure('Name','Dist-Disp')
plot(xx1,yy1,'k-')
hold on
plot(xx2,yy2,'r-')
hold on
plot(xx3,yy3,'b-')
hold on
plot(xr1,yr1,'k--')
hold on
plot(xr2,yr2,'r--')
hold on
plot(xr3,yr3,'b--')

stress1 = dlmread('spiralrod2_1_dist-stress.rpt','',4)
stress2 = dlmread('spiralrod2_2_dist-stress.rpt','',4)
stress3 = dlmread('spiralrod2_3_dist-stress.rpt','',4)
x1 = stress1(:,1)*10^3
y1 = stress1(:,2)*10^(-6)
x2 = stress2(:,1)*10^3
y2 = stress2(:,2)*10^(-6)
x3 = stress3(:,1)*10^3
y3 = stress3(:,2)*10^(-6)
figure('Name','Dist-Stress')
plot(x1,y1,'k-')
hold on
plot(x2,y2,'r-')
hold on
plot(x3,y3,'b-')

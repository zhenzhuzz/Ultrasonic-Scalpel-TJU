clear clc

axi1 = dlmread('spiralrod1_2_dist-disp.rpt','',4)
axi2 = dlmread('spiralrod2_2_dist-disp.rpt','',4)
axi3 = dlmread('spiralrod3_2_dist-disp.rpt','',4)
rad1 = dlmread('spiralrod1_2_dist-raddisp.rpt','',4)
rad2 = dlmread('spiralrod2_2_dist-raddisp.rpt','',4)
rad3 = dlmread('spiralrod3_2_dist-raddisp.rpt','',4)
xa1 = axi1(:,1)*10^3
ya1 = axi1(:,2)*10^6
xa2 = axi2(:,1)*10^3
ya2 = axi2(:,2)*10^6
xa3 = axi3(:,1)*10^3
ya3 = axi3(:,2)*10^6
xr1 = rad1(:,1)*10^3
yr1 = rad1(:,2)*10^6
xr2 = rad2(:,1)*10^3
yr2 = rad2(:,2)*10^6
xr3 = rad3(:,1)*10^3
yr3 = rad3(:,2)*10^6
figure('Name','Dist-Disp')
plot(xa1,ya1,'k-')
hold on
plot(xa2,ya2,'r-')
hold on
plot(xa3,ya3,'b-')
hold on
plot(xr1,yr1,'k--')
hold on
plot(xr2,yr2,'r--')
hold on
plot(xr3,yr3,'b--')
set(gca,'xlim',[0,200])

stress1 = dlmread('spiralrod1_2_dist-stress.rpt','',4)
stress2 = dlmread('spiralrod2_2_dist-stress.rpt','',4)
stress3 = dlmread('spiralrod3_2_dist-stress.rpt','',4)
xs1 = stress1(:,1)*10^3
ys1 = stress1(:,2)*10^(-6)
xs2 = stress2(:,1)*10^3
ys2 = stress2(:,2)*10^(-6)
xs3 = stress3(:,1)*10^3
ys3 = stress3(:,2)*10^(-6)
figure('Name','Dist-Stress')
plot(xs1,ys1,'k-')
hold on
plot(xs2,ys2,'r-')
hold on
plot(xs3,ys3,'b-')
set(gca,'xlim',[0,200])

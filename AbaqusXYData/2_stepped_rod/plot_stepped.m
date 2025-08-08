clear
% figure('Name','Dist-Disp')
% DD = dlmread('Dist-Disp-stepped.rpt','',3)
% x1 = DD(:,1)*10^3
% y1 = DD(:,2)*10^6
% plot(x1,y1,'r-')
% xlabel('轴向距离(mm)')
% ylabel('振幅(μm)')
% 
figure('Name','Dist-Stress')
DS = dlmread('steppedrod_dist-stress.rpt','',3)
x2 = DS(:,1)*10^3
y2 = DS(:,2)*10^(-6)
plot(x2,y2,'r-')
xlabel('轴向距离(mm)')
ylabel('应力(MPa)')
set(gca,'xlim',[0,200])

% readtip = dlmread('steppedrod_tip.rpt','',3)
% readtop = dlmread('steppedrod_top.rpt','',3)
% tip = readtip(1,2)
% top = readtop(1,2)
% M_stepped = tip/top

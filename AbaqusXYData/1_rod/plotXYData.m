clear
figure('Name','Dist-Disp')
DD = dlmread('Dist-Disp.rpt','',3)
x1 = DD(:,1)*10^3
y1 = DD(:,2)*10^6
plot(x1,y1,'r-')
xlabel('轴向距离(mm)')
ylabel('振幅(μm)')

figure('Name','Dist-Stress')
DS = dlmread('Dist-Stress.rpt','',3)
x2 = DS(:,1)*10^3
y2 = DS(:,2)*10^(-6)
plot(x2,y2,'r-')
xlabel('轴向距离(mm)')
ylabel('应力(MPa)')
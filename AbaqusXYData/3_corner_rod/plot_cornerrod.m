clear
% figure('Name','Dist-Disp')
% DD = dlmread('cornerrod_dist-disp.rpt','',3)
% x1 = DD(:,1)*10^3
% y1 = DD(:,2)*10^6
% plot(x1,y1,'r-')
% xlabel('轴向距离(mm)')
% ylabel('振幅(μm)')

% file = dir('*.rpt')
% for i = 1:25
%     data(i,1) = file(i),name
% end
% data = char(file(3).name)
% data1 = dlmread(file(3).name,'',4)
%     for k=1:length('name')
%         data(k,:) = EEG.('name'(k,1)); 
%     end
% data = zeros[100,4]
% data(:,1) = 

data0 = dlmread('cornerrod0_dist-stress.rpt','',4)
data12 = dlmread('cornerrod12_dist-stress.rpt','',4)
data24 = dlmread('cornerrod24_dist-stress.rpt','',4)
data36 = dlmread('cornerrod36_dist-stress.rpt','',4)

x0 = data0(:,1)*10^3
y0 = data0(:,2)*10^(-6)
x12 = data12(:,1)*10^3
y12 = data12(:,2)*10^(-6)
x24 = data24(:,1)*10^3
y24 = data24(:,2)*10^(-6)
x36 = data36(:,1)*10^3
y36 = data36(:,2)*10^(-6)

figure('Name','Dist-Stress')
plot(x0,y0,'m-')
hold on
plot(x12,y12,'b-')
hold on
plot(x24,y24,'g-')
hold on
plot(x36,y36,'r-')

% xlabel('轴向距离(mm)')
% ylabel('应力(MPa)')
set(gca,'xlim',[0,200])
% legend('\itR0','\itR12','\itR24','\itR36')

readtip0 = dlmread('cornerrod0_tip.rpt','',3)
readtip12 = dlmread('cornerrod12_tip.rpt','',3)
readtip24 = dlmread('cornerrod24_tip.rpt','',3)
readtip36 = dlmread('cornerrod36_tip.rpt','',3)

readtop0 = dlmread('cornerrod0_top.rpt','',3)
readtop12 = dlmread('cornerrod12_top.rpt','',3)
readtop24 = dlmread('cornerrod24_top.rpt','',3)
readtop36 = dlmread('cornerrod36_top.rpt','',3)

tip0 = readtip0(1,2)
tip12 = readtip12(1,2)
tip24 = readtip24(1,2)
tip36 = readtip36(1,2)

top0 = readtop0(1,2)
top12 = readtop12(1,2)
top24 = readtop24(1,2)
top36 = readtop36(1,2)

M_corner0 = tip0/top0
M_corner12 = tip12/top12
M_corner24 = tip24/top24
M_corner36 = tip36/top36

x = [0,12,24,36]
y = [M_corner0,M_corner12,M_corner24,M_corner36]
figure('Name','R-M')
plot(x,y,'r-o')
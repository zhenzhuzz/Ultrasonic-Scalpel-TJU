f = 25e+03 %换能器设计工作频率，25kHz
w = 2*pi*f %设计工作圆频率

% %压电陶瓷片性能参数
% % DW-P81-Ф35*15*5
rou = 7.6e+03 %压电陶瓷片密度, kg/m^3, PZT-8
sE33 = 13.9e-12 %z方向恒电场弹性柔顺系数, m^2*N^-1
cE33 = 13.2e+10 %z方向恒电场弹性劲度系数, N/m^2

ce = sqrt(cE33/rou) %压电陶瓷晶堆等效声速, m/s
ke = w/ce %压电陶瓷晶堆等效波数
lambdae = ce/f %压电陶瓷晶堆等效声波波长, m

D = 0.035 %压电陶瓷外径, m
d = 0.015 %压电陶瓷内径, m
S = pi*(D^2-d^2)/4 %压电陶瓷片面积, m^2
z = rou*ce*S %压电陶瓷晶堆波阻抗


%后盖板性能参数
rou1 = 7.8e+03 %后盖板密度,kg/m^3,45#钢
E1 = 20e+10 %后盖板弹性模量, Pa
c1 = sqrt(E1/rou1) %后盖板声速, m/s
k1 = w/c1 %后盖板波数
lambda1 = c1/f %后盖板声波波长, m/s

D1 = D %直径, m
S1 = pi*(D1^2)/4 %截面积, m^2
z1 = rou1*c1*S1 %后盖板波阻抗

%前盖板性能参数
rou2 = 4.5e+03 %前盖板密度,kg/m^3,TC4
E2 = 1.08e+11 %前盖板弹性模量, Pa
c2 = sqrt(E2/rou2) %前盖板声速, m/s
k2 = w/c2 %前盖板波数
lambda2 = c2/f %前盖板声波波长 m/s

z2 = rou2*c2*S1 %前盖板波阻抗

%圆锥段变幅杆性能参数
rou3 = rou2
E3 = E2
c3 = c2
k3 = k2
lambda3 = lambda2
% 用F表示
% F = -1.5
% D2 = D1/F + D1
% S2 = S1*((F+1)/F)^2 %辐射面面积用F表示
% % 用D2表示
% D2 = 0.01
% S2 = pi*D2^2/4 %辐射面面积
% F = D1/(D2-D1) %延展系数


%圆柱段变幅杆性能参数
rou4 = rou3
E4 = E3
c4 = c3
k4 = k3
lambda4 = lambda3

lambda =[lambdae, lambda1, lambda2] 
Dmax = min(lambda)/4 %压电陶瓷外径小于最小波长的四分之一

% % 频率方程设计几何尺寸
lc1 = 2*5e-03 %压电陶瓷片厚度
lc2 = 2*5e-03 %压电陶瓷片厚度
lc = lc1 + lc2 %压电陶瓷晶堆总厚度
p = 2 %节面一侧压电晶堆的陶瓷片数

syms l1_x
syms l2_x
% %后盖板输入阻抗
% Zm1 = rou1*c1*S1*tan(k1*l1_x)
% %前盖板输入阻抗
% Zm2 = rou2*c2*S1*tan(k2*l2_x)
% 
% %换能器左右节面频率方程，求l1、l2
% %节面左侧四分之一波长振子
% vbrL = tan(ke*lc1) == (rou*ce*S)/Zm1
% %求解析解l1
% sol1 = solve(vbrL,l1_x)
% l1_x = eval(sol1)
% %节面右侧四分之一波长振子
% vbrR = tan(ke*lc2) == (rou*ce*S)/Zm2
% sol2 = solve(vbrR,l2_x)
% l2_x = eval(sol2)

% % 优化换能器，以振速比为目标函数，改变l2求振速比KG最大值
% % 振速比KG的原始公式
% % KG = cos(k1*l1)/cos(k2*l2)...
% %     *(rou*ce*S*tan(p*ke*lc/2)+rou1*c1*S1*tan(k1*l1))...
% %     /(rou*ce*S*tan(p*ke*lc/2)+rou2*c2*S1*tan(k2*l2))
% l1 = 0.01:0.005:0.06
% l2 = ones(length(l1))
% KG = ones(length(l1))
% for i = 1:length(l1)
%     Zm2 = rou2*c2*S1*tan(k2*l2_x)
%     vbrR = tan(ke*lc2) == (rou*ce*S)/Zm2
%     l2(i) = vpasolve(vbrR,l2_x,[0.01,0.06])
%     KG(i) = cos(k1*l1(i))/cos(k2*l2(i))...
%     *(rou*ce*S*tan(p*ke*lc/2)+rou1*c1*S1*tan(k1*l1(i)))...
%     /(rou*ce*S*tan(p*ke*lc/2)+rou2*c2*S1*tan(k2*l2(i)))
% end
% 
% figure(1)
% x = l2
% y = KG
% plot(x,y,'k-o')
% xlabel('前盖板长l2')
% ylabel('振速比KG')

%优化变幅杆，以放大系数Mp为目标函数
syms l4_x
F = -1.4:-0.1:-1.9%用i表示数组下标
l3 = 0.01:0.01:0.1 %用j表示下标
D2 = ones(length(F))
S2 = ones(length(F))
l4 = ones(length(F),length(l3))
l34 = ones(length(F),length(l3))
Mp = ones(length(F),length(l3))
for i = 1:length(F)
    S2(i) = S1*((F(i)+1)/F(i))^2 %辐射面面积用F表示
    D2(i) = D1/F(i) + D1
    for j = 1:length(l3)
        %变幅杆频率方程，给定l3，求l4
        rod = rou3*c3*S2(i)*(1/(sin(k3*l3(j)))^2/((sqrt(S2(i)/S1)-1)/(k3*l3(j))+cot(k3*l3(j)))...
            -(sqrt(S1/S2(i))-1)/(k3*l3(j))-cot(k3*l3(j)))...
            +rou4*c4*S2(i)*tan(k4*l4_x)== 0
        l4(i,j) = vpasolve(rod,l4_x,[0,0.1])
        l34(i,j) = l3(j)+l4(i,j)
        Mp(i,j) = abs(rou4*c4*S2(i)/sin(k4*l4(i,j))...
        *(rou3*c3*S1/(k3*l3(j)*F(i))+rou3*c3*S1*cot(k3*l3(j)))...
        /(rou3*c3*sqrt(S1*S2(i))/sin(k3*l3(j))...
        *(rou4*c4*S2(i)/sin(k4*l4(i,j))-rou4*c4*S2(i)*tan(k4*l4(i,j)/2))))
    end
end

figure(2)
hold on
xx = l3
yy1 = l34(1,:)
plot(xx,yy1,'k-x')
yy2 = l34(2,:)
plot(xx,yy2,'k-s')
yy3 = l34(3,:)
plot(xx,yy3,'k-d')
yy4 = l34(4,:)
plot(xx,yy4,'k-^')
yy5 = l34(5,:)
plot(xx,yy5,'k-p')
xlabel('变幅杆圆锥段长度l3')
ylabel('变幅杆总长度l3+l4')

figure(3)
set(gca,'xlim',[0.01,0.1])
hold on
xx = l3
yyy1 = Mp(1,:)
plot(xx,yyy1,'k-o')
yyy2 = Mp(2,:)
plot(xx,yyy2,'b-o')
yyy3 = Mp(3,:)
plot(xx,yyy3,'c-o')
yyy4 = Mp(4,:)
plot(xx,yyy4,'m-o')
yyy5 = Mp(5,:)
plot(xx,yyy5,'r-o')
yyy6 = Mp(6,:)
plot(xx,yyy6,'g-o')
legend('\itF=-1.4','\itF=-1.5','\itF=-1.6','\itF=-1.7','\itF=-1.8','\itF=-1.9')
xlabel('变幅杆圆锥段长度l3')
ylabel('放大系数Mp')

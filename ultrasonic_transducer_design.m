clear all
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
d1 = 0.012 %后盖板内径，也是预紧螺栓外径，m
S1 = pi*(D1^2-d1^2)/4 %截面积, m^2
z1 = rou1*c1*S1 %后盖板波阻抗

%前盖板性能参数
rou2 = 4.5e+03 %前盖板密度,kg/m^3,TC4
E2 = 1.08e+11 %前盖板弹性模量, Pa
c2 = sqrt(E2/rou2) %前盖板声速, m/s
k2 = w/c2 %前盖板波数
lambda2 = c2/f %前盖板声波波长 m/s

S2 = pi*(D1^2)/4 %前盖板截面积, m^2
z2 = rou2*c2*S2 %前盖板波阻抗

%圆锥段变幅杆性能参数
rou3 = rou2
E3 = E2
c3 = c2
k3 = k2
lambda3 = lambda2
% 用F表示
F = -1.8
D2 = D1/F + D1
S3 = S2*((F+1)/F)^2 %辐射面面积用F表示
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

% % 下面利用各部分的频率方程求解后盖板长度l1、前盖板l2、圆柱段l4
% % 初始给定圆柱段变幅杆长度l3
syms l1
syms l2
syms l4

%后盖板输入阻抗
Zm1 = rou1*c1*S1*tan(k1*l1)
%前盖板输入阻抗
Zm2 = rou2*c2*S2*tan(k2*l2)

%换能器左右节面频率方程，求l1、l2
%节面左侧四分之一波长振子
vbrL = tan(ke*lc1) == (rou*ce*S)/Zm1
%求解析解l1
l1 = solve(vbrL,l1)
l1 = eval(l1)
%节面右侧四分之一波长振子
vbrR = tan(ke*lc2) == (rou*ce*S)/Zm2
l2 = solve(vbrR,l2)
l2 = eval(l2)

%变幅杆频率方程，求l3、l4
l3 = 0.06
%后盖板等效阻抗
Zb1 = rou1*c1*S1*tan(k1*l1/2)
Zb2 = Zb1
Zb3 = -rou1*c1*S1/sin(k1*l1)
%压电陶瓷晶堆等效阻抗
Z1p = rou*ce*S*tan(p*ke*lc/2)
Z2p = -rou*ce*S/sin(p*ke*lc)
%前盖板等效阻抗
Zf1 = rou2*c2*S2*tan(k2*l2/2)
Zf2 = Zf1
Zf3 = -rou2*c2*S2/sin(k2*l2)
%圆锥段变幅杆等效阻抗
Zco1 = -(rou3*c3*S2/k3/l3)*(1/F)-rou3*c3*S2*cot(k3*l3)+(rou3*c3*sqrt(S2*S3)/sin(k3*l3))
Zco2 = -(rou3*c3*S3/k3/l3)*(-1/(F+1))-rou3*c3*S3*cot(k3*l3)+(rou3*c3*sqrt(S2*S3)/sin(k3*l3))
Zco3 = -(rou3*c3*sqrt(S2*S3)/sin(k3*l3))
%圆柱段变幅杆等效阻抗
Zcy1 = rou4*c4*S3*tan(k4*l4/2)
Zcy2 = Zcy1
Zcy3 = -rou4*c4*S3/sin(k4*l4)

%变幅杆频率方程，给定l3，求l4
rod = rou3*c3*S3*(1/(sin(k3*l3))^2/((sqrt(S3/S2)-1)/(k3*l3)+cot(k3*l3))...
            -(sqrt(S2/S3)-1)/(k3*l3)-cot(k3*l3))...
            +rou4*c4*S3*tan(k4*l4)== 0
% rod = -(Zco3^2/(Zco1+Zco3))+Zco3+Zco2+Zcy1+Zcy3-(Zcy3^2/(Zcy3+Zcy2)) == 0
sol4 = vpasolve(rod,l4,[0,0.1])
l4 = eval(sol4)

%优化指标
%振速比KG
KG = cos(k1*l1)/cos(k2*l2)...
    *(rou*ce*S*tan(p*ke*lc/2)+rou1*c1*S2*tan(k1*l1))...
    /(rou*ce*S*tan(p*ke*lc/2)+rou2*c2*S2*tan(k2*l2))

% %放大系数
% Mp = eval(abs(Zcy3*(Zco1+Zco3)/(Zco3*(Zcy2+Zcy3))))
Mp = abs(rou4*c4*S3/sin(k4*l4)...
    *(rou3*c3*S2/(k3*l3*F)+rou3*c3*S2*cot(k3*l3))...
    /(rou3*c3*sqrt(S2*S3)/sin(k3*l3)...
    *(rou4*c4*S3/sin(k4*l4)-rou4*c4*S3*tan(k4*l4/2))))
% %变幅杆优化，以放大系数为目标函数，见iteration.m

syms x0
eqnx0 = k3*x0 == pi/2-atan(F/k3)
solx0 = solve(eqnx0,x0)
x0 = eval(solx0)







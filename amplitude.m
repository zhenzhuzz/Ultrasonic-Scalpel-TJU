clear all

Mp1 = abs(2.88527/1.76432)
Mp2 = abs(6.19185/-1.88249)
Mp3 = abs(-12.2401/-3.13638)
Mp0 = abs(-10.0322/0.590182)
Mpr = abs(-0.0643955/-0.00223455)
Mpflange = abs(9.2341/-0.530935)

rou5 = 4.5e+03
E5 = 1.08e+11
kexi1 = 8e-6
kexi2 = kexi1*Mp1
kexi3 = kexi2*Mp2
kexi0_1 = kexi3*Mp3
kexi0_2 = kexi1*Mp0
f = 25000
D1 = 35e-03
D2 = 15e-03
d1 = 12e-03

F1 = 1/2*sqrt(rou5*E5)*kexi1*f*pi^2*(D1^2-d1^2)
F2 = 1/2*sqrt(rou5*E5)*kexi2*f*pi^2*D1^2
F3 = 1/2*sqrt(rou5*E5)*kexi3*f*pi^2*D2^2

top = 10e-6 %压电陶瓷片振幅
tip1 = top*Mp1 %换能器末端振幅
tip2 = tip1*Mp2 %变幅杆末端振幅
tip3 = tip2*Mp3 %刀杆末端振幅


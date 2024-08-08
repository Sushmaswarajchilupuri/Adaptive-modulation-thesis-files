clear all;% (*Transmission distances *)
close all
clc
msr_1=1;
mrd_1=1;
msd_1=1;

msr_2=2;
mrd_2=2;
msd_2=2;

msr_3=3;
mrd_2=3;
msd_2=3;

dsr=0.6;
drd=0.6;
dsd=1;

Omegasr=dsr^(-n);
Omegard=drd^(-n);
Omegasd=dsd^(-n);


%Omegasr=0.38
%Omegasd=0.59
%Omegard=0.42
P2db=[0:1:20];
P1db=[0:1:20];

V=5;
gammaTth = [-1.533 1.049 3.972 7.702 10.249];

av = [274.72 90.25 67.61 50.12 53.39];

gv = [7.99 3.49 1.68 0.66 0.37];


gamdbTh = -1.553;
NOL=10^6;
N0 = 1;


[OP_1,PER_1]= OP_PER(msr_1,mrd_1,msd_1,Omegasr,Omegard,Omegasd,N0,gammaTth,P1db,P2db,NOL,av,gv);

[OP_2,PER_2]= OP_PER(msr_2,mrd_2,msd_2,Omegasr,Omegard,Omegasd,N0,gammaTth,P1db,P2db,NOL,av,gv);

[OP_3,PER_3]= OP_PER(msr_3,mrd_3,msd_3,Omegasr,Omegard,Omegasd,N0,gammaTth,P1db,P2db,NOL,av,gv);

figure(1)
semilogy(P1db,OP_1,'r-^');
hold on
semilogy(P1db,OP_2,'k-^');
hold on
semilogy(P1db,OP_3,'b-^');
legend({'m=1', 'm=2', 'm=3'},'Location','southeast')
xlabel('Transmit SNR (dB)')
ylabel('Outage Probability')

figure(2)
semilogy(P1db,PER_1,'r-^');
hold on
semilogy(P1db,PER_2,'k-^');
hold on
semilogy(P1db,PER_3,'b-^');
legend({'m=1', 'm=2', 'm=3'},'Location','southeast')
xlabel('Transmit SNR (dB)')
ylabel('Packet Error Rate')


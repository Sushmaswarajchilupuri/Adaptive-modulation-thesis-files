clear all;% (*Transmission distance *)
close all
clc
msr=2;
mrd=2;
msd=2;
n_1=2;
n_2=3.4;
n_3=5;

dsr=0.6;
drd=0.6;
dsd=1;

Omegasr_1=dsr^(-(n_1));
Omegard_1=drd^(-(n_1));
Omegasd_1=dsd^(-(n_1));

Omegasr_2=dsr^(-(n_2));
Omegard_2=drd^(-(n_2));
Omegasd_2=dsd^(-(n_2));

Omegasr_3=dsr^(-(n_3));
Omegard_3=drd^(-(n_3));
Omegasd_3=dsd^(-(n_3));

%Omegasr=0.38
%Omegasd=0.59
%Omegard=0.42
P1db=[0:1:20];
P2db=[0:1:20];

V=5;
gammaTth = [-1.533 1.049 3.972 7.702 10.249];

av = [274.72 90.25 67.61 50.12 53.39];

gv = [7.99 3.49 1.68 0.66 0.37];


gamdbTh = -1.553;
NOL=10^6;
N0 = 1;


[OP_1,PER_1]= OP_PER(msr,mrd,msd,Omegasr_1,Omegard_1,Omegasd_1,N0,gammaTth,P1db,P2db,NOL,av,gv);

[OP_2,PER_2]= OP_PER(msr,mrd,msd,Omegasr_2,Omegard_2,Omegasd_2,N0,gammaTth,P1db,P2db,NOL,av,gv);

[OP_3,PER_3]= OP_PER(msr,mrd,msd,Omegasr_3,Omegard_3,Omegasd_3,N0,gammaTth,P1db,P2db,NOL,av,gv);

figure(1)
semilogy(P1db,OP_1,'r-^');
axis([0 20 10^-5 1])
hold on
semilogy(P1db,OP_2,'k-^');
axis([0 20 10^-5 1])
hold on
semilogy(P1db,OP_3,'b-^');
axis([0 20 10^-5 1])
legend({'n=2 for free space','n=3.4 for urban','n=5 for suburban'},'Location','northeast')
xlabel('Transmit SNR')
ylabel('Outage Probability')

figure(2)
semilogy(P1db,PER_1,'r-^');
axis([0 20 10^-6 1])
hold on
semilogy(P1db,PER_2,'k-^');
axis([0 20 10^-6 1])
hold on
semilogy(P1db,PER_3,'b-^');
axis([0 20 10^-6 1])
legend({'n=2 for free space','n=3.4 for urban','n=5 for suburban'},'Location','southeast')
xlabel('Transmit SNR')
ylabel('Packet Error Rate')


function [sys,x0,str,ts]=SPWM(t,x,u,flag)
m=21;          % Indice de modulation 
r=0.8;         % Coefficient de réglage  
E=600;         % Tension de la source continue
fr=50;         % Fréquence de de la référence
fp=m*fr;       % Fréquence de la porteuse 
Vpm=E/2;       % Amplitude de la porteuse
Vrm=r*Vpm;     % Amplitude de la référence
wr=2*pi*fr;
Ts=1e-6;
if flag==0
sys=[0,0,3,0,0,1,1];
x0=[];
str=[];
ts=[Ts 0];  
elseif flag==3
va_ref=Vrm*sin(wr*t);
vb_ref=Vrm*sin(wr*t-2*pi/3);
vc_ref=Vrm*sin(wr*t+2*pi/3);
vp=-2*Vpm*asin(cos(2*pi*fp*t))/pi;
%plot(t,vp);
% Premier bras  
if va_ref > vp,  Sa1=1; else  Sa1=0;  end    
% Deuxième bras
if vb_ref > vp,  Sb1=1; else  Sb1=0;  end 
% Troisième bras   
if vc_ref > vp,  Sc1=1; else  Sc1=0;  end  
sys=[Sa1;Sb1;Sc1];
else
 sys=[];
 
end

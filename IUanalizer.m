function [Pmpp,Umpp,Impp,Eff,Isc,Voc,FF ] = IUanalizer(P, U, I, G, n, T, Iph, I0)
% Sebastian Pinilla 
[Pmpp, Umpp] = findpeaks(P,U); % findpeaks obtain the maximum value of the 
% Power and its value of voltage. 
Impp = Pmpp/Umpp;
Eff = 100 * Pmpp/G;
Isc = max(I); % max to obtain the maximum value of I. 
Voc = (n*T*(8.617e-5))*log((Iph/I0)+1);
FF = Pmpp/(Isc*Voc);

end 
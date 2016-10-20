function I = VIcurve(V) %% function returns the value of I... for a given Value of V Based on the calculation

%Inputs
irradiance=1000;
temperature=25;

%PV Panel: MTS180M-24V
Rs=0.0; %calculated based on the datasheet
Voc=43.64;
Isc=5.45;
Vmp=36.36;
Imp=4.95;
temperatureref=25;
irradianceref=1000;
coefP=-0.47;
coefVoc=-0.38;
coefIsc=0.1;

%Init
Vmax=0;
Imax=0;
Pmax=0;
a=coefIsc*Isc/100;
b=-coefVoc*Voc/100;

C2=(Vmp/Voc-1)/log(1-Imp/Isc);
    C1=(1-Imp/Isc)*exp(-Vmp/(C2*Voc));
    D1=a*irradiance/irradianceref*(temperature-temperatureref)+Isc*(irradiance/irradianceref-1);
    Vmax1=C2*Voc*log((1-(0-D1)/Isc)/C1+1)-b*(temperature-temperatureref)-Rs*D1;
    Vrmax=0+b*(temperature-temperatureref)+Rs*D1;
    Imax1=Isc*(1-C1*(exp(Vrmax/(C2*Voc))-1))+D1;
    Pmax1=Vmax1*Imax1*0.9;
    if Vmax1>Vmax Vmax=Vmax1; end
    if Imax1>Imax Imax=Imax1; end
    if Pmax1>Pmax Pmax=Pmax1; end
    
    Vr=V+b*(temperature-temperatureref)+Rs*D1;
    I=Isc*(1-C1*(exp(Vr/(C2*Voc))-1))+D1;

end
function Power = getPower(d,Table)
if (d>=1)
    Power =0;
else

Rload = 5000;
Reff = Rload*(1-d)^2;

len = length(Table);
i=len;
while(i>1 && Table(i,3)>Reff)
    i=i-1;
end

if(i<1)
    i=1;
end

Vd = Table(i,1);
Id = Table(i,2);

Power = Vd*Id;
end
end
function test(R)

I0=0

for i=1:10
    Vr=getVR(I0,R);
    I=getI(Vr);
    I0=I
    V=I0*R
end
I0;
V=I0*R;
end
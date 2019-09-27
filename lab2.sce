function [p,err]=approx(f,G,Z,p0)
    [p,err]=datafit(G,Z,p0)
    xgrid;
    xlabel('x');
    ylabel('y');
    scatter(X,Y);
    x = -5:0.1:10;
    plot2d(x,f(x,p),12);
endfunction

X = [1.28,2.00,2.91,4.07,5.00,6.00,7.01,7.89];
Y = [2.36,3.15,3.55,4.00,4.41,5.08,5.49,6.12];
Z = [X;Y];

scf();clf();
p0=[1;1;1;1;1];
//f1 
function y=f1(x,p)
    a = p(1);b = p(2);
    y = a*x + b;
endfunction

function e=G1(p, z)
    e=sum((z(2)-f1(z(1),p))^2);
endfunction

// f2
function y=f2(x,p)
    a = p(1);b = p(2);c = p(3);
    y = a*x^2 + b*x + c;
endfunction

function e=G2(p, z)
    e=sum((z(2)-f2(z(1),p))^2);
endfunction


// f3
function y=f3(x,p)
    a = p(1);b = p(2);c = p(3);d = p(4);
    y = a*x^3 + b*x^2 + c*x + d;
endfunction
function e=G3(p, z)
    e=sum((z(2)-f3(z(1),p))^2);
endfunction

// f4
function y=f4(x,p)
    alp = p(1);bt = p(2);a = p(3);b = p(4);c = p(5);
    y = alp*exp(a*x) + bt*exp(b*x) + c;
endfunction

function e=G4(p, z)
    e=sum((z(2)-f4(z(1),p))^2);
endfunction


subplot(2,2,1);
approx(f1,G1,Z,p0);
subplot(2,2,2);
approx(f2,G2,Z,p0);
subplot(2,2,3);
approx(f3,G3,Z,p0);
subplot(2,2,4);
[p,err]=approx(f4,G4,Z,p0);

// ex2

X = [1 2 3 4];
Y = X^2 + 25*X - exp(X);
Z = [X;Y];

p0=[1;1;1;1;1];

scf();clf();

subplot(2,2,1);
approx(f1,G1,Z,p0);
subplot(2,2,2);
approx(f2,G2,Z,p0);
subplot(2,2,3);
approx(f3,G3,Z,p0)
subplot(2,2,4);
approx(f4,G4,Z,p0);

//ex3
c(1) = Y(1)
for i=1:3
    temp1 = 1;
    temp2 = 0;
    for j = 1:i
        temp2 = temp2 + temp1*c(j);
        temp1 = temp1*(X(i+1)-X(j));
    end
    c(i+1) = Y(i+1) - temp2/temp1;
end
c

scf();clf();
xgrid;
scatter(X,Y);
x = -5:0.1:10;
plot2d(x,f3(x,c),12);


//Функция, описывающая систему дифференциальных уравнений 
function dx=syst(t,x) 
    dx=zeros(2,1); 
    // нулевой вектор-столбец размерности 2 
    dx(1)=cos(x(1)*x(2)); 
    dx(2)=sin(x(1)+x(2)*t); 
endfunction 
//Решение системы дифференциальных уравнений 
x0=[0;0];
t0=0;
t=0:0.1:10;
x=ode(x0,t0,t,syst); 
//Формирование графического решения 
xset("window",1) // создание (или активация, если уже есть) графического окна с номером 1 
plot(t,x) // графики x1(t) и x2(t) 
xset("window",2) 
plot(x(1,:),x(2,:))  // фазовая траектория в пространстве (x1,x2)

//ex1

function dx=ex1(t,x,a,b,c,d) 
    dx=zeros(2,1); 
    
    dx(1)=a*x(1)-b*x(1)*x(2); 
    dx(2)=c*x(2)-d*x(1)*x(2); 
endfunction 
function dx=ex11(t,x,a1,a2,b1,b2,q1,q2,m) 
    dx=zeros(2,1); 
    
    dx(1)=a1/(b1+x(2)^m) - q1*x(1); 
    dx(2)=a2/(b2+x(1)^m) - q2*x(2);
endfunction 
x0=[1;1];
t0=0;
t=0:0.1:10;
a = 10;b = 1; c = 10; d = 1;
a1 = 1; a2 = 1; b1 = 1; b2 = 1; m =2;q1 = -1; q2 = -1;
//x = ode(x0,t0,t,list(ex1,a,b,c,d))
x = ode(x0,t0,t,list(ex11,a1,a2,b1,b2,q1,q2,m))
scf();
plot(t,x)
scf();
plot(x(1,:),x(2,:))

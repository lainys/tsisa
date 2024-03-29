a = 0.5,b = 0.001,c = 0.5, d = 0.001;
//a = 1, b = 1, c = 1, d = 1;

function dx=fun1(t,x) 
    dx=zeros(2,1); 
    
    dx(1)=a*x(1)-b*x(1)*x(2);
    dx(2)=c*x(2)-d*x(1)*x(2); 
endfunction 

function dx=fun2(t,x) 
    dx=zeros(2,1); 
    
    dx(1)=a*x(1)-b*x(1)*x(2);
    dx(2)=c*x(1)*x(2)-d*x(2); 
endfunction 
//Решение системы дифференциальных уравнений 
x0=[2;1];
t0=0;
t=linspace(0,15,200);
x=ode(x0,t0,t,fun2); 
//Формирование графического решения 
xset("window",1) // создание (или активация, если уже есть) графического окна с номером 1 
plot(t,x) // графики x1(t) и x2(t) 
xset("window",2) 
plot(x(1,:),x(2,:))  // фазовая траектория в пространстве (x1,x2)


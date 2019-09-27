// 1. Построить график правой части уравнения, соответствующего номеру варианта. Локализовать корень (корни) уравнени
function y = f(x)
    y = 1.2*x^2 - sin(10*x);
endfunction
x = linspace(-100,100,1000);
scf();
set(gca(),"auto_clear","off")

xgrid;
plot(x,f(x))
xr = fsolve(1, f);
plot(xr,f(xr),'ro')
xlabel('x');
ylabel('y');
title('y = 1.2*x^2 - sin(10*x)');
// 2. Найти с заданной пользователем точностью корень заданного уравнения, используя стандартные функции Scilab. 
e = 1e-2

xr = fsolve(1,f,tol=e)
// 3. Написать скрипт, по заданному N рассчитывающий: 
//— N случайных значений ui, распределённых нормально с нулевым матожиданием и дисперсией 1; 
function y = f_def(N)
    y = grand(1,N,"def");
endfunction
//— N случайных значений gi, распределённых равномерно с нулевым матожиданием и дисперсией 1. и строящий гистограммы распределения ui и gi. 
function y = f_norm(N)
    y = grand(1, N, "nor", 0, 1);
endfunction
//4. Выполнить расчёт и построение гистограмм для N = 10, 100, 1000, 10000 (для каждого N повторить не менее 4 раз). 

for i = 1:5 
    N = 10^i;
    f = scf();
    f.figure_name = msprintf('Равномерное. N = %d',N);
    for sub_ind=1:4
        subplot(2,2,sub_ind);
        xgrid;
        y = f_def(N)
        histplot(10,y); 
        xlabel('x');
        ylabel('n');
    end
end


for i = 1:5 
    N = 10^i;
    f = scf();
    f.figure_name = msprintf('Нормальное. N = %d',N);
    for sub_ind=1:4
        subplot(2,2,sub_ind);
        xgrid;
        y = f_norm(N)
        histplot(10,y); 
        xlabel('x');
        ylabel('n');
    end
end

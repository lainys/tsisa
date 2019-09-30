function Res = min_bd_rastrigin() 
    Res = [-1 -1]'; 
endfunction 

function Res = max_bd_rastrigin() 
    Res = [1 1]'; 
endfunction 

function Res = opti_rastrigin() 
    Res = [0 0]';
endfunction 

function y = rastrigin(x) 
    if ()(x(1)==x(2) || x(2)==x(3) || x(3)==x(1)) then
    end
    y = x(1)^2+x(2)^2-cos(12*x(1))-cos(18*x(2)); 
endfunction 

func = 'rastrigin'; 
PopSize = 100; 
Proba_cross = 0.7;
Proba_mut = 0.1; 
NbGen = 10; 
NbCouples = 110; 
Log = %T; 
nb_disp = 10; 
pressure = 0.05;

ga_params = init_param(); 
// Параметры для задания области оптимизации 
ga_params = add_param(ga_params, 'minbound', min_bd_rastrigin()); 
ga_params = add_param(ga_params, 'maxbound', max_bd_rastrigin()); 
ga_params = add_param(ga_params, 'dimension', 2); 
ga_params = add_param(ga_params, 'beta', 0); 
ga_params = add_param(ga_params, 'delta', 0.1); 
// Параметры для настройки работы генетического алгоритма 
ga_params = add_param(ga_params, 'init_func', init_ga_default); 
ga_params = add_param(ga_params, 'crossover_func', crossover_ga_default); 
ga_params = add_param(ga_params, 'mutation_func', mutation_ga_default); 
ga_params = add_param(ga_params, 'codage_func', coding_ga_identity);

[pop_opt, fobj_pop_opt, pop_init,fobj_pop_init]= optim_ga(f, PopSize, NbGen, Proba_mut, Proba_cross, Log, ga_params);


printf('Genetic Algorithm: %d points from pop_opt\n', nb_disp); 
for i= 1:nb_disp 
    printf('Individual %d: x(1) = %f x(2) = %f −> f = %f\n', i, pop_opt(i)(1), pop_opt(i)(2), fobj_pop_opt(i)); 
end 

t=linspace(-1,1,100);
function z=my_surface(x, y)
    z = x^2+y^2-cos(12*x)-cos(18*y); 
endfunction
xset("fpf"," ")
clf()
contour(t,t,my_surface,10)

printf('Genetic Algorithm: %d points from pop_opt\n', nb_disp); 
for i= 1:nb_disp 
    plot(pop_opt(i)(1), pop_opt(i)(2),'.g')
end 
for i= 1:nb_disp 
    plot(pop_init(i)(1), pop_init(i)(2),'.r')
end 

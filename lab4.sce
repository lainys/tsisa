max_a = 9999;
t = [
    [5,7,max_a];
    [max_a,4,9];
    [10,max_a,12];
    [14,max_a,max_a];
    [max_a,8,max_a];
    [max_a,max_a,9];
    [7,8,12];
    [15,max_a,max_a];
    [7,5,max_a];
    [11,max_a,19]
    ]
function y = func(x)
    a=round(x(1)),b=round(x(2)),c=round(x(3));
    if (a~=b && b~=c && c~=a) then
        y = t(a,1) + t(b,2) + t(c,3);
    else
        y = max_a;
    end
endfunction 

function Res = min_bd() 
    Res = [1 1 1]'; 
endfunction 

function Res = max_bd() 
    len = size(t)(1);
    Res = [len len len]'; 
endfunction 

function Pop_init = init_ga_my(popsize,param)
    Pop_init = init_ga_default(popsize,param);
    for i=1:popsize
        Pop_init(i) = round(Pop_init(i));
    end
endfunction


function [Crossed_Indiv1, Crossed_Indiv2] = crossover_ga_my(Indiv1,Indiv2,param)
    [Crossed_Indiv1, Crossed_Indiv2] = crossover_ga_default(Indiv1,Indiv2,param);
    
    Crossed_Indiv1 = round(Crossed_Indiv1);
    Crossed_Indiv2 = round(Crossed_Indiv2);
endfunction


function Mut_Indiv = mutation_ga_my(Indiv,param)
    Mut_Indiv = mutation_ga_default(Indiv,param);

    Mut_Indiv = round(Mut_Indiv);
endfunction

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
ga_params = add_param(ga_params, 'minbound', min_bd()); 
ga_params = add_param(ga_params, 'maxbound', max_bd()); 
ga_params = add_param(ga_params, 'dimension', 3); 
// Параметры для настройки работы генетического алгоритма 
ga_params = add_param(ga_params, 'init_func', init_ga_my); 
ga_params = add_param(ga_params, 'crossover_func', crossover_ga_my); 
ga_params = add_param(ga_params, 'mutation_func', mutation_ga_my); 

[pop_opt, fobj_pop_opt, pop_init,fobj_pop_init]= optim_ga(func, PopSize, NbGen, Proba_mut, Proba_cross, Log, ga_params);


printf('Genetic Algorithm: %d points from pop_opt\n', nb_disp); 
for i= 1:nb_disp 
    printf('Individual %d: x(1) = %f x(2) = %f x(3) = %f−> f = %f\n', i, pop_opt(i)(1), pop_opt(i)(2), pop_opt(i)(3), fobj_pop_opt(i)); 
end 


set nb_mach := {1..3};
set nb_task := {4..8};

param X[nb_mach] :=  read "jobshop.in" as "<2n> 3n" use 3 comment "c";
param Y[nb_task*nb_mach] :=  read "jobshop.in" as "<2n,3n> 4n" skip 5;

#forall <i,j> in nb_task*nb_mach do print Y[i,j];

var tasks[nb_task*nb_mach] binary;

minimize cout_total :	
	sum <machine> in nb_mach:
		sum <task> in nb_task:	
			tasks[task, machine] * Y[task, machine] * X[machine];



subto disjoint :
	forall <task> in nb_task do
		sum <machine> in nb_mach :
			tasks[task,machine] >= 1;

subto tps :
	forall <machine> in nb_mach do
		sum <task> in nb_task : 
			tasks[task, machine] * Y[task, machine] <= 12;
			

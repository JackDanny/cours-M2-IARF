set NB_SETS := {1..450};
set NB_ITEMS := {1..17827};

set ITEMS := {read "frb30-15-1_bin.msc" as "<1n,2n>"};

var used[NB_SETS] binary;

maximize nb_set_used :
	sum <n> in NB_SETS : used[n];

subto disjoint :
	forall <i> in NB_ITEMS do
		sum <s> in NB_SETS with <s,i> in ITEMS :  used[s] <= 1;


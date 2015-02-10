param NB_SET := 8;
param NB_ITEM := 20;

set SETS := {1..NB_SET};
set ITEMS := {1..NB_ITEM};

set ensemble[SETS] := 
	<1> {1..5},
	<2> {6 to 10},
	<3> {11 to 20},
	<4> {1 to 10},
	<5> {2 to 8},
	<6> {6 to 15},
	<7> {10 to 15},
	<8> {16 to 18};


var used[SETS] binary;

maximize nb_set_used :
	sum <n> in SETS do used[n];

subto disjoint :
	forall <m> in SETS do
		
		sum <d> in SETS with m in ensemble[d] do
			used[d] >= 1;

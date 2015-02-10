set disk := {1..450};
set morceaux := {1..17827};


set data := {read "frb30-15-1_bin.msc" as "<1n,2n>" comment "p"}; 

var choix[disk] binary;

minimize number: sum<i> in disk: choix[i]; 

subto tout:
  forall <j> in morceaux do sum<i> in disk with <i,j> in data: choix[i] >= 1; 
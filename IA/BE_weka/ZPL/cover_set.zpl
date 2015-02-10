set disk := {1..1165};
set morceaux := {1..118};


set data := {read "alitalia_nocost_bin.col" as "<1n,2n>" comment "p"}; 

param cover[<i,j> in disk*morceaux] := if <i,j> in data then 1 else 0 end;

var choix[disk] binary;

minimize number: sum<i> in disk: choix[i]; 

subto tout:
  forall <j> in morceaux do sum<i> in disk: choix[i]*cover[i,j] >= 1; 
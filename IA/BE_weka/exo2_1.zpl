set Classes := {"B-NP","B-PP","I-NP","B-VP","I-VP","B-SBAR","O","B-ADJP","B-ADVP","I-ADVP","I-ADJP","I-SBAR","I-PP","B-PRT","B-LST","B-INTJ","I-INTJ","B-CONJP","I-CONJP","I-PRT","B-UCP","I-UCP","I-LST"};
set lines := {1..33};
set ch := {1..21};


param p1[lines]:= read "phrase2.txt" as "3n" ; 
param p2[lines]:= read "phrase2.txt" as "4n" ; 
param p3[lines]:= read "phrase2.txt" as "5n" ; 
param p4[lines]:= read "phrase2.txt" as "6n" ; 
param p5[lines]:= read "phrase2.txt" as "7n" ; 
param p6[lines]:= read "phrase2.txt" as "8n" ; 
param p7[lines]:= read "phrase2.txt" as "9n" ; 
param p8[lines]:= read "phrase2.txt" as "10n" ; 
param p9[lines]:= read "phrase2.txt" as "11n" ; 
param p10[lines]:= read "phrase2.txt" as "12n" ; 
param p11[lines]:= read "phrase2.txt" as "13n" ; 
param p12[lines]:= read "phrase2.txt" as "14n" ; 
param p13[lines]:= read "phrase2.txt" as "15n" ; 
param p14[lines]:= read "phrase2.txt" as "16n" ; 
param p15[lines]:= read "phrase2.txt" as "17n" ; 
param p16[lines]:= read "phrase2.txt" as "18n" ; 
param p17[lines]:= read "phrase2.txt" as "19n" ; 
param p18[lines]:= read "phrase2.txt" as "20n" ; 
param p19[lines]:= read "phrase2.txt" as "21n" ; 
param p20[lines]:= read "phrase2.txt" as "22n" ; 
param p21[lines]:= read "phrase2.txt" as "23n" ; 

param a[{1 .. 2}]:=<1>2;
param a[{1 .. 2}]:=<2>4;

do print a[2];

param p[<i,1> in lines*ch]:= p1[i];
param p[<i,2> in lines*ch]:= p2[i];

do forall <i> in lines do p[i,2] := p2[i]

do print p[33,2];

param p[<i,3> in lines*ch]:= p3[i];
param p[<i,4> in lines*ch]:= p4[i];
param p[<i,5> in lines*ch]:= p5[i];
param p[<i,6> in lines*ch]:= p6[i];
param p[<i,7> in lines*ch]:= p7[i];
param p[<i,8> in lines*ch]:= p8[i];
param p[<i,9> in lines*ch]:= p9[i];
param p[<i,10> in lines*ch]:= p10[i];
param p[<i,11> in lines*ch]:= p11[i];
param p[<i,12> in lines*ch]:= p12[i];
param p[<i,13> in lines*ch]:= p13[i];
param p[<i,14> in lines*ch]:= p14[i];
param p[<i,15> in lines*ch]:= p15[i];
param p[<i,16> in lines*ch]:= p16[i];
param p[<i,17> in lines*ch]:= p17[i];
param p[<i,18> in lines*ch]:= p18[i];
param p[<i,19> in lines*ch]:= p19[i];
param p[<i,20> in lines*ch]:= p20[i];
param p[<i,21> in lines*ch]:= p21[i];





var choix[lines*ch] binary;


subto unicite:
  forall <i> in lines do sum<j> in ch: choix[i,j] <= 1; 






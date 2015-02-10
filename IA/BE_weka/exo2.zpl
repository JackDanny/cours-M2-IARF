set Classes := {"B-NP","B-PP","I-NP","B-VP","I-VP","B-SBAR","O","B-ADJP","B-ADVP","I-ADVP","I-ADJP","I-SBAR","I-PP","B-PRT","B-LST","B-INTJ","I-INTJ","B-CONJP","I-CONJP","I-PRT","B-UCP","I-UCP","I-LST"};

set X:={1..33};




param proba1[X] := read "phrase2.txt" as "<3n>"; 


do print proba1[1];
do print proba1[2];
do print proba1[3];



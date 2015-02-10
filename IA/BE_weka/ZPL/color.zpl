param nb_sommet := read "flat20_3_0.col" as "3n" use 1 comment "c"; 
param nb_arc := read "flat20_3_0.col" as "4n" use 1 comment "c"; 

set arc := {read "flat20_3_0.col" as "<3n,2n>" skip 1 comment "c"}; 

do print nb_sommet;
do print nb_arc;

do print arc;


var nb_color integer >= 0 <=nb_sommet;
var coloration[{1..nb_sommet}] integer >= 0;
do print coloration;


minimize number:
	nb_color;

subto arc1:
  forall <sommet> in {1..nb_sommet}  do
	forall <voisin> in {1..nb_arc} with <sommet, voisin> in arc do
		abs(coloration[sommet] - coloration[voisin]) >= 1;

subto arc2:
  forall <sommet> in {1..nb_sommet} do
	forall <voisin> in {1..nb_arc} with <voisin, sommet> in arc do
		abs(coloration[sommet] - coloration[voisin]) >= 1;
		
subto cocolor:
	forall <sommet> in {1..nb_sommet} do
			coloration[sommet] <= nb_color;

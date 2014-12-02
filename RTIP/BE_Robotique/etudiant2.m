% Modélisation du robot SCARA Mitsubishi

%% NE PAS MODIFIER CETTE PARTIE
clc
clear all
close all

% Définition des paramètres géométriques du robot
a1 = 0.4; % Distance entre L1 et L2
a2 = 0.4; % Distance entre L2 et L3
L3 = 0.2; % Distance entre la caméra et la 3ème liaison (point O3)
h = 0.8;  % Hauteur au-dessus du plan de travail

% On définit ici 4 liaisons 3 rotoides et 1 prismatique (la 3ème) à l'aide
% des paramètres de Denavit/Hartenberg.
% Attention les paramètres de Denavit Hartenberg ne correspondent pas  aux
% conventions du cours
% theta d a alpha
L(1) = Link([ 0     0   a1  0], 'standard');
L(2) = Link([ 0     0   a2  0], 'standard');
L(3) = Link([ 0     0   0  0 1]);
L(4) = Link([ 0     0   0  0], 'standard');

% Définition des limites physiques des axes
L(1).qlim = [-pi pi];
L(2).qlim = [-pi pi];
L(3).qlim = [-2 0];
L(4).qlim = [-pi pi];

% On définit ici notre robot comme la concaténation des liaisons
% précédentes, on lui donne un nom, etc.
robot = SerialLink(L, 'name', 'Mitsubishi', ...
    'comment', 'from AIP');

%robot.teach() : ne pas utiliser cette méthode car risque de bug

% FIN DE LA PARTIE NON MODIFIABLE

%%
% Différentes configurations de test pour les MGD/MGI
q1 = zeros(1,4);
q2 = [pi/2 0 0 0];
q3 = [0 pi/2 0 0];
q4 = [0 0 0 pi/2];
q5 = [-pi/2 0 0 0];
q6 = [0 0 -0.5 0];
q7 = [-pi/2 pi/2 -0.5 0];

% Choix de la config de test parmi celles définies au-dessus
q = q1;


% Affichage du robot pour la configuration q choisie
disp('fkine pour q1')
robot.fkine(q)
disp('MGD calcule')

T01= DenHart(0,0,0,q(1));
T12= DenHart(a1,0,0,q(2));
T23= DenHart(a2,0,q(3),0);
T34= DenHart(0,0,0,q(4));
T04=T01*T12*T23*T34

q=q2;

disp('fkine pour q2')
robot.fkine(q)

disp('MGD calcule')

T01= DenHart(0,0,0,q(1));
T12= DenHart(a1,0,0,q(2));
T23= DenHart(a2,0,q(3),0);
T34= DenHart(0,0,0,q(4));
T04=T01*T12*T23*T34

q=q3;

disp('fkine pour q3')
robot.fkine(q)

disp('MGD calcule')

T01= DenHart(0,0,0,q(1));
T12= DenHart(a1,0,0,q(2));
T23= DenHart(a2,0,q(3),0);
T34= DenHart(0,0,0,q(4));
T04=T01*T12*T23*T34

q=q4;

disp('fkine pour q4')
robot.fkine(q)

disp('MGD calcule')

T01= DenHart(0,0,0,q(1));
T12= DenHart(a1,0,0,q(2));
T23= DenHart(a2,0,q(3),0);
T34= DenHart(0,0,0,q(4));
T04=T01*T12*T23*T34

q=q5;

disp('fkine pour q5')
robot.fkine(q)

disp('MGD calcule')

T01= DenHart(0,0,0,q(1));
T12= DenHart(a1,0,0,q(2));
T23= DenHart(a2,0,q(3),0);
T34= DenHart(0,0,0,q(4));
T04=T01*T12*T23*T34

q=q6;

disp('fkine pour q6')
robot.fkine(q)

disp('MGD calcule')

T01= DenHart(0,0,0,q(1));
T12= DenHart(a1,0,0,q(2));
T23= DenHart(a2,0,q(3),0);
T34= DenHart(0,0,0,q(4));
T04=T01*T12*T23*T34

q=q7;

disp('fkine pour q7')
robot.fkine(q)

disp('MGD calcule')

T01= DenHart(0,0,0,q(1));
T12= DenHart(a1,0,0,q(2));
T23= DenHart(a2,0,q(3),0);
T34= DenHart(0,0,0,q(4));
T04=T01*T12*T23*T34




q=q1;


T01= DenHart(0,0,0,q(1));
T12= DenHart(a1,0,0,q(2));
T23= DenHart(a2,0,q(3),0);
T34= DenHart(0,0,0,q(4));
T04=T01*T12*T23*T34



% Affichage du robot pour la configuration q choisie
robot.plot(q)



c1=cos(q(1));
s1=sin(q(1));
c2=cos(q(2));
s2=sin(q(2));

t1 = s1*s2-c1*c2;
t2 = -(c1*s2-c2*s1);
t3 = c2*(L3+a2)+a1;
t4 = s2*(L3+a2);



T0C=[ [t1 , t2 , 0 , c1*t3 - s1 * t4]; 
      [t2 , -t1, 0 , s1*t3 + c1 * t4];
      [0  , 0  ,-1 , 0              ];
      [0  , 0  , 0 , 1              ] ];

hold on;
trplot(T0C,'frame', 'C') 
%trplot(T0C,'axis', [0 0.1 0 0.1 0 0.1]);
%trplot(T0C,'axis', [0 0.1 0 0.1 0 0.1],'rgb');


% A COMPLETER
 
 %% Détermination de la position et de l'orientation de la pièce dans R0
 
 % Mesures renvoyées par la caméra : NE PAS MODIFIER
  PosPieceDsRc = [0.5;0;h;1]; % position pièce dans Rc
  thetaP = pi/2; % orientation pièce dans Rc
  
  % Calculer et afficher la position (X,Y,Z) de la pièce dans R0
  % A COMPLETER


  pos=T0C*PosPieceDsRc;
  X=pos(1);
  Y=pos(2);
  Z=pos(3);

  plot3(X,Y,Z,'ro'); % pour afficher
  
  % Calculer la position de l'objet dans R4 (repère outil)
  % A COMPLETER


  
  % En déduire la matrice de passage T0P entre le repère R0 et l'objet
  % A COMPLETER
  




















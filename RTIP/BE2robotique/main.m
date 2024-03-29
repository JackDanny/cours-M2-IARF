


syms a1 a2 a3 a4 a5 a6 
syms alpha1 alpha2 alpha3 alpha4 alpha5 alpha6
syms r1 r2 r3 r4 r5 r6
syms theta1 theta2 theta3 theta4 theta5 theta6
syms q1 q2 q3 q4 q5 q6

syms O2O3
syms O3O4


tableurDH=[a1 a2 a3 a4 a5 a6;
            alpha1 alpha2 alpha3 alpha4 alpha5 alpha6;
 r1 r2 r3 r4 r5 r6;
theta1 theta2 theta3 theta4 theta5 theta6];


      
a1 =0   ; a2=0        ; a3=O2O3    ; a4=0       ; a5=0        ; a6=0    ;                        
alpha1=0; alpha2=-pi/2; alpha3=0   ; alpha4=pi/2; alpha5=-pi/2; alpha6=0;
r1=0    ; r2=0        ; r3=0       ; r4=O3O4    ; r5=0        ; r6=0    ;


%theta1=0; theta2=-pi/2; theta3=pi/2; theta4=0   ; theta5=0    ; theta6=0;
theta1=q1; theta2=q2; theta3=q3; theta4=q4   ; theta5=q5    ; theta6=q6;
%q1=0; q2=-pi/2; q3=pi/2; q4=0   ; q5=0    ; q6=0;

disp('parametres de DH:');

tableurDH = subs(tableurDH)


disp('T01:');

T01=MatriceHomogeneLiaison2(a1,alpha1,r1,theta1)

disp('T12:');

T12=MatriceHomogeneLiaison2(a2,alpha2,r2,theta2)

disp('T23:');

T23=MatriceHomogeneLiaison2(a3,alpha3,r3,theta3)

disp('T34:');

T34=MatriceHomogeneLiaison2(a4,alpha4,r4,theta4)

disp('T45:');

T45=MatriceHomogeneLiaison2(a5,alpha5,r5,theta5)

disp('T56:');

T56=MatriceHomogeneLiaison2(a6,alpha6,r6,theta6)

disp('T16:');

T16=MatriceHomogeneMGD(tableurDH )

%simplify(T16)

syms c1 s1 c2 s2 c3 s3 c4 s4 c5 s5 c6 s6


if 0

T16s=subs(T16,cos(q1),c1);
T16s=subs(T16s,sin(q1),s1);
T16s=subs(T16s,cos(q2),c2);
T16s=subs(T16s,sin(q2),s2);
T16s=subs(T16s,cos(q3),c3);
T16s=subs(T16s,sin(q3),s3);
T16s=subs(T16s,cos(q4),c4);
T16s=subs(T16s,sin(q4),s4);
T16s=subs(T16s,cos(q5),c5);
T16s=subs(T16s,sin(q5),s5);
T16s=subs(T16s,cos(q6),c6);
T16s=subs(T16s,sin(q6),s6)

end






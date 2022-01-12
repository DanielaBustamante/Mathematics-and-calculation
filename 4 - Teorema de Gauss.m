
%Vectores posición iniciales; [m] 
ro1o=[0,0,1];                          %absoluto O1 respecto de O
ro2a=[-0.2,1.5,2];                     %relativo O2 respecto de A
rpb=[-0.1,1.9,1.8];                    %relativo p respecto de B

%----------------------------------------------------------------------------

%Angulos de giro dato [°]
ang=[20, 40, 38, 10]; 
r=pi/180; t=1; % dt [s]
%
%Angulos de giro convertidos [rad] - TERNA [A] respecto de O
%
psia=ang(1)*r; thea=0; phia=ang(2)*r;  %ángulos psi, theta, phi de TERNA [A]
a=[psia, thea, phia];                  %vector auxiliar - TERNA [A]
%
%Angulos de giro convertidos [rad] - TERNA [B] respecto de A
%
psib=ang(3)*r; theb=0; phib=ang(4)*r; %ángulos psi, theta, phi de TERNA [B]
b=[psib, theb, phib];                  %vector auxiliar - TERNA [B]

%--------------------------------------------------------------------

%Matriz de rotación - TERNA [A]
R_za=[cosd(20) -sind(20) 0; 
      sind(20) cosd(20) 0;
      0 0 1];
     
R_ya=[1 0 0; 
      0 1 0;
      0 0 1]; 
      
R_xa=[1 0 0; 
      0 cosd(40) -sind(40);
      0 sind(40) cosd(40)];

%--------------------------------------------------------------------

Rao=R_za*R_ya*R_xa;     %Matriz total rotación - TERNA [A] respecto de O
disp('1_ Matriz de rotacion terna A respecto de O')
disp(Rao)

%--------------------------------------------------------------------

%Matriz de rotación - TERNA [B]
R_zb=[cosd(38) -sind(38) 0; 
      sind(38) cosd(38) 0;
      0 0 1 ];
      
R_yb=[1 0 0; 
      0 1 0;
      0 0 1];
      
R_xb=[1 0 0; 
      0 cosd(10) -sind(10);
      0 sind(10) cosd(10)];

%--------------------------------------------------------------------

Rba=R_zb*R_yb*R_xb;     %Matriz total rotación - TERNA [B] respecto de A
disp('_Matriz de rotacion terna B respecto de A')
disp(Rba)

%--------------------------------------------------------------------  

%Matriz velocidad angular - TERNA [A] respecto de O

psiap=psia/t; theap=0; phiap=phia/t;   

omao=[0 -psiap 0; 
      psiap 0 -phiap;
      0 phiap 0];
      
disp('4_ velocidad angular terna A respecto de O')
disp(omao) 

%--------------------------------------------------------------------      

%Matriz velocidad angular - TERNA [B] respecto de A

psibp=psib/t; thebp=0; phibp=phib/t;   

omba=[0 -psibp 0; 
      psibp 0 -phibp;
      0 phibp 0];
      
disp('_velocidad angular terna B respecto de A')
disp(omba)

%-------------------------------------------------------------------- 

disp('3_Matriz de posicion de punto P respeto de terna fija')

Ro1o=[0
      0
      1]; 

Ro2a=[-0.2
       1.5
       1]; 
       
Rpb=[0.1
     0.4
     -0.2];       

rpo=(Ro1o+Rao*Ro2a+Rao*Rba*Rpb) 

%--------------------------------------------------------------------

%Vector velocidad lineal de punto p respecto de terna fija; [m/s]

disp('5_ vector velocidad lineal del punto p respecto terna fija')

vpo=(cross(omao,Rao)*Ro2a+cross(omao,Rao)*Rba*Rpb+Rao*cross(omba,Rba)*Rpb) 

%cross=producto vectorial

%--------------------------------------------------------------------

disp('2_ vector de posicion relativa O2A')
vo2a=[-0.2;
      1.5;
      1];
disp(vo2a)
disp('vector posición relativa P A')
vpa=[0.1;
     0.4;
    -0.2];
disp(vpa)

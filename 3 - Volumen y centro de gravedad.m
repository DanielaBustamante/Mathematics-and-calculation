%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%% CALCULO II %%%%%%%%%%%%%%%
%%%% TP1: VOLUMEN-CENTRO DE GRAVEDAD %%%%
%%%%%%% ALUMNO: BUSTAMANTE DANIELA %%%%%%%
%%%%%%%%%%%%% DNI: 44.093.292 %%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% z=3x^2+3y^2, z=16-x^2-y^2, funcion densidad f(x,y,z)=x^2+y^2

% 1. Hallar el volumen del solido

clear, clc

disp('Calculamos el volumen del solido limitado por:')

disp('los conos z=3x^2+3y^2 y z=16-x^2-y^2')

disp('Para realizar el calculo utilizaremos coordenadas cilindricas')

disp('Proyectando sobre el plano xy, nos quedan los siguientes limites')

disp('0<r<2')

disp('0<t<2*pi')

disp('3*r^2<z<16-r^2')


disp('Calculamos la integral')

syms r t z 

int1=int(r,z,3*r^2,16-r^2);

int2=int(int1,t,0,2*pi);

Vol=int(int2,r,0,2);

disp('El volumen es')

disp(Vol)

% 2. Calcular su masa y su centro de gravedad

disp('Si la densidad del solido es f(x,y,z)=x^2+y^2')

disp('Calculamos la masa del solido')

int1=int(r*r^2,z,3*r^2,16-r^2);

int2=int(int1,t,0,2*pi);

Masa=int(int2,r,0,2);

disp('La masa es')

disp(Masa)

Xg=int(int(int(r^4*cos(t),z,3*r^2,16-r^2),t,0,2*pi),r,0,2)/Masa;

Yg=int(int(int(r^4*sin(t),z,3*r^2,16-r^2),t,0,2*pi),r,0,2)/Masa;

Zg=int(int(int(r^3*z,z,3*r^2,16-r^2),t,0,2*pi),r,0,2)/Masa;

G=[Xg Yg Zg];

disp('El centro de gravedad se encuentra en:')

disp(G )

% 3. Graficar el solido y su centro de gravedad

disp('Graficaremos el solido y el centro de gravedad')

r=linspace(0,2,30);

t=linspace(0,2*pi,30);

[R,T]=meshgrid(r,t);

X=R.*cos(T);

Y=R.*sin(T);

Z=3.*X.^2+3.*Y.^2;

surf(X,Y,Z,'FaceAlpha',0.2)

hold on %autoriza la otra grafica

Z=16-X.^2-Y.^2;

surf(X,Y,Z,'FaceAlpha',0.2)

axis equal

hold on

plot3(Xg,Yg,Zg,'. b','markersize',30)

title('Volumen y centro de gravedad')

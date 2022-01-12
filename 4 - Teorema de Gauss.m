%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%% CALCULO II %%%%%%%%%%%%%%%%%%%%%%%%%% 
%%%%%%%%%%%%%%%%%%%%% TP2: TEOREMA DE GAUSS %%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%% ALUMNO: BUSTAMANTE DANIELA %%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%% DNI: 44.093.292 %%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 

clear, clc

disp('Aplique el teorema de Gauss para calcular el flujo')

disp('F(x,y,x)=(x+y+z , x-2*y*z+y^2 , y+z^2)')

disp('S1: z=sqrt(x^2+y^2)')

disp('S2: z=3')

disp('Con el vector normal apuntando hacia el exterior')

disp('Graficar la superficie cerrada y el campo vectorial')

% Definimos los componentes del campo vectorial

syms x y z r t 

F1=x+y+z;

F2=x-2*y*z+y^2;

F3=y+z^2;

F=[F1,F2,F3]

% Calculamos la divergencia

DIV=diff(F1,x)+diff(F2,y)+diff(F3,z);

disp('La divergencia de F es:')

DIV

disp('Proyectando sobre el plano XY, nos quedan los siguientes limites')

disp('0<r<3')

disp('0<t<2*pi')

disp('r<z<3')

% Calculamos la integral

int1=int(r*(2*r*sin(t)+1),z,r,3);

int2=int(int1,t,0,2*pi);

FLUJO=int(int2,r,0,3);

disp('Aplicando el teorema de Gauss, el flujo del campo es:')

FLUJO

% Graficamos la superficie

figure

r=linspace(0,3,30);

t=linspace(0,2*pi,30);

[R,T]=meshgrid(r,t);

X=R.*cos(T);

Y=R.*sin(T);

Z=(sqrt(X.^2+Y.^2));

surf(X,Y,Z,'FaceAlpha',0.3)

axis equal

hold on 

Z=repmat(3,size(X));

surf(X,Y,Z,'FaceAlpha',0.3)

hold on

X=-3.5:1:3.5;

Y=-3.5:1:3.5;

Z=-0.5:1:3.5;

[X,Y,Z]=meshgrid(X,Y,Z);

quiver3(X,Y,Z,X+Y+Z,X-2.*Y.*Z+Y.^2,Y+Z.^2,'b')

title('Superficie cerrada con campo vectorial')

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
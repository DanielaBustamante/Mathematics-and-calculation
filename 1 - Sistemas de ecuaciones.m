%%%%%%%%%%%%% MATEMATICA II %%%%%%%%%%%%%
%%%%%%%% TRABAJO PRACTICO MATLAB %%%%%%%%
% NOMBRE Y APELLIDO: Daniela Bustamante %
%%%%%%%%%%%% DNI: 44.093.292 %%%%%%%%%%%%  

clear clc 
syms x y z
disp('MATEMATICA II')
disp('Ejemplo 1 Dado el siguiente sistema de ecuaciones')
disp('3x+2y+z=1; 5x+3y+4z=2; x+y-z=1')
disp ('')

disp('a)Lo resolvemos en forma matricial')
%Armamos la matriz de los coeficientes
A=[3,2,1;5,3,4;1,1,-1]
%Armamos el vector
B=[1;2;1]
disp('Calculamos el determinante de la matriz de los coeficientes')
Det=det(A)
disp('Calculamos la inversa')
%Como es distinto de 0 podemos calcular la matriz inversa
Ai=inv(A)
disp('Solucion del sistema')
%Calculo la solucion del sistema como Ai*B
Sol=Ai*B

%Lo resolvemos con la funcion solve
disp('b)Lo resolvemos mediante la funcion "Solve"')
ec1='3*x+2*y+z=1';
ec2='5*x+3*y+4*z=2';
ec3='x+y-z=1';
[x,y,z]=solve(ec1,ec2,ec3)

%Aplicamos la funcion rref para resolver por Gauss
disp('c)Los resolvemos mediante Gauss-Jordan')
X=rref([A,B])

%----------------------------------------------------------

disp('Ejemplo 2 Dado el siguiente sistema de ecuaciones')
disp('3x+2y-2z=4; 4x+y-z=7; x+4y-4z=-2')

disp('a)Lo clasificamos con Rouch�-Froubenius')
%Armamos la matriz de los coeficientes
C=[3,2,-2;4,1,-1;1,4,-4]
%Armamos el vector
D=[4;7;-2]
disp('El rango de la matriz de los coeficientes C')
%Hallamos el rango de la matriz de los coeficientes
Rango=rank(C)
disp('La matriz ampliada Am2 sera')
%Armamos la matriz de los coeficientes
Am2=[C,D]
disp('El rango de la matriz ampliada sera')
%Hallamos el rango de la matriz ampliada
Rango=rank(Am2)
disp('Como el rango de C es igual al rango de Am pero menor al numero de incognitas este es un SCI')

disp('b)Verificamos el item anterior mediante Gauss-Jordan')
X=rref([Am2])
disp('Podemos ver como toda una fila se hace se hace 0')
disp('Se verifica que es un SCI')
clear
clc

load DataTrn
load DataTst

fprintf('Ingrese opci�n: \n(1) Para usar las 41 caracteristicas \n(2) Para usar las 25 caracteristicas \n(3) Para usar PSO\n');
opcion = input('Opci�n:\n');

if opcion==1
    q1
    q2
elseif opcion==2
    q1op2
    q2op2
elseif opcion==3
    bpso
    q2pso
else
    fprintf('Opci�n inv�lida\n');
end
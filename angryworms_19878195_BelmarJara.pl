%Implementacion de Asteroids
%Autor: Benjamin Belmar Jara
%Rut: 19.878.195-9

% Programa que simula el juego angry worms. La representacion del juego
% se hace a través de numeros enteros en una lista que representa el
% escenario completo, por lo tanto al referirse a escenario como
% parámetro se refiere a una lista.
% Tienen como representantes:
% 0: espacio vacio
% 1: camino solido
% 2: personaje
% 4: enemigos
% 5: proyectil

%DOMINIOS

%escenario = lista enteros.
%vacio = entero.
%personaje=entero.
%enemigo=entero.
%disparo=entero.

%%%%%%%%%% PREDICADOS %%%%%%%%%%%%%

%TDA
vacio(0).
camino(1).
personaje(2).
enemigo(4).
proyectil(5).

%Espacio1: 5 de ancho por 10 de alto y 2 enemigos
scene1([0,0,0,0,0,
        0,0,0,0,0,
        0,0,0,0,0,
        0,0,0,0,0,
        0,0,0,0,0,
        0,0,0,0,0,
        0,0,0,1,1,
        0,0,0,0,0,
        0,0,0,4,4,
        1,1,1,1,1]).

%Espacio2: 5 de ancho por 10 de alto y 4 enemigos.
scene2([0,0,0,0,0,
        0,0,0,0,0,
        0,0,0,0,0,
        0,0,0,0,0,
        0,0,0,0,0,
        0,0,0,0,0,
        0,0,0,4,4,
        0,0,0,1,1,
        0,0,0,4,4,
        1,1,1,1,1]).

%Escenario3: 5 de ancho por 10 de alto y 5 enemigos
scene3([0,0,1,0,0,
        0,0,0,0,0,
        0,0,0,0,0,
        0,0,0,0,0,
        0,4,0,0,0,
        1,1,0,0,0,
        0,0,0,4,4,
        0,0,0,1,1,
        0,0,0,4,4,
        1,1,1,1,1]).

%Escenario4: 10 de ancho por 12 de alto y 4 enemigos
scene4([0,0,0,0,0,0,0,0,0,0,
        0,0,0,0,0,0,0,0,0,0,
        0,0,0,0,0,0,0,0,0,0,
        0,0,0,0,0,0,0,0,0,0,
        0,0,0,0,0,0,0,0,0,0,
        0,0,0,0,0,0,0,0,0,0,
        0,0,0,0,0,0,0,0,0,0,
        0,0,0,0,0,0,0,0,4,0,
        0,0,0,0,0,0,0,1,1,0,
        0,0,0,0,0,0,0,0,0,0,
        1,0,0,0,1,1,0,4,4,4,
        1,1,1,1,1,1,1,1,1,1]).

%Escenario5: 10 de ancho por 12 de alto y 6 enemigos
scene5([0,0,0,0,0,0,0,0,0,0,
        0,0,0,0,0,0,0,0,0,0,
        0,0,0,0,0,0,0,2,0,0,
        0,0,0,0,0,0,0,0,0,0,
        0,0,0,0,0,0,0,0,0,0,
        0,0,0,0,0,0,0,0,0,0,
        0,0,0,0,0,0,0,0,0,0,
        0,0,0,0,0,0,0,0,4,4,
        0,0,0,0,0,0,4,4,1,1,
        0,0,0,0,0,4,1,1,1,1,
        0,0,0,0,4,1,1,1,1,1,
        1,1,1,1,1,1,1,1,1,1]).

%Espacio6: 20 de ancho por 20 de alto y 8 enemigos
scene6([0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
        0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
        0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
        0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,4,0,0,0,0,
        0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
        0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
        0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
        0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
        0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
        0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
        0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
        0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
        0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
        0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
        0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
        0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
        0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
        0,0,0,0,0,0,0,0,4,4,4,0,4,4,0,4,0,4,0,4,
        0,0,0,0,0,0,0,0,1,1,1,1,1,1,1,1,1,1,1,1,
        1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1]).

%%%%%%%%%%%%%%%%%%% REGLAS %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%Predicados que entrega el total de espacios de cierto espacio.
totalEspacios(N,M,Total):-Total is N*M.

%Predicados para agregar un elemento al final de una lista
agregarA([], [E], E).
agregarA([X|Xs], [X|Ys], E):-agregar(Xs, Ys, E).

%Predicados para determinar si un elemento esta en una lista
contieneA([X|Xs], X).
contieneA([X|Xs], Y):-contieneA(Xs, Y).

%predicado que mueve un elemento dentro de un espacio
moverElemento([HeadScene|TailScene],Pos,Dir,NewScene):-false.


%%%%%%%%%% Funcionalidades obligatorias %%%%%%%%%%%%%%%%

%Predicado que crea un escenario valido para juego si es que
% los parametros ingresados estan en la base de conocimiento
% del programa.
createScene( N, M, E, D,Seed,Scene):-false.

%Predicado que comprueba que el escenario este apto para jugar
% recibe la lista escenario y comprueba que el contenido sea uno de los
% definidos. Se llama recursivamente con la cola hasta que no quedan
% elementos que comprobar.
checkScene([]):-true.
checkScene([HeadScene|TailScene]):-(HeadScene=0;
                                   HeadScene=1;
                                   HeadScene=2;
                                   HeadScene=4;
                                   HeadScene=5;
                                   HeadScene=6;
                                   HeadScene=7),
                                   (checkSpace(TailScene))
                                   .
%Predicado que permite mover la nave en un turno
moveMember( SceneIn, Member, MoveDir, Seed, SceneOut):-false.

%Predicado que permite disparar proyectiles en un turno
shoot( SceneIn, Member, ShootType, Angle, Seed, SceneOut):-false.

% Predicado que actualiza el espacio de juego sin la interaccion del
% usuario
updateScene( SceneIn, Seed, SceneOut):-false.

%Clausula que convierte el Tda espacio a una lista de strings
sceneToString([HeadScene|TailScene], SceneStr):-false.


%%%%%%%%%%% METAS %%%%%%%%%%%%%
%PRIMARIAS: Generar espacio, comprobar la validez de un espacio,
%           mover personaje, disparar, actualizar escenario, convertir
%           escenario a string SECUNDARIAS: agregar/comprobar existencia
%           de elemento en una lista

%%%%%%%%%% Ejemplos para predicados implementados %%%%%%%%%%%%%%%






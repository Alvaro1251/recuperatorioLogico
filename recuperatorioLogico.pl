nro(1).
nro(2).
nro(3).
nro(4).
nro(5).
nro(6).
nro(7).
nro(8).

color(negra).
color(blanca).

pieza(torre, negra, 2,1).
pieza(torre, negra, 3,4).
pieza(reina, negra, 5,5).

pieza(alfil, blanca, 5,5).
pieza(peon, negra, 2, 5).
pieza(peon,blanca, 2, 4).

% 1)
% devuelve verdadero si hay dos piezas en el mismo casillero
casilleroLibre(Fil, Col):- not(pieza(_, _, Fil, Col)), not(pieza(_, _, Fil, Col)).

% 2)
% devuelve verdadero si hay dos piezas en el mismo casillero
dosPiezasEnMismoCasillero(Fil, Col):- pieza(Pieza1, _, Fil, Col), 
    pieza(Pieza2, _, Fil, Col), 
    Pieza1 \=Pieza2. 


% devuelve verdadero si hay una pieza fuera del tablero
piezaEnCasilleroInvalido(Pieza, Color, Fil, Col):- not(nro(Fil));
    not(nro(Col)). 


% devuelve verdadero si hay informacion ajena al ajedrez
informacionErronea(Pieza, Color, Fil, Col):- not(pieza(Pieza, Color, Fil, Col));
    piezaEnCasilleroInvalido(Pieza, Color, Fil, Col);
    not(color(Color)).

% devuelve verdadero si hay una pieza extraña
elementoExtranio(Pieza, Color, Fil, Col):- informacionErronea(Pieza, Color, Fil, Col).



% 3) 
puedeMoverseTorre(torre, Color, Fil, Col, FilLlegada, Col):- not(elementoExtranio(torre, Color, Fil, Col)), 
    not(elementoExtranio(torre, Color, FilLlegada, Col)),
    FilLlegada \= Fil,
    not(pieza(Pieza, Color, FilLlegada, Col));
    pieza(Pieza, OtroColor, FilLlegada, Col), piezasDeDistintoColor(torre, Color, Pieza, OtroColor).

puedeMoverseTorre(torre, Color, Fil, Col, Fil, ColLlegada):- not(elementoExtranio(torre, Color, Fil, Col)), 
    not(elementoExtranio(torre, Color, Fil, ColLlegada)),
    ColLlegada \= Col,
    not(pieza(Pieza, Color, Fil, ColLlegada));
    pieza(Pieza, OtroColor, Fil, ColLlegada), piezasDeDistintoColor(torre, Color, Pieza, OtroColor).



piezasDeDistintoColor(Pieza1, Color1, Pieza2, Color2):-pieza(Pieza1, Color1, _, _),
    pieza(Pieza2, Color2, _, _),
    Color1 \= Color2.


% devuelve verdadero si se puede mover sin comer
puedeMoverseSinComer(torre, Color, Fil, Col, FilLlegada, Col) :- not(elementoExtranio(torre, Color, Fil, Col)), 
    not(elementoExtranio(torre, Color, FilLlegada, Col)),
    FilLlegada \= Col, 
    not(pieza(Pieza, Color, Fil, FilLlegada)).

puedeMoverseSinComer(torre, Color, Fil, Col, Fil, ColLegada) :- not(elementoExtranio(torre, Color, Fil, Col)), 
    not(elementoExtranio(torre, Color, ColLlegada, Col)),
    ColLegada \= Col, 
    not(pieza(Pieza, Color, Fil, ColLegada)).


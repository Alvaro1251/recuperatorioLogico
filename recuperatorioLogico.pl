nro(1).
nro(2).
nro(3).
nro(4).
nro(5).
nro(6).
nro(7).
nro(8).

pieza(torre, negra, 2,1).
pieza(torre, negra, 3,4).
pieza(reina, negra, 5,5).

pieza(alfil, blanca, 5, 5).
pieza(peon, negra, 2, 5).


% devuelve verdadero si hay dos piezas en el mismo casillero
casilleroLibre(Fil, Col):- not(pieza(_, _, Fil, Col)), not(pieza(_, _, Fil, Col)).


% devuelve verdadero si hay dos piezas en el mismo casillero
dosPiezasEnMismoCasillero(Pieza, Color, Fil, Col):-pieza(Pieza1, Color, Fil, Col), pieza(Pieza2, Color, Fil, Col), Pieza1 \=Pieza2. 


% devuelve verdadero si hay una pieza fuera del tablero
piezaEnCasilleroInvalido(Pieza, Color, Fil, Col):- not(nro(Fil)) | not(nro(Col)). 


% devuelve verdadero si hay una pieza extraña
elementoExtranio(Pieza, Color, _, _):- not(pieza(Pieza, Color, _, _)).

dosPiezasDelMismoColor(Pieza1, Pieza2, Color1, Color2):- pieza(Pieza1, Color1, _, _), 
    pieza(Pieza2, Color2, _,_), 
    Color1==Color2.



% 3) 
puedeMoverseTorre(torre, Color, Fil, Col, FilLlegada, Col):- nro(FilLlegada),
    FilLlegada \= Fil,
    not(pieza(Pieza, Color, FilLlegada, Col)).

puedeMoverseTorre(torre, Color, Fil, Col, Fil, ColLegada):- nro(ColLegada),
    ColLegada \= Col,
    not(pieza(Pieza, Color, Fil, ColLegada)).

    




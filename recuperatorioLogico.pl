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


casilleroLibre(Fil, Col):- not(pieza(_, _, Fil, Col)), not(pieza(_, _, Fil, Col)).

dosPiezasEnMismoCasillero(Fil, Col):-pieza(Pieza1, _, Fil, Col), pieza(Pieza2, _, Fil, Col), Pieza1 \=Pieza2. 

piezaEnCasilleroInvalido(Pieza, _, Fil, Col):- not(nro(Fil)) | not(nro(Col)). 

elementoExtranio(Pieza, Color, _, _):- not(pieza(Pieza, Color, _, _)).


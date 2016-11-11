/*Funções responsáveis por fazer display do tabuleiro----------------------------------------------------------------------------------------------------------------------------------*/
display_board([L|Ls],Rows,Columns,I):-
  TempRows is round(Rows/2),
  I=TempRows,
  I1 is I+1,
  write('  '),
  display_boundary(Columns),
  nl,
  display_line_elems(L,I),
  nl,
  display_board(Ls,Rows,Columns,I1).

display_board([L|Ls],Rows,Columns,I):-
  NumberCols is Columns*5,
  I1 is I+1,
  display_horizontal(NumberCols),
  display_line_elems(L,I),
  nl,
  display_board(Ls,Rows,Columns,I1).
display_board([],Rows,Columns,I):-
  NumberCols is Columns*5,
  display_horizontal(NumberCols).

/*Função responsável por dar display dos elementos das listas*/
display_line_elems([E|Es],I):-
  write('   '),
  write(I),
  write(''),
  display_elems([E|Es]).

display_elems([E|Es]):-
  write(' | '),
  piece_simbol(E,Val),
  write(Val),
  display_elems(Es).
display_elems([]):-write(' | ').

/*Display dos indices das colunas*/
display_cols(Indice,Length):-
  write('    '),
  display_cols_indices(Indice,Length).

display_cols_indices(Indice,Length):-
  Indice<Length,
  Indice1 is Indice+1,
  write(' | '),
  write(Indice),
  display_cols_indices(Indice1,Length).
display_cols_indices(Length,Length):-write(' | '),nl.

/*Display das linhas separadoras horizontais*/
display_horizontal(N):-
  write('  '),
  display_horizontal_line(N).

display_horizontal_line(N):-
  N>=1,
  N1 is N-1,
  write(''),
  write('-'),
  write(''),
  display_horizontal_line(N1).
display_horizontal_line(0):-nl.

/*Display da fronteira entre ambos os quadrantes*/
display_boundary(N):-
  N>=1,
  N1 is N-1,
  write(''),
  write('_____'),
  write(''),
  display_boundary(N1).
display_boundary(0):-nl.

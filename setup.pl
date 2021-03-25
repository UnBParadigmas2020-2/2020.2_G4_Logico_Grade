setup:-
    open('disciplinas.txt', read, Str),
    read_disciplines(Str, _),
    close(Str).

write_discipline([Code, Name, Hours, Status, Semester]) :-
    assertz(discipline(Code, Name, Hours, Status, Semester)).

read_disciplines(Stream, []) :-
    at_end_of_stream(Stream).

read_disciplines(Stream, [X|L]) :-
    \+ at_end_of_stream(Stream),
    read(Stream, X),
    split_string(X, ';', ';', Text),
    write_discipline(Text),
    read_disciplines(Stream, L).
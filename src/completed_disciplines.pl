:- dynamic(completed_disciplines/5).

/*Setting up Discipline Facts*/
setup_completed_disciplines :-
    open('data/completed_disciplines.txt', read, Str),
    read_completed_disciplines(Str, _),
    close(Str).

write_completed_disciplines([Code, Name, Hours, Status, Semester]) :-
    assertz(discipline(Code, Name, Hours, Status, Semester)).

/*Read completed_disciplines from file*/
read_completed_disciplines(Stream, []) :-
    at_end_of_stream(Stream).

read_completed_disciplines(Stream, [X|L]) :-
    \+ at_end_of_stream(Stream),
    read(Stream, X),
    split_string(X, ';', ';', Text),
    write_completed_disciplines(Text),
    read_completed_disciplines(Stream, L).

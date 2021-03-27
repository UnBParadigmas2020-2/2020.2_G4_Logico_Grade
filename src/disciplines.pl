:- dynamic(discipline/5).

/*Setting up Discipline Facts*/
setup_discipline :-
    open('data/disciplines.txt', read, Str),
    read_disciplines(Str, _),
    close(Str).

/*Add discipline*/
write_discipline([Code, Name, Hours, Status, Semester]) :-
    assertz(discipline(Code, Name, Hours, Status, Semester)).

/*Read disciplines from file*/
read_disciplines(Stream, []) :-
    at_end_of_stream(Stream).

read_disciplines(Stream, [X|L]) :-
    \+ at_end_of_stream(Stream),
    read(Stream, X),
    split_string(X, ';', ';', Text),
    write_discipline(Text),
    read_disciplines(Stream, L).

/*Get the list of disciplines for a given semester*/
get_disciplines_by_semester(Semester) :-
    findall([Code, Name, Hours, Status], 
            discipline(Code, Name, Hours, Status, Semester), List), print_list_of_lists(List).

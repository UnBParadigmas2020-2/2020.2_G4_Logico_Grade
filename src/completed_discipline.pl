:- dynamic(completed_discipline/5).

/*Setting up Discipline Facts*/
setup_completed_discipline :-
    open('data/completed_disciplines.txt', read, Str),
    read_completed_discipline(Str, _),
    close(Str).

/*Add discipline*/
write_completed_discipline([Code, Name, Hours, Status, Semester]) :-
    assertz(completed_discipline(Code, Name, Hours, Status, Semester)).

/*Read disciplines from file*/
read_completed_discipline(Stream, []) :-
    at_end_of_stream(Stream).

read_completed_discipline(Stream, [X|L]) :-
    \+ at_end_of_stream(Stream),
    read(Stream, X),
    split_string(X, ';', ';', Text),
    write_completed_discipline(Text),
    read_completed_discipline(Stream, L).

/*Get all completed disciplines */
get_completed_disciplines :-
    findall([Code, Name, Hours, Status, Semester], 
            completed_discipline(Code, Name, Hours, Status, Semester), List), print_list_of_lists(List).

:- dynamic(discipline/5).

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

/*Print list as one, separating by space*/
print_join_list([]).

print_join_list([Element|List]) :-
    write(Element), write(" "),
    print_join_list(List).


/*Print list of lists. One list by line, joined by space */
print_list_of_lists([]).

print_list_of_lists([Element|List]) :-
    print_join_list(Element),nl,
    print_list_of_lists(List).


/*Get the list of disciplines for a given semester*/
get_disciplines_by_semester(Semester) :-
    findall([Code, Name, Hours, Status], 
            discipline(Code, Name, Hours, Status, Semester), List), print_list_of_lists(List).
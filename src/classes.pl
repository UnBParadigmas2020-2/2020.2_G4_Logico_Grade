:- dynamic(class/5).

/*Setting up Class Facts*/
setup_class:-
    open('data/classes.txt', read, Str),
    read_class(Str, _),
    close(Str).

/*Add class*/
write_class([Discipline, Code, Teacher, TotalHours, Hours]) :-
    assertz(class(Discipline, Code, Teacher, TotalHours, Hours)).

/*Read classes from file*/
read_class(Stream, []) :-
    at_end_of_stream(Stream).

read_class(Stream, [X|L]) :-
    \+ at_end_of_stream(Stream),
    read(Stream, X),
    split_string(X, ';', ';', Text),
    write_class(Text),
    read_class(Stream, L).

/*Get the list of available classes for a given discipline*/
get_classes_by_code(Discipline) :-
    findall([Teacher], 
            class(Discipline, _, Teacher, _, _), List), print_list_of_lists(List).

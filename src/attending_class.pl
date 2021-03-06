:- dynamic(attending_class/5).

/*Add disciplines to */
register_attending_classes :-
    write_ln('Digite o codigo da disciplina que deseja incluir na sua grade, em minusculo, seguido de um ponto final'), nl,
    read(Input),
    string_upper(Input, Code),
    discipline(Code, Name, Hours, Status, Semester),
    open('data/attending_classes.txt', append, Out),
    write(Out, '\''), 
    write(Out, Code), write(Out, ';'), 
    write(Out, Name), write(Out, ';'), 
    write(Out, Hours), write(Out, ';'), 
    write(Out, Status), write(Out, ';'), 
    write(Out, Semester), write(Out, '\''),
    write(Out, '.'),
    write(Out, '\n'),
    close(Out),
    attending_classes.


setup_attending_classes :-
    open('data/attending_classes.txt', read, Str),
    read_attending_classes(Str, _),
    close(Str).

read_attending_classes(Stream, []) :-
    at_end_of_stream(Stream),
    write('\n'),
    attending_classes.

read_attending_classes(Stream, [X|L]) :-
    \+ at_end_of_stream(Stream),
    read(Stream, X),
    split_string(X, ';', ';', Text),
    get_attending_disciplines(Text),
    read_attending_classes(Stream, L).

get_attending_disciplines(Text) :-
    print_join_list(Text), nl.
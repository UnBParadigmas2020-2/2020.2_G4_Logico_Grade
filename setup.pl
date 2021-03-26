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


/*Print all disciplines of a given semester*/
print_disciplines_by_semester :-
    write_ln('Digite o numero do semestre para o qual deseja listar disciplinas, seguido de um ponto final'), nl,
    read(Semester_Integer),
    /*Converting integer to string*/
    number_string(Semester_Integer, Semester),
    write('Essas são as disciplinas do semestre '), write(Semester), write_ln(": "),
    get_disciplines_by_semester(Semester),
    interface.


/*Exit program*/
exit():-
    write_ln('Até logo !'),
    halt(0).

/*Switch case implementation*/
switch(_, []) :- write_ln('Essa opção não existe.').
switch(X, [Val:Goal|Cases]) :-
    ( X=Val ->
        call(Goal)
    ;
        switch(X, Cases)
    ).  

/*Options menu*/
interface:-
    nl,
    write_ln('Olá, o que você deseja ? Digite a opção, seguida por um ponto final'), nl,
    write_ln('[1] - Listar disciplinas de um semestre'),
    write_ln('[2] - Encerrar '),
    read(Option),
    switch(Option, [
            1 : print_disciplines_by_semester,
            2 : exit()
        ]).

/*Main function to start the program*/
main:-
    setup;
    interface.
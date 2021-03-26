:- dynamic(discipline/5).
:- dynamic(class/5).

/*Setting up Discipline Facts*/
setup_discipline :-
    open('disciplines.txt', read, Str),
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


/*Setting up Class Facts*/
setup_class:-
    open('classes.txt', read, Str),
    read_class(Str, _),
    close(Str).

write_class([Discipline, Code, Teacher, TotalHours, Hours]) :-
    assertz(class(Discipline, Code, Teacher, TotalHours, Hours)).

read_class(Stream, []) :-
    at_end_of_stream(Stream).

read_class(Stream, [X|L]) :-
    \+ at_end_of_stream(Stream),
    read(Stream, X),
    split_string(X, ';', ';', Text),
    write_class(Text),
    read_class(Stream, L).


/*Print list as one, separating by space*/
print_join_list([]).

print_join_list([Element|List]) :-
    write(Element), write(" "),
    print_join_list(List).


/*Print list of lists. One list by line, joined by space */
print_list_of_lists([]) :-
    write('---- FIM ----'), nl.

print_list_of_lists([Element|List]) :-
    print_join_list(Element),nl,
    print_list_of_lists(List).


/*Get the list of disciplines for a given semester*/
get_disciplines_by_semester(Semester) :-
    findall([Code, Name, Hours, Status], 
            discipline(Code, Name, Hours, Status, Semester), List), print_list_of_lists(List).

get_classes_by_code(Discipline) :-
    findall([Teacher], 
            class(Discipline, _, Teacher, _, _), List), print_list_of_lists(List).


/*Print all disciplines of a given semester*/
print_disciplines_by_semester :-
    write_ln('Digite o numero do semestre que deseja listar as disciplinas, seguido de um ponto final'), nl,
    read(Semester_Integer),
    /*Converting integer to string*/
    number_string(Semester_Integer, Semester),
    write('Disciplinas do semestre '), write(Semester), write_ln(": "),
    get_disciplines_by_semester(Semester),
    interface.


/*Print discipline by code*/
print_discipline_by_code :-
    write_ln('Digite o código da disciplina que está procurando, seguido de um ponto final'), nl,
    read(Input),
    string_upper(Input, Code),
    discipline(Code, Name, Hours, Status, _),
    write(Code), write(' - '), write(Name), write(' '), write(Hours), write(' '), write(Status), nl,
    interface.

print_classes_by_code :-
    write_ln('Digite o código da disciplina que está procurando em minusculo, seguido de um ponto final'), nl,
    read(Input),
    string_upper(Input, Code),
    write('Turmas da disciplina '), write(Code), write_ln(": "),
    get_classes_by_code(Code),
    interface.



register_discipline :-
    write_ln('Digite o código da disciplina que está procurando, seguido de um ponto final'), nl,
    read(Input),
    string_upper(Input, Code),
    discipline(Code, Name, Hours, Status, Semester),
    open('maked_disciplines.txt', write, Out),
    write(Out, '\''), 
    write(Out, Code), write(Out, ';'), 
    write(Out, Name), write(Out, ';'), 
    write(Out, Hours), write(Out, ';'), 
    write(Out, Status), write(Out, ';'), 
    write(Out, Semester), write(Out, '\''),
    write(Out, '\n'),
    close(Out),
    interface.


print_disciplines_not_cursed :-
    write('Em desenvolviemnto'),
    interface.


make_grade :-
    write('Em desenvolviemnto'),
    interface.


/*Exit program*/
exit():-
    write_ln('Obrigado pela presença!'),
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
    write_ln('Olá, o que você deseja? Digite a opção, seguida por um ponto final'), nl,
    write_ln('[1] - Listar fluxo por por número do semestre'),
    write_ln('[2] - Buscar disciplina por código'),
    write_ln('[3] - Buscar turmas da disciplina'),
    write_ln('[4] - Cadastrar matéria'),
    write_ln('[5] - Matérias não feitas'),
    write_ln('[6] - Gerar Grade'),
    write_ln('[7] - Encerrar'),
    read(Option),
    switch(Option, [
            1 : print_disciplines_by_semester,
            2 : print_discipline_by_code,
            3 : print_classes_by_code,
            4 : register_discipline,
            5 : print_disciplines_not_cursed,
            6 : make_grade,
            7 : exit()
        ]).

/*Main function to start the program*/
main:-
    setup_discipline;
    setup_class;
    interface.
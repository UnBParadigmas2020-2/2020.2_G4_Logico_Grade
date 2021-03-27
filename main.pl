:- ['src/utils'].
:- ['src/classes'].
:- ['src/disciplines'].

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
    write_ln('Digite o codigo da disciplina que está procurando, em minusculo, seguido de um ponto final'), nl,
    read(Input),
    string_upper(Input, Code),
    discipline(Code, Name, Hours, Status, _),
    write(Code), write(' - '), write(Name), write(' '), write(Hours), write(' '), write(Status), nl,
    interface.


/*Print class by code*/
print_classes_by_code :-
    write_ln('Digite o codigo da disciplina cujas turmas você busca, em minusculo, seguido de um ponto final'), nl,
    read(Input),
    string_upper(Input, Code),
    write('Turmas da disciplina '), write(Code), write_ln(": "),
    get_classes_by_code(Code),
    interface.


/*Register a completed discipline*/
register_completed_discipline :-
    write_ln('Digite o codigo da disciplina que deseja incluir, em minusculo, seguido de um ponto final'), nl,
    read(Input),
    string_upper(Input, Code),
    discipline(Code, Name, Hours, Status, Semester),
    open('data/completed_disciplines.txt', append, Out),
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


/*Options menu*/
interface:-
    nl,
    write_ln('Olá, o que você deseja? Digite a opção, seguida por um ponto final'), nl,
    write_ln('[1] - Listar fluxo por número do semestre'),
    write_ln('[2] - Buscar disciplina por codigo'),
    write_ln('[3] - Buscar turmas da disciplina'),
    write_ln('[4] - Cadastrar matéria já feita'),
    write_ln('[5] - Ver matérias não feitas'),
    write_ln('[6] - Gerar Grade'),
    write_ln('[7] - Encerrar'),
    read(Option),
    switch(Option, [
            1 : print_disciplines_by_semester,
            2 : print_discipline_by_code,
            3 : print_classes_by_code,
            4 : register_completed_discipline,
            5 : print_disciplines_not_cursed,
            6 : make_grade,
            7 : exit()
        ]).

/*Main function to start the program*/
main:-
    setup_discipline;
    setup_class;
    interface.
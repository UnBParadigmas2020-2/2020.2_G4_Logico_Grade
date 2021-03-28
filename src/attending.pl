:- dynamic(attending/5).

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
    write(Out, '\n'),
    close(Out),
    attending_classes.

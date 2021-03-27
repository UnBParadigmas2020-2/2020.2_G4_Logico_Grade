/*Switch case implementation*/
switch(_, []) :- write_ln('Essa opção não existe.').
switch(X, [Val:Goal|Cases]) :-
    ( X=Val ->
        call(Goal)
    ;
        switch(X, Cases)
    ).  

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

/*Exit program*/
exit():-
    write_ln('Obrigado pela presença!'),
    halt(0).
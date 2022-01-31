:- use_module(library(prolog_pack), []).

query_packs(Query, Packs) :-
    prolog_pack:query_pack_server(search(Query), true(Packs), []).

format_packs :-
    query_packs('', Packs),
    forall(member(pack(Pack, _, _, _, _), Packs),
           format('~q~n', [Pack])).

install_packs :-
    query_packs('', Packs),
    forall(member(pack(Pack, _, _, _, _), Packs),
           pack_install(Pack, [interactive(false)])).

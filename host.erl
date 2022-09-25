-module(host).
-export([rpc/4, start/0,loop/0,result/1]).


start() ->
    
    
    Node = 'zoo@DESKTOP-96BSMOD', 
    P0 = spawn_link(Node, remote,loop,[]),
    Zeros = rpc(P0,remote,give_input,[]),

    P2 = spawn_link(Node, remote,loop,[]),
    % P3 = spawn_link(Node, remote,loop,[]),
    % P4 = spawn_link(Node, remote,loop,[]),
    % P5 = spawn_link(Node, remote,loop,[]),
    % P6 = spawn_link(Node, remote,loop,[]),
    % P7 = spawn_link(Node, remote,loop,[]),
    % P8 = spawn_link(Node, remote,loop,[]),
    % P9 = spawn_link(Node, remote,loop,[]),

    rpc(P2,remote,fac,[1,Zeros]).
    % rpc(P3,remote,fac,[1,Zeros]),
    % rpc(P4,remote,fac,[1,Zeros]),
    % rpc(P5,remote,fac,[1,Zeros]),
    % rpc(P6,remote,fac,[1,Zeros]),
    % rpc(P7,remote,fac,[1,Zeros]),
    % rpc(P8,remote,fac,[1,Zeros]),
    % rpc(P9,remote,fac,[1,Zeros]).
    

rpc(Pid, M, F, A) ->
    Pid ! {rpc, self(), M, F, A},
    receive
        {Pid, Response} ->
        Response

    end.


result(Item) ->

  erlang:display(Item).


loop() ->
    receive
    {rpc, Pid, M, F, A} ->
        Pid ! {self(), (catch apply(M, F, A))},
    loop()
    end.    
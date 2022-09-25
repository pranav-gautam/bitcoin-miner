-module(remote).
-export([rpc/4, main/0,tester/0,generate_string/2,hashed_in/0,loop/0,fac/2,start_check/2,string_check/2,give_input/0]).

main() ->
   
    Node = 'roo@DESKTOP-96BSMOD', 
    Pid2 = spawn_link(Node, host,loop,[]),
    rpc(Pid2,host,start,[]).

give_input() ->
    {ok,Value} = io:fread("Please enter the number of zeros: ","~u"),

    Zeros = string_check(lists:nth(1,Value),[]),
    Zeros.

string_check(0,T)-> T;
string_check(C,T)->

string_check(C-1,T++"0").

rpc(Pid, M, F, A) ->
    Pid ! {rpc, self(), M, F, A},
    receive
       {Pid, Response} ->
       Response
    end.

loop() ->
    receive
    {rpc, Pid, M, F, A} ->
        Pid ! {self(), (catch apply(M, F, A))},
    loop()
    end.    

tester() -> io:fwrite("tester\n").

generate_string(Length, Allowed) ->
    lists:foldl(fun(_, Acc) ->
                       [lists:nth(rand:uniform(length(Acc)),
                                   Allowed)]
                            ++ Acc
                end, [], lists:seq(1, Length)).

fac(N,Q) when N == 10000000000 -> io:fwrite("");
fac(N,Q) when N > 0  -> 
Tup = hashed_in(),

[St|J] = Tup,

Re = start_check(Q,lists:nth(1,J)),
if 

   Re == "True" -> Pid3 = spawn_link('roo@DESKTOP-96BSMOD', host,loop,[]), rpc(Pid3,host,result,[St]), exit(self());
   Re == "False" -> "q"
end,

fac(N+1,Q).


start_check([], _) -> "True";
start_check([Ch | Rest1], [Ch | Rest2]) ->
        start_check(Rest1, Rest2);
start_check(_, _) -> "False".

hashed_in() ->
    L = generate_string(10,"abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ"),
    ["pranavgautam" ++ L ++ "   " ++ io_lib:format("~64.16.0b", [binary:decode_unsigned(crypto:hash(sha256,L))]),io_lib:format("~64.16.0b", [binary:decode_unsigned(crypto:hash(sha256,L))])].
 
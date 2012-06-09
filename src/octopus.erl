-module(octopus).

-export ([
            channel/0
          , channel/1
          , send/2
          , send/3
          , recv/1
          , recv/2
          , close/1
          , select/1
          , select/2
          ]).

-export_type([channel/0]).

-opaque channel() :: pid().
% -type timeout() :: pos_integer().
-type capacity() :: pos_integer().
-type error() :: {'error', term()}.

-spec channel() -> {'ok', channel()} | error().
channel() ->
  {ok, self()}.

-spec channel(capacity()) -> {'ok', channel()} | error().
channel(_Capacity) ->
  {ok, self()}.

-spec send(channel(), term()) -> 'ok'.
send(_Channel, _Message) ->
  ok.

-spec send(channel(), term(), timeout()) -> 'ok' | error().
send(_Channel, _Message, _Timeout) ->
  ok.

-spec recv(channel()) -> {'ok', term()} | error().
recv(_Channel) ->
  {ok, {}}.

-spec recv(channel(), timeout()) -> {'ok', term()} | error().
recv(_Channel, _Timeout) ->
  {ok, {}}.

-spec close(channel()) -> 'ok' | error().
close(_Channel) ->
  ok.

-spec select([channel()]) -> {'ok', [channel()]} | error().
select(Channels) ->
  {ok, Channels}.

-spec select([channel()], timeout()) -> {'ok', [channel()]} | error().
select(Channels, _Timeout) ->
  {ok, Channels}.


%%--------------------------------------------------------------------
%% Copyright (c) 2012-2017 Feng Lee <feng@emqtt.io>.
%%
%% Licensed under the Apache License, Version 2.0 (the "License");
%% you may not use this file except in compliance with the License.
%% You may obtain a copy of the License at
%%
%%     http://www.apache.org/licenses/LICENSE-2.0
%%
%% Unless required by applicable law or agreed to in writing, software
%% distributed under the License is distributed on an "AS IS" BASIS,
%% WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
%% See the License for the specific language governing permissions and
%% limitations under the License.
%%--------------------------------------------------------------------

-module(emq_mod_retainer_sup).

-behaviour(supervisor).

-export([start_link/1]).

-export([init/1]).

-define(M, emq_mod_retainer).

start_link(Env) ->
	supervisor:start_link({local, ?MODULE}, ?MODULE, [Env]).

init([Env]) ->
	{ok, {{one_for_one, 10, 100}, [
           {?M, {?M, start_link, [Env]}, permanent, 5000, worker, [?M]}]}}.


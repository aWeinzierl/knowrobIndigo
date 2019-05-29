/* ***************************************
	Author:	Karinne Ramirez-Amaro
	E-mail:	karinne.ramirez@tum.de

 This library contains predicates used for the 
 inference method using prolog queries. 


 NOTE: The following symbols are used to describe the parameter 
of the predicates
 + The argument is instantiated at entry.
 - The argument is not instantiated at entry.
 ? The argument is unbound or instantiated at entry.

*/
:- module(fiad_activityInfer_utils,
    [
	create_new_instance/3,
	getClassPath/2
	%%TODO: Include the prolog queries you want to access from the terminal
    ]).

:- rdf_db:rdf_register_ns(semRoom_semantic_map, 'http://knowrob.org/kb/semRoom_semantic_map.owl#', [keep(true)]).


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% Please create here your prolog queries
%%% to answer the questions from the slides
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%TODO: Properly document your predicates
% Describe the purpose of this query
% e.g. This query will create a new instance of a given class

%
% create_new_instance(+Class, +Instance_ID, -Instance)
%% @param Class		represents the name of the class where the instance will be created. 
%			This variable cannot be empty and this Class could be of two forms: 
%			Class='http://knowrob.org/kb/semRoom_semantic_map.owl#KitchenTable' (the desired URL)
%			Class='KitchenTable'  <- if this is chosen then we take the default path of the ontology 
% @param Instance_ID	The number ID that our new instance will have, typically is a number, e.g., '3'
% @param Instance	asserted new instance.
%
% eg: create_new_instance('KitchenTable', '1',M).

create_new_instance(Class, Instance_ID, Instance):-
	getClassPath(Class, Class_path),
	
	% Create the path of the new instance
	atom_concat(Class_path,  '_', Class2),
	atom_concat(Class2, Instance_ID, Instance),
	
	% assert/create the new instance
	rdf_assert(Instance, rdf:type, Class_path),

	write('Asserted the new instance'), nl.




%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%% Useful queries %%%%%%%%%%%%
getClassPath(Class, Class_path):-
	((concat_atom(List, '#', Class),length(List,Length),Length>1) ->
	( % Class has already a URI
	   Class_path=Class );
	  % When the class does not have URL, will get the ontology path
	( TempClass='http://knowrob.org/kb/semRoom_semantic_map.owl#',
	atom_concat(TempClass, Class, Class_path)
	% write(Class_path), nl
 	)).


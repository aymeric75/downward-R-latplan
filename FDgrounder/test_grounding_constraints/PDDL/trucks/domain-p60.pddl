(define (domain trucks-qualitativepreferences)
(:requirements :constraints :adl :typing)
(:types locatable truckarea location time - object
	package - locatable
	truck - locatable)
(:predicates
	(closer ?a1 - truckarea ?a2 - truckarea)
	(delivered ?p - package ?l - location ?t - time)
	(le ?t1 - time ?t2 - time)
	(at-destination ?p - package ?l - location)
	(free ?a - truckarea ?t - truck)
	(next ?t1 - time ?t2 - time)
	(time-now ?t - time)
	(at ?x - locatable ?l - location)
	(in ?p - package ?t - truck ?a - truckarea)
	(connected ?x - location ?y - location))
(:constants
	a1 - truckarea
	a3 - truckarea
	a2 - truckarea
	a4 - truckarea)
(:action load
:parameters ( ?p - package ?t - truck ?a1 - truckarea ?l - location)
:precondition (and (at ?t ?l) (at ?p ?l) (free ?a1 ?t) (and (imply (closer a1 ?a1) (free a1 ?t)) (imply (closer a3 ?a1) (free a3 ?t)) (imply (closer a2 ?a1) (free a2 ?t)) (imply (closer a4 ?a1) (free a4 ?t))))
:effect (and (not (at ?p ?l)) (not (free ?a1 ?t)) (in ?p ?t ?a1) )
)
(:action deliver
:parameters ( ?p - package ?l - location ?t1 - time ?t2 - time)
:precondition (and (at ?p ?l) (time-now ?t1) (le ?t1 ?t2))
:effect (and (not (at ?p ?l)) (delivered ?p ?l ?t2) (at-destination ?p ?l) )
)
(:action drive
:parameters ( ?t - truck ?from - location ?to - location ?t1 - time ?t2 - time)
:precondition (and (at ?t ?from) (connected ?from ?to) (time-now ?t1) (next ?t1 ?t2))
:effect (and (not (at ?t ?from)) (not (time-now ?t1)) (time-now ?t2) (at ?t ?to) )
)
(:action unload
:parameters ( ?p - package ?t - truck ?a1 - truckarea ?l - location)
:precondition (and (at ?t ?l) (in ?p ?t ?a1) (and (imply (closer a1 ?a1) (free a1 ?t)) (imply (closer a3 ?a1) (free a3 ?t)) (imply (closer a2 ?a1) (free a2 ?t)) (imply (closer a4 ?a1) (free a4 ?t))))
:effect (and (not (in ?p ?t ?a1)) (free ?a1 ?t) (at ?p ?l) )
)
)

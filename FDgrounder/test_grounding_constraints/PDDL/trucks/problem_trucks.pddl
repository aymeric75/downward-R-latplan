(define (problem truck-1)
(:domain Trucks-QualitativePreferences)
(:objects
	truck1 - truck
	truck2 - truck
	package1 - package
	package2 - package
	package3 - package
	l1 - location
	l2 - location
	l3 - location
	t0 - time
	t1 - time
	t2 - time
	t3 - time
	t4 - time
	t5 - time
	t6 - time
	a1 - truckarea
	a2 - truckarea)

(:init
	(at truck1 l3)
	(at truck2 l3)
	(free a1 truck1)
	(free a2 truck1)
	(closer a1 a2)
	(at package1 l2)
	(at package2 l2)
	(at package3 l2)
	(connected l1 l2)
	(connected l1 l3)
	(connected l2 l1)
	(connected l2 l3)
	(connected l3 l1)
	(connected l3 l2)
	(time-now t0)
	(le t1 t1)
	(le t1 t2)
	(le t1 t3)
	(le t1 t4)
	(le t1 t5)
	(le t1 t6)
	(le t2 t2)
	(le t2 t3)
	(le t2 t4)
	(le t2 t5)
	(le t2 t6)
	(le t3 t3)
	(le t3 t4)
	(le t3 t5)
	(le t3 t6)
	(le t4 t4)
	(le t4 t5)
	(le t4 t6)
	(le t5 t5)
	(le t5 t6)
	(le t6 t6)
	(next t0 t1)
	(next t1 t2)
	(next t2 t3)
	(next t3 t4)
	(next t4 t5)
	(next t5 t6))

(:goal (and
(exists (?t - truck) (at ?t l3))
))(:constraints (and
(forall (?l - location ?p - package) (always (delivered package1 ?l t2)))
(forall (?t1 - time) (at-most-once (forall (?p - package) (exists (?l - location) (and (delivered ?p ?l ?t1) (le ?t1 t3)) ))))
(forall (?t1 - time) (sometime-before (delivered package1 l3 ?t1) (exists (?l - location) (delivered package1 ?l t2)) ) )
(sometime (at truck1 l3))
(forall (?t1 - time)
    (and
        (forall (?l - location) (always (delivered package1 ?l t2)))
        (and
            (forall (?p - package) (at-most-once (delivered ?p l3 ?t1)))
            (forall (?p - package) (sometime (delivered package1 l2 t2)))
        )
    )
)
)))
(define (domain grounded-STRIPS-OPENSTACKS-SOFTPREFERENCES)
(:requirements
:strips
:negative-preconditions
:constraints
)
(:predicates
(DELIVERED-O1-P1)
(DELIVERED-O2-P1)
(DELIVERED-O3-P1)
(DELIVERED-O4-P1)
(DELIVERED-O5-P1)
(DELIVERED-O6-P1)
(DELIVERED-O7-P1)
(DELIVERED-O8-P1)
(DELIVERED-O9-P1)
(DELIVERED-O10-P1)
(MADE-P1)
(DELIVERED-O1-P2)
(DELIVERED-O2-P2)
(DELIVERED-O3-P2)
(DELIVERED-O4-P2)
(DELIVERED-O5-P2)
(DELIVERED-O6-P2)
(DELIVERED-O7-P2)
(DELIVERED-O8-P2)
(DELIVERED-O9-P2)
(DELIVERED-O10-P2)
(MADE-P2)
(DELIVERED-O1-P3)
(DELIVERED-O2-P3)
(DELIVERED-O3-P3)
(DELIVERED-O4-P3)
(DELIVERED-O5-P3)
(DELIVERED-O6-P3)
(DELIVERED-O7-P3)
(DELIVERED-O8-P3)
(DELIVERED-O9-P3)
(DELIVERED-O10-P3)
(MADE-P3)
(DELIVERED-O1-P4)
(DELIVERED-O2-P4)
(DELIVERED-O3-P4)
(DELIVERED-O4-P4)
(DELIVERED-O5-P4)
(DELIVERED-O6-P4)
(DELIVERED-O7-P4)
(DELIVERED-O8-P4)
(DELIVERED-O9-P4)
(DELIVERED-O10-P4)
(MADE-P4)
(DELIVERED-O1-P5)
(DELIVERED-O2-P5)
(DELIVERED-O3-P5)
(DELIVERED-O4-P5)
(DELIVERED-O5-P5)
(DELIVERED-O6-P5)
(DELIVERED-O7-P5)
(DELIVERED-O8-P5)
(DELIVERED-O9-P5)
(DELIVERED-O10-P5)
(MADE-P5)
(DELIVERED-O1-P6)
(DELIVERED-O2-P6)
(DELIVERED-O3-P6)
(DELIVERED-O4-P6)
(DELIVERED-O5-P6)
(DELIVERED-O6-P6)
(DELIVERED-O7-P6)
(DELIVERED-O8-P6)
(DELIVERED-O9-P6)
(DELIVERED-O10-P6)
(MADE-P6)
(DELIVERED-O1-P7)
(DELIVERED-O2-P7)
(DELIVERED-O3-P7)
(DELIVERED-O4-P7)
(DELIVERED-O5-P7)
(DELIVERED-O6-P7)
(DELIVERED-O7-P7)
(DELIVERED-O8-P7)
(DELIVERED-O9-P7)
(DELIVERED-O10-P7)
(MADE-P7)
(DELIVERED-O1-P8)
(DELIVERED-O2-P8)
(DELIVERED-O3-P8)
(DELIVERED-O4-P8)
(DELIVERED-O5-P8)
(DELIVERED-O6-P8)
(DELIVERED-O7-P8)
(DELIVERED-O8-P8)
(DELIVERED-O9-P8)
(DELIVERED-O10-P8)
(MADE-P8)
(DELIVERED-O1-P9)
(DELIVERED-O2-P9)
(DELIVERED-O3-P9)
(DELIVERED-O4-P9)
(DELIVERED-O5-P9)
(DELIVERED-O6-P9)
(DELIVERED-O7-P9)
(DELIVERED-O8-P9)
(DELIVERED-O9-P9)
(DELIVERED-O10-P9)
(MADE-P9)
(DELIVERED-O1-P10)
(DELIVERED-O2-P10)
(DELIVERED-O3-P10)
(DELIVERED-O4-P10)
(DELIVERED-O5-P10)
(DELIVERED-O6-P10)
(DELIVERED-O7-P10)
(DELIVERED-O8-P10)
(DELIVERED-O9-P10)
(DELIVERED-O10-P10)
(MADE-P10)
(STARTED-O1)
(STACKS-IN-USE-N1)
(STARTED-O2)
(STARTED-O3)
(STARTED-O4)
(STARTED-O5)
(STARTED-O6)
(STARTED-O7)
(STARTED-O8)
(STARTED-O9)
(STARTED-O10)
(SHIPPED-O1)
(SHIPPED-O2)
(SHIPPED-O3)
(SHIPPED-O4)
(SHIPPED-O5)
(SHIPPED-O6)
(SHIPPED-O7)
(SHIPPED-O8)
(SHIPPED-O9)
(SHIPPED-O10)
(STACKS-IN-USE-N2)
(STACKS-IN-USE-N3)
(STACKS-IN-USE-N4)
(STACKS-IN-USE-N5)
(STACKS-IN-USE-N6)
(STACKS-IN-USE-N7)
(STACKS-IN-USE-N8)
(STACKS-IN-USE-N9)
(STACKS-IN-USE-N10)
(WAITING-O10)
(NOT-STARTED-O10)
(WAITING-O9)
(NOT-STARTED-O9)
(WAITING-O8)
(NOT-STARTED-O8)
(WAITING-O7)
(NOT-STARTED-O7)
(WAITING-O6)
(NOT-STARTED-O6)
(WAITING-O5)
(NOT-STARTED-O5)
(WAITING-O4)
(NOT-STARTED-O4)
(WAITING-O3)
(NOT-STARTED-O3)
(WAITING-O2)
(NOT-STARTED-O2)
(WAITING-O1)
(NOT-STARTED-O1)
(STACKS-IN-USE-N0)
(NOT-MADE-P10)
(NOT-MADE-P9)
(NOT-MADE-P8)
(NOT-MADE-P7)
(NOT-MADE-P6)
(NOT-MADE-P5)
(NOT-MADE-P4)
(NOT-MADE-P3)
(NOT-MADE-P2)
(NOT-MADE-P1)
)
(:action SHIP-ORDER-O10-N10-N9-0
:parameters ()
:precondition
(and
(STACKS-IN-USE-N10)
(STARTED-O10)
)
:effect
(and
(NOT-STARTED-O10)
(SHIPPED-O10)
(STACKS-IN-USE-N9)
(not (STARTED-O10))
(not (STACKS-IN-USE-N10))
)
)
(:action SHIP-ORDER-O9-N10-N9-0
:parameters ()
:precondition
(and
(STACKS-IN-USE-N10)
(STARTED-O9)
)
:effect
(and
(NOT-STARTED-O9)
(SHIPPED-O9)
(STACKS-IN-USE-N9)
(not (STARTED-O9))
(not (STACKS-IN-USE-N10))
)
)
(:action SHIP-ORDER-O8-N10-N9-0
:parameters ()
:precondition
(and
(STACKS-IN-USE-N10)
(STARTED-O8)
)
:effect
(and
(NOT-STARTED-O8)
(SHIPPED-O8)
(STACKS-IN-USE-N9)
(not (STARTED-O8))
(not (STACKS-IN-USE-N10))
)
)
(:action SHIP-ORDER-O7-N10-N9-0
:parameters ()
:precondition
(and
(STACKS-IN-USE-N10)
(STARTED-O7)
)
:effect
(and
(NOT-STARTED-O7)
(SHIPPED-O7)
(STACKS-IN-USE-N9)
(not (STARTED-O7))
(not (STACKS-IN-USE-N10))
)
)
(:action SHIP-ORDER-O6-N10-N9-0
:parameters ()
:precondition
(and
(STACKS-IN-USE-N10)
(STARTED-O6)
)
:effect
(and
(NOT-STARTED-O6)
(SHIPPED-O6)
(STACKS-IN-USE-N9)
(not (STARTED-O6))
(not (STACKS-IN-USE-N10))
)
)
(:action SHIP-ORDER-O5-N10-N9-0
:parameters ()
:precondition
(and
(STACKS-IN-USE-N10)
(STARTED-O5)
)
:effect
(and
(NOT-STARTED-O5)
(SHIPPED-O5)
(STACKS-IN-USE-N9)
(not (STARTED-O5))
(not (STACKS-IN-USE-N10))
)
)
(:action SHIP-ORDER-O4-N10-N9-0
:parameters ()
:precondition
(and
(STACKS-IN-USE-N10)
(STARTED-O4)
)
:effect
(and
(NOT-STARTED-O4)
(SHIPPED-O4)
(STACKS-IN-USE-N9)
(not (STARTED-O4))
(not (STACKS-IN-USE-N10))
)
)
(:action SHIP-ORDER-O3-N10-N9-0
:parameters ()
:precondition
(and
(STACKS-IN-USE-N10)
(STARTED-O3)
)
:effect
(and
(NOT-STARTED-O3)
(SHIPPED-O3)
(STACKS-IN-USE-N9)
(not (STARTED-O3))
(not (STACKS-IN-USE-N10))
)
)
(:action SHIP-ORDER-O2-N10-N9-0
:parameters ()
:precondition
(and
(STACKS-IN-USE-N10)
(STARTED-O2)
)
:effect
(and
(NOT-STARTED-O2)
(SHIPPED-O2)
(STACKS-IN-USE-N9)
(not (STARTED-O2))
(not (STACKS-IN-USE-N10))
)
)
(:action SHIP-ORDER-O1-N10-N9-0
:parameters ()
:precondition
(and
(STACKS-IN-USE-N10)
(STARTED-O1)
)
:effect
(and
(NOT-STARTED-O1)
(SHIPPED-O1)
(STACKS-IN-USE-N9)
(not (STARTED-O1))
(not (STACKS-IN-USE-N10))
)
)
(:action START-ORDER-O10-N9-N10-0
:parameters ()
:precondition
(and
(STACKS-IN-USE-N9)
(WAITING-O10)
)
:effect
(and
(STARTED-O10)
(STACKS-IN-USE-N10)
(not (WAITING-O10))
(not (NOT-STARTED-O10))
(not (STACKS-IN-USE-N9))
)
)
(:action START-ORDER-O9-N9-N10-0
:parameters ()
:precondition
(and
(STACKS-IN-USE-N9)
(WAITING-O9)
)
:effect
(and
(STARTED-O9)
(STACKS-IN-USE-N10)
(not (WAITING-O9))
(not (NOT-STARTED-O9))
(not (STACKS-IN-USE-N9))
)
)
(:action START-ORDER-O8-N9-N10-0
:parameters ()
:precondition
(and
(STACKS-IN-USE-N9)
(WAITING-O8)
)
:effect
(and
(STARTED-O8)
(STACKS-IN-USE-N10)
(not (WAITING-O8))
(not (NOT-STARTED-O8))
(not (STACKS-IN-USE-N9))
)
)
(:action START-ORDER-O7-N9-N10-0
:parameters ()
:precondition
(and
(STACKS-IN-USE-N9)
(WAITING-O7)
)
:effect
(and
(STARTED-O7)
(STACKS-IN-USE-N10)
(not (WAITING-O7))
(not (NOT-STARTED-O7))
(not (STACKS-IN-USE-N9))
)
)
(:action START-ORDER-O6-N9-N10-0
:parameters ()
:precondition
(and
(STACKS-IN-USE-N9)
(WAITING-O6)
)
:effect
(and
(STARTED-O6)
(STACKS-IN-USE-N10)
(not (WAITING-O6))
(not (NOT-STARTED-O6))
(not (STACKS-IN-USE-N9))
)
)
(:action START-ORDER-O5-N9-N10-0
:parameters ()
:precondition
(and
(STACKS-IN-USE-N9)
(WAITING-O5)
)
:effect
(and
(STARTED-O5)
(STACKS-IN-USE-N10)
(not (WAITING-O5))
(not (NOT-STARTED-O5))
(not (STACKS-IN-USE-N9))
)
)
(:action START-ORDER-O4-N9-N10-0
:parameters ()
:precondition
(and
(STACKS-IN-USE-N9)
(WAITING-O4)
)
:effect
(and
(STARTED-O4)
(STACKS-IN-USE-N10)
(not (WAITING-O4))
(not (NOT-STARTED-O4))
(not (STACKS-IN-USE-N9))
)
)
(:action START-ORDER-O3-N9-N10-0
:parameters ()
:precondition
(and
(STACKS-IN-USE-N9)
(WAITING-O3)
)
:effect
(and
(STARTED-O3)
(STACKS-IN-USE-N10)
(not (WAITING-O3))
(not (NOT-STARTED-O3))
(not (STACKS-IN-USE-N9))
)
)
(:action START-ORDER-O2-N9-N10-0
:parameters ()
:precondition
(and
(STACKS-IN-USE-N9)
(WAITING-O2)
)
:effect
(and
(STARTED-O2)
(STACKS-IN-USE-N10)
(not (WAITING-O2))
(not (NOT-STARTED-O2))
(not (STACKS-IN-USE-N9))
)
)
(:action START-ORDER-O1-N9-N10-0
:parameters ()
:precondition
(and
(STACKS-IN-USE-N9)
(WAITING-O1)
)
:effect
(and
(STARTED-O1)
(STACKS-IN-USE-N10)
(not (WAITING-O1))
(not (NOT-STARTED-O1))
(not (STACKS-IN-USE-N9))
)
)
(:action SHIP-ORDER-O10-N9-N8-0
:parameters ()
:precondition
(and
(STACKS-IN-USE-N9)
(STARTED-O10)
)
:effect
(and
(NOT-STARTED-O10)
(SHIPPED-O10)
(STACKS-IN-USE-N8)
(not (STARTED-O10))
(not (STACKS-IN-USE-N9))
)
)
(:action SHIP-ORDER-O9-N9-N8-0
:parameters ()
:precondition
(and
(STACKS-IN-USE-N9)
(STARTED-O9)
)
:effect
(and
(NOT-STARTED-O9)
(SHIPPED-O9)
(STACKS-IN-USE-N8)
(not (STARTED-O9))
(not (STACKS-IN-USE-N9))
)
)
(:action SHIP-ORDER-O8-N9-N8-0
:parameters ()
:precondition
(and
(STACKS-IN-USE-N9)
(STARTED-O8)
)
:effect
(and
(NOT-STARTED-O8)
(SHIPPED-O8)
(STACKS-IN-USE-N8)
(not (STARTED-O8))
(not (STACKS-IN-USE-N9))
)
)
(:action SHIP-ORDER-O7-N9-N8-0
:parameters ()
:precondition
(and
(STACKS-IN-USE-N9)
(STARTED-O7)
)
:effect
(and
(NOT-STARTED-O7)
(SHIPPED-O7)
(STACKS-IN-USE-N8)
(not (STARTED-O7))
(not (STACKS-IN-USE-N9))
)
)
(:action SHIP-ORDER-O6-N9-N8-0
:parameters ()
:precondition
(and
(STACKS-IN-USE-N9)
(STARTED-O6)
)
:effect
(and
(NOT-STARTED-O6)
(SHIPPED-O6)
(STACKS-IN-USE-N8)
(not (STARTED-O6))
(not (STACKS-IN-USE-N9))
)
)
(:action SHIP-ORDER-O5-N9-N8-0
:parameters ()
:precondition
(and
(STACKS-IN-USE-N9)
(STARTED-O5)
)
:effect
(and
(NOT-STARTED-O5)
(SHIPPED-O5)
(STACKS-IN-USE-N8)
(not (STARTED-O5))
(not (STACKS-IN-USE-N9))
)
)
(:action SHIP-ORDER-O4-N9-N8-0
:parameters ()
:precondition
(and
(STACKS-IN-USE-N9)
(STARTED-O4)
)
:effect
(and
(NOT-STARTED-O4)
(SHIPPED-O4)
(STACKS-IN-USE-N8)
(not (STARTED-O4))
(not (STACKS-IN-USE-N9))
)
)
(:action SHIP-ORDER-O3-N9-N8-0
:parameters ()
:precondition
(and
(STACKS-IN-USE-N9)
(STARTED-O3)
)
:effect
(and
(NOT-STARTED-O3)
(SHIPPED-O3)
(STACKS-IN-USE-N8)
(not (STARTED-O3))
(not (STACKS-IN-USE-N9))
)
)
(:action SHIP-ORDER-O2-N9-N8-0
:parameters ()
:precondition
(and
(STACKS-IN-USE-N9)
(STARTED-O2)
)
:effect
(and
(NOT-STARTED-O2)
(SHIPPED-O2)
(STACKS-IN-USE-N8)
(not (STARTED-O2))
(not (STACKS-IN-USE-N9))
)
)
(:action SHIP-ORDER-O1-N9-N8-0
:parameters ()
:precondition
(and
(STACKS-IN-USE-N9)
(STARTED-O1)
)
:effect
(and
(NOT-STARTED-O1)
(SHIPPED-O1)
(STACKS-IN-USE-N8)
(not (STARTED-O1))
(not (STACKS-IN-USE-N9))
)
)
(:action START-ORDER-O10-N8-N9-0
:parameters ()
:precondition
(and
(STACKS-IN-USE-N8)
(WAITING-O10)
)
:effect
(and
(STARTED-O10)
(STACKS-IN-USE-N9)
(not (WAITING-O10))
(not (NOT-STARTED-O10))
(not (STACKS-IN-USE-N8))
)
)
(:action START-ORDER-O9-N8-N9-0
:parameters ()
:precondition
(and
(STACKS-IN-USE-N8)
(WAITING-O9)
)
:effect
(and
(STARTED-O9)
(STACKS-IN-USE-N9)
(not (WAITING-O9))
(not (NOT-STARTED-O9))
(not (STACKS-IN-USE-N8))
)
)
(:action START-ORDER-O8-N8-N9-0
:parameters ()
:precondition
(and
(STACKS-IN-USE-N8)
(WAITING-O8)
)
:effect
(and
(STARTED-O8)
(STACKS-IN-USE-N9)
(not (WAITING-O8))
(not (NOT-STARTED-O8))
(not (STACKS-IN-USE-N8))
)
)
(:action START-ORDER-O7-N8-N9-0
:parameters ()
:precondition
(and
(STACKS-IN-USE-N8)
(WAITING-O7)
)
:effect
(and
(STARTED-O7)
(STACKS-IN-USE-N9)
(not (WAITING-O7))
(not (NOT-STARTED-O7))
(not (STACKS-IN-USE-N8))
)
)
(:action START-ORDER-O6-N8-N9-0
:parameters ()
:precondition
(and
(STACKS-IN-USE-N8)
(WAITING-O6)
)
:effect
(and
(STARTED-O6)
(STACKS-IN-USE-N9)
(not (WAITING-O6))
(not (NOT-STARTED-O6))
(not (STACKS-IN-USE-N8))
)
)
(:action START-ORDER-O5-N8-N9-0
:parameters ()
:precondition
(and
(STACKS-IN-USE-N8)
(WAITING-O5)
)
:effect
(and
(STARTED-O5)
(STACKS-IN-USE-N9)
(not (WAITING-O5))
(not (NOT-STARTED-O5))
(not (STACKS-IN-USE-N8))
)
)
(:action START-ORDER-O4-N8-N9-0
:parameters ()
:precondition
(and
(STACKS-IN-USE-N8)
(WAITING-O4)
)
:effect
(and
(STARTED-O4)
(STACKS-IN-USE-N9)
(not (WAITING-O4))
(not (NOT-STARTED-O4))
(not (STACKS-IN-USE-N8))
)
)
(:action START-ORDER-O3-N8-N9-0
:parameters ()
:precondition
(and
(STACKS-IN-USE-N8)
(WAITING-O3)
)
:effect
(and
(STARTED-O3)
(STACKS-IN-USE-N9)
(not (WAITING-O3))
(not (NOT-STARTED-O3))
(not (STACKS-IN-USE-N8))
)
)
(:action START-ORDER-O2-N8-N9-0
:parameters ()
:precondition
(and
(STACKS-IN-USE-N8)
(WAITING-O2)
)
:effect
(and
(STARTED-O2)
(STACKS-IN-USE-N9)
(not (WAITING-O2))
(not (NOT-STARTED-O2))
(not (STACKS-IN-USE-N8))
)
)
(:action START-ORDER-O1-N8-N9-0
:parameters ()
:precondition
(and
(STACKS-IN-USE-N8)
(WAITING-O1)
)
:effect
(and
(STARTED-O1)
(STACKS-IN-USE-N9)
(not (WAITING-O1))
(not (NOT-STARTED-O1))
(not (STACKS-IN-USE-N8))
)
)
(:action SHIP-ORDER-O10-N8-N7-0
:parameters ()
:precondition
(and
(STACKS-IN-USE-N8)
(STARTED-O10)
)
:effect
(and
(NOT-STARTED-O10)
(SHIPPED-O10)
(STACKS-IN-USE-N7)
(not (STARTED-O10))
(not (STACKS-IN-USE-N8))
)
)
(:action SHIP-ORDER-O9-N8-N7-0
:parameters ()
:precondition
(and
(STACKS-IN-USE-N8)
(STARTED-O9)
)
:effect
(and
(NOT-STARTED-O9)
(SHIPPED-O9)
(STACKS-IN-USE-N7)
(not (STARTED-O9))
(not (STACKS-IN-USE-N8))
)
)
(:action SHIP-ORDER-O8-N8-N7-0
:parameters ()
:precondition
(and
(STACKS-IN-USE-N8)
(STARTED-O8)
)
:effect
(and
(NOT-STARTED-O8)
(SHIPPED-O8)
(STACKS-IN-USE-N7)
(not (STARTED-O8))
(not (STACKS-IN-USE-N8))
)
)
(:action SHIP-ORDER-O7-N8-N7-0
:parameters ()
:precondition
(and
(STACKS-IN-USE-N8)
(STARTED-O7)
)
:effect
(and
(NOT-STARTED-O7)
(SHIPPED-O7)
(STACKS-IN-USE-N7)
(not (STARTED-O7))
(not (STACKS-IN-USE-N8))
)
)
(:action SHIP-ORDER-O6-N8-N7-0
:parameters ()
:precondition
(and
(STACKS-IN-USE-N8)
(STARTED-O6)
)
:effect
(and
(NOT-STARTED-O6)
(SHIPPED-O6)
(STACKS-IN-USE-N7)
(not (STARTED-O6))
(not (STACKS-IN-USE-N8))
)
)
(:action SHIP-ORDER-O5-N8-N7-0
:parameters ()
:precondition
(and
(STACKS-IN-USE-N8)
(STARTED-O5)
)
:effect
(and
(NOT-STARTED-O5)
(SHIPPED-O5)
(STACKS-IN-USE-N7)
(not (STARTED-O5))
(not (STACKS-IN-USE-N8))
)
)
(:action SHIP-ORDER-O4-N8-N7-0
:parameters ()
:precondition
(and
(STACKS-IN-USE-N8)
(STARTED-O4)
)
:effect
(and
(NOT-STARTED-O4)
(SHIPPED-O4)
(STACKS-IN-USE-N7)
(not (STARTED-O4))
(not (STACKS-IN-USE-N8))
)
)
(:action SHIP-ORDER-O3-N8-N7-0
:parameters ()
:precondition
(and
(STACKS-IN-USE-N8)
(STARTED-O3)
)
:effect
(and
(NOT-STARTED-O3)
(SHIPPED-O3)
(STACKS-IN-USE-N7)
(not (STARTED-O3))
(not (STACKS-IN-USE-N8))
)
)
(:action SHIP-ORDER-O2-N8-N7-0
:parameters ()
:precondition
(and
(STACKS-IN-USE-N8)
(STARTED-O2)
)
:effect
(and
(NOT-STARTED-O2)
(SHIPPED-O2)
(STACKS-IN-USE-N7)
(not (STARTED-O2))
(not (STACKS-IN-USE-N8))
)
)
(:action SHIP-ORDER-O1-N8-N7-0
:parameters ()
:precondition
(and
(STACKS-IN-USE-N8)
(STARTED-O1)
)
:effect
(and
(NOT-STARTED-O1)
(SHIPPED-O1)
(STACKS-IN-USE-N7)
(not (STARTED-O1))
(not (STACKS-IN-USE-N8))
)
)
(:action START-ORDER-O10-N7-N8-0
:parameters ()
:precondition
(and
(STACKS-IN-USE-N7)
(WAITING-O10)
)
:effect
(and
(STARTED-O10)
(STACKS-IN-USE-N8)
(not (WAITING-O10))
(not (NOT-STARTED-O10))
(not (STACKS-IN-USE-N7))
)
)
(:action START-ORDER-O9-N7-N8-0
:parameters ()
:precondition
(and
(STACKS-IN-USE-N7)
(WAITING-O9)
)
:effect
(and
(STARTED-O9)
(STACKS-IN-USE-N8)
(not (WAITING-O9))
(not (NOT-STARTED-O9))
(not (STACKS-IN-USE-N7))
)
)
(:action START-ORDER-O8-N7-N8-0
:parameters ()
:precondition
(and
(STACKS-IN-USE-N7)
(WAITING-O8)
)
:effect
(and
(STARTED-O8)
(STACKS-IN-USE-N8)
(not (WAITING-O8))
(not (NOT-STARTED-O8))
(not (STACKS-IN-USE-N7))
)
)
(:action START-ORDER-O7-N7-N8-0
:parameters ()
:precondition
(and
(STACKS-IN-USE-N7)
(WAITING-O7)
)
:effect
(and
(STARTED-O7)
(STACKS-IN-USE-N8)
(not (WAITING-O7))
(not (NOT-STARTED-O7))
(not (STACKS-IN-USE-N7))
)
)
(:action START-ORDER-O6-N7-N8-0
:parameters ()
:precondition
(and
(STACKS-IN-USE-N7)
(WAITING-O6)
)
:effect
(and
(STARTED-O6)
(STACKS-IN-USE-N8)
(not (WAITING-O6))
(not (NOT-STARTED-O6))
(not (STACKS-IN-USE-N7))
)
)
(:action START-ORDER-O5-N7-N8-0
:parameters ()
:precondition
(and
(STACKS-IN-USE-N7)
(WAITING-O5)
)
:effect
(and
(STARTED-O5)
(STACKS-IN-USE-N8)
(not (WAITING-O5))
(not (NOT-STARTED-O5))
(not (STACKS-IN-USE-N7))
)
)
(:action START-ORDER-O4-N7-N8-0
:parameters ()
:precondition
(and
(STACKS-IN-USE-N7)
(WAITING-O4)
)
:effect
(and
(STARTED-O4)
(STACKS-IN-USE-N8)
(not (WAITING-O4))
(not (NOT-STARTED-O4))
(not (STACKS-IN-USE-N7))
)
)
(:action START-ORDER-O3-N7-N8-0
:parameters ()
:precondition
(and
(STACKS-IN-USE-N7)
(WAITING-O3)
)
:effect
(and
(STARTED-O3)
(STACKS-IN-USE-N8)
(not (WAITING-O3))
(not (NOT-STARTED-O3))
(not (STACKS-IN-USE-N7))
)
)
(:action START-ORDER-O2-N7-N8-0
:parameters ()
:precondition
(and
(STACKS-IN-USE-N7)
(WAITING-O2)
)
:effect
(and
(STARTED-O2)
(STACKS-IN-USE-N8)
(not (WAITING-O2))
(not (NOT-STARTED-O2))
(not (STACKS-IN-USE-N7))
)
)
(:action START-ORDER-O1-N7-N8-0
:parameters ()
:precondition
(and
(STACKS-IN-USE-N7)
(WAITING-O1)
)
:effect
(and
(STARTED-O1)
(STACKS-IN-USE-N8)
(not (WAITING-O1))
(not (NOT-STARTED-O1))
(not (STACKS-IN-USE-N7))
)
)
(:action SHIP-ORDER-O10-N7-N6-0
:parameters ()
:precondition
(and
(STACKS-IN-USE-N7)
(STARTED-O10)
)
:effect
(and
(NOT-STARTED-O10)
(SHIPPED-O10)
(STACKS-IN-USE-N6)
(not (STARTED-O10))
(not (STACKS-IN-USE-N7))
)
)
(:action SHIP-ORDER-O9-N7-N6-0
:parameters ()
:precondition
(and
(STACKS-IN-USE-N7)
(STARTED-O9)
)
:effect
(and
(NOT-STARTED-O9)
(SHIPPED-O9)
(STACKS-IN-USE-N6)
(not (STARTED-O9))
(not (STACKS-IN-USE-N7))
)
)
(:action SHIP-ORDER-O8-N7-N6-0
:parameters ()
:precondition
(and
(STACKS-IN-USE-N7)
(STARTED-O8)
)
:effect
(and
(NOT-STARTED-O8)
(SHIPPED-O8)
(STACKS-IN-USE-N6)
(not (STARTED-O8))
(not (STACKS-IN-USE-N7))
)
)
(:action SHIP-ORDER-O7-N7-N6-0
:parameters ()
:precondition
(and
(STACKS-IN-USE-N7)
(STARTED-O7)
)
:effect
(and
(NOT-STARTED-O7)
(SHIPPED-O7)
(STACKS-IN-USE-N6)
(not (STARTED-O7))
(not (STACKS-IN-USE-N7))
)
)
(:action SHIP-ORDER-O6-N7-N6-0
:parameters ()
:precondition
(and
(STACKS-IN-USE-N7)
(STARTED-O6)
)
:effect
(and
(NOT-STARTED-O6)
(SHIPPED-O6)
(STACKS-IN-USE-N6)
(not (STARTED-O6))
(not (STACKS-IN-USE-N7))
)
)
(:action SHIP-ORDER-O5-N7-N6-0
:parameters ()
:precondition
(and
(STACKS-IN-USE-N7)
(STARTED-O5)
)
:effect
(and
(NOT-STARTED-O5)
(SHIPPED-O5)
(STACKS-IN-USE-N6)
(not (STARTED-O5))
(not (STACKS-IN-USE-N7))
)
)
(:action SHIP-ORDER-O4-N7-N6-0
:parameters ()
:precondition
(and
(STACKS-IN-USE-N7)
(STARTED-O4)
)
:effect
(and
(NOT-STARTED-O4)
(SHIPPED-O4)
(STACKS-IN-USE-N6)
(not (STARTED-O4))
(not (STACKS-IN-USE-N7))
)
)
(:action SHIP-ORDER-O3-N7-N6-0
:parameters ()
:precondition
(and
(STACKS-IN-USE-N7)
(STARTED-O3)
)
:effect
(and
(NOT-STARTED-O3)
(SHIPPED-O3)
(STACKS-IN-USE-N6)
(not (STARTED-O3))
(not (STACKS-IN-USE-N7))
)
)
(:action SHIP-ORDER-O2-N7-N6-0
:parameters ()
:precondition
(and
(STACKS-IN-USE-N7)
(STARTED-O2)
)
:effect
(and
(NOT-STARTED-O2)
(SHIPPED-O2)
(STACKS-IN-USE-N6)
(not (STARTED-O2))
(not (STACKS-IN-USE-N7))
)
)
(:action SHIP-ORDER-O1-N7-N6-0
:parameters ()
:precondition
(and
(STACKS-IN-USE-N7)
(STARTED-O1)
)
:effect
(and
(NOT-STARTED-O1)
(SHIPPED-O1)
(STACKS-IN-USE-N6)
(not (STARTED-O1))
(not (STACKS-IN-USE-N7))
)
)
(:action START-ORDER-O10-N6-N7-0
:parameters ()
:precondition
(and
(STACKS-IN-USE-N6)
(WAITING-O10)
)
:effect
(and
(STARTED-O10)
(STACKS-IN-USE-N7)
(not (WAITING-O10))
(not (NOT-STARTED-O10))
(not (STACKS-IN-USE-N6))
)
)
(:action START-ORDER-O9-N6-N7-0
:parameters ()
:precondition
(and
(STACKS-IN-USE-N6)
(WAITING-O9)
)
:effect
(and
(STARTED-O9)
(STACKS-IN-USE-N7)
(not (WAITING-O9))
(not (NOT-STARTED-O9))
(not (STACKS-IN-USE-N6))
)
)
(:action START-ORDER-O8-N6-N7-0
:parameters ()
:precondition
(and
(STACKS-IN-USE-N6)
(WAITING-O8)
)
:effect
(and
(STARTED-O8)
(STACKS-IN-USE-N7)
(not (WAITING-O8))
(not (NOT-STARTED-O8))
(not (STACKS-IN-USE-N6))
)
)
(:action START-ORDER-O7-N6-N7-0
:parameters ()
:precondition
(and
(STACKS-IN-USE-N6)
(WAITING-O7)
)
:effect
(and
(STARTED-O7)
(STACKS-IN-USE-N7)
(not (WAITING-O7))
(not (NOT-STARTED-O7))
(not (STACKS-IN-USE-N6))
)
)
(:action START-ORDER-O6-N6-N7-0
:parameters ()
:precondition
(and
(STACKS-IN-USE-N6)
(WAITING-O6)
)
:effect
(and
(STARTED-O6)
(STACKS-IN-USE-N7)
(not (WAITING-O6))
(not (NOT-STARTED-O6))
(not (STACKS-IN-USE-N6))
)
)
(:action START-ORDER-O5-N6-N7-0
:parameters ()
:precondition
(and
(STACKS-IN-USE-N6)
(WAITING-O5)
)
:effect
(and
(STARTED-O5)
(STACKS-IN-USE-N7)
(not (WAITING-O5))
(not (NOT-STARTED-O5))
(not (STACKS-IN-USE-N6))
)
)
(:action START-ORDER-O4-N6-N7-0
:parameters ()
:precondition
(and
(STACKS-IN-USE-N6)
(WAITING-O4)
)
:effect
(and
(STARTED-O4)
(STACKS-IN-USE-N7)
(not (WAITING-O4))
(not (NOT-STARTED-O4))
(not (STACKS-IN-USE-N6))
)
)
(:action START-ORDER-O3-N6-N7-0
:parameters ()
:precondition
(and
(STACKS-IN-USE-N6)
(WAITING-O3)
)
:effect
(and
(STARTED-O3)
(STACKS-IN-USE-N7)
(not (WAITING-O3))
(not (NOT-STARTED-O3))
(not (STACKS-IN-USE-N6))
)
)
(:action START-ORDER-O2-N6-N7-0
:parameters ()
:precondition
(and
(STACKS-IN-USE-N6)
(WAITING-O2)
)
:effect
(and
(STARTED-O2)
(STACKS-IN-USE-N7)
(not (WAITING-O2))
(not (NOT-STARTED-O2))
(not (STACKS-IN-USE-N6))
)
)
(:action START-ORDER-O1-N6-N7-0
:parameters ()
:precondition
(and
(STACKS-IN-USE-N6)
(WAITING-O1)
)
:effect
(and
(STARTED-O1)
(STACKS-IN-USE-N7)
(not (WAITING-O1))
(not (NOT-STARTED-O1))
(not (STACKS-IN-USE-N6))
)
)
(:action SHIP-ORDER-O10-N6-N5-0
:parameters ()
:precondition
(and
(STACKS-IN-USE-N6)
(STARTED-O10)
)
:effect
(and
(NOT-STARTED-O10)
(SHIPPED-O10)
(STACKS-IN-USE-N5)
(not (STARTED-O10))
(not (STACKS-IN-USE-N6))
)
)
(:action SHIP-ORDER-O9-N6-N5-0
:parameters ()
:precondition
(and
(STACKS-IN-USE-N6)
(STARTED-O9)
)
:effect
(and
(NOT-STARTED-O9)
(SHIPPED-O9)
(STACKS-IN-USE-N5)
(not (STARTED-O9))
(not (STACKS-IN-USE-N6))
)
)
(:action SHIP-ORDER-O8-N6-N5-0
:parameters ()
:precondition
(and
(STACKS-IN-USE-N6)
(STARTED-O8)
)
:effect
(and
(NOT-STARTED-O8)
(SHIPPED-O8)
(STACKS-IN-USE-N5)
(not (STARTED-O8))
(not (STACKS-IN-USE-N6))
)
)
(:action SHIP-ORDER-O7-N6-N5-0
:parameters ()
:precondition
(and
(STACKS-IN-USE-N6)
(STARTED-O7)
)
:effect
(and
(NOT-STARTED-O7)
(SHIPPED-O7)
(STACKS-IN-USE-N5)
(not (STARTED-O7))
(not (STACKS-IN-USE-N6))
)
)
(:action SHIP-ORDER-O6-N6-N5-0
:parameters ()
:precondition
(and
(STACKS-IN-USE-N6)
(STARTED-O6)
)
:effect
(and
(NOT-STARTED-O6)
(SHIPPED-O6)
(STACKS-IN-USE-N5)
(not (STARTED-O6))
(not (STACKS-IN-USE-N6))
)
)
(:action SHIP-ORDER-O5-N6-N5-0
:parameters ()
:precondition
(and
(STACKS-IN-USE-N6)
(STARTED-O5)
)
:effect
(and
(NOT-STARTED-O5)
(SHIPPED-O5)
(STACKS-IN-USE-N5)
(not (STARTED-O5))
(not (STACKS-IN-USE-N6))
)
)
(:action SHIP-ORDER-O4-N6-N5-0
:parameters ()
:precondition
(and
(STACKS-IN-USE-N6)
(STARTED-O4)
)
:effect
(and
(NOT-STARTED-O4)
(SHIPPED-O4)
(STACKS-IN-USE-N5)
(not (STARTED-O4))
(not (STACKS-IN-USE-N6))
)
)
(:action SHIP-ORDER-O3-N6-N5-0
:parameters ()
:precondition
(and
(STACKS-IN-USE-N6)
(STARTED-O3)
)
:effect
(and
(NOT-STARTED-O3)
(SHIPPED-O3)
(STACKS-IN-USE-N5)
(not (STARTED-O3))
(not (STACKS-IN-USE-N6))
)
)
(:action SHIP-ORDER-O2-N6-N5-0
:parameters ()
:precondition
(and
(STACKS-IN-USE-N6)
(STARTED-O2)
)
:effect
(and
(NOT-STARTED-O2)
(SHIPPED-O2)
(STACKS-IN-USE-N5)
(not (STARTED-O2))
(not (STACKS-IN-USE-N6))
)
)
(:action SHIP-ORDER-O1-N6-N5-0
:parameters ()
:precondition
(and
(STACKS-IN-USE-N6)
(STARTED-O1)
)
:effect
(and
(NOT-STARTED-O1)
(SHIPPED-O1)
(STACKS-IN-USE-N5)
(not (STARTED-O1))
(not (STACKS-IN-USE-N6))
)
)
(:action START-ORDER-O10-N5-N6-0
:parameters ()
:precondition
(and
(STACKS-IN-USE-N5)
(WAITING-O10)
)
:effect
(and
(STARTED-O10)
(STACKS-IN-USE-N6)
(not (WAITING-O10))
(not (NOT-STARTED-O10))
(not (STACKS-IN-USE-N5))
)
)
(:action START-ORDER-O9-N5-N6-0
:parameters ()
:precondition
(and
(STACKS-IN-USE-N5)
(WAITING-O9)
)
:effect
(and
(STARTED-O9)
(STACKS-IN-USE-N6)
(not (WAITING-O9))
(not (NOT-STARTED-O9))
(not (STACKS-IN-USE-N5))
)
)
(:action START-ORDER-O8-N5-N6-0
:parameters ()
:precondition
(and
(STACKS-IN-USE-N5)
(WAITING-O8)
)
:effect
(and
(STARTED-O8)
(STACKS-IN-USE-N6)
(not (WAITING-O8))
(not (NOT-STARTED-O8))
(not (STACKS-IN-USE-N5))
)
)
(:action START-ORDER-O7-N5-N6-0
:parameters ()
:precondition
(and
(STACKS-IN-USE-N5)
(WAITING-O7)
)
:effect
(and
(STARTED-O7)
(STACKS-IN-USE-N6)
(not (WAITING-O7))
(not (NOT-STARTED-O7))
(not (STACKS-IN-USE-N5))
)
)
(:action START-ORDER-O6-N5-N6-0
:parameters ()
:precondition
(and
(STACKS-IN-USE-N5)
(WAITING-O6)
)
:effect
(and
(STARTED-O6)
(STACKS-IN-USE-N6)
(not (WAITING-O6))
(not (NOT-STARTED-O6))
(not (STACKS-IN-USE-N5))
)
)
(:action START-ORDER-O5-N5-N6-0
:parameters ()
:precondition
(and
(STACKS-IN-USE-N5)
(WAITING-O5)
)
:effect
(and
(STARTED-O5)
(STACKS-IN-USE-N6)
(not (WAITING-O5))
(not (NOT-STARTED-O5))
(not (STACKS-IN-USE-N5))
)
)
(:action START-ORDER-O4-N5-N6-0
:parameters ()
:precondition
(and
(STACKS-IN-USE-N5)
(WAITING-O4)
)
:effect
(and
(STARTED-O4)
(STACKS-IN-USE-N6)
(not (WAITING-O4))
(not (NOT-STARTED-O4))
(not (STACKS-IN-USE-N5))
)
)
(:action START-ORDER-O3-N5-N6-0
:parameters ()
:precondition
(and
(STACKS-IN-USE-N5)
(WAITING-O3)
)
:effect
(and
(STARTED-O3)
(STACKS-IN-USE-N6)
(not (WAITING-O3))
(not (NOT-STARTED-O3))
(not (STACKS-IN-USE-N5))
)
)
(:action START-ORDER-O2-N5-N6-0
:parameters ()
:precondition
(and
(STACKS-IN-USE-N5)
(WAITING-O2)
)
:effect
(and
(STARTED-O2)
(STACKS-IN-USE-N6)
(not (WAITING-O2))
(not (NOT-STARTED-O2))
(not (STACKS-IN-USE-N5))
)
)
(:action START-ORDER-O1-N5-N6-0
:parameters ()
:precondition
(and
(STACKS-IN-USE-N5)
(WAITING-O1)
)
:effect
(and
(STARTED-O1)
(STACKS-IN-USE-N6)
(not (WAITING-O1))
(not (NOT-STARTED-O1))
(not (STACKS-IN-USE-N5))
)
)
(:action SHIP-ORDER-O10-N5-N4-0
:parameters ()
:precondition
(and
(STACKS-IN-USE-N5)
(STARTED-O10)
)
:effect
(and
(NOT-STARTED-O10)
(SHIPPED-O10)
(STACKS-IN-USE-N4)
(not (STARTED-O10))
(not (STACKS-IN-USE-N5))
)
)
(:action SHIP-ORDER-O9-N5-N4-0
:parameters ()
:precondition
(and
(STACKS-IN-USE-N5)
(STARTED-O9)
)
:effect
(and
(NOT-STARTED-O9)
(SHIPPED-O9)
(STACKS-IN-USE-N4)
(not (STARTED-O9))
(not (STACKS-IN-USE-N5))
)
)
(:action SHIP-ORDER-O8-N5-N4-0
:parameters ()
:precondition
(and
(STACKS-IN-USE-N5)
(STARTED-O8)
)
:effect
(and
(NOT-STARTED-O8)
(SHIPPED-O8)
(STACKS-IN-USE-N4)
(not (STARTED-O8))
(not (STACKS-IN-USE-N5))
)
)
(:action SHIP-ORDER-O7-N5-N4-0
:parameters ()
:precondition
(and
(STACKS-IN-USE-N5)
(STARTED-O7)
)
:effect
(and
(NOT-STARTED-O7)
(SHIPPED-O7)
(STACKS-IN-USE-N4)
(not (STARTED-O7))
(not (STACKS-IN-USE-N5))
)
)
(:action SHIP-ORDER-O6-N5-N4-0
:parameters ()
:precondition
(and
(STACKS-IN-USE-N5)
(STARTED-O6)
)
:effect
(and
(NOT-STARTED-O6)
(SHIPPED-O6)
(STACKS-IN-USE-N4)
(not (STARTED-O6))
(not (STACKS-IN-USE-N5))
)
)
(:action SHIP-ORDER-O5-N5-N4-0
:parameters ()
:precondition
(and
(STACKS-IN-USE-N5)
(STARTED-O5)
)
:effect
(and
(NOT-STARTED-O5)
(SHIPPED-O5)
(STACKS-IN-USE-N4)
(not (STARTED-O5))
(not (STACKS-IN-USE-N5))
)
)
(:action SHIP-ORDER-O4-N5-N4-0
:parameters ()
:precondition
(and
(STACKS-IN-USE-N5)
(STARTED-O4)
)
:effect
(and
(NOT-STARTED-O4)
(SHIPPED-O4)
(STACKS-IN-USE-N4)
(not (STARTED-O4))
(not (STACKS-IN-USE-N5))
)
)
(:action SHIP-ORDER-O3-N5-N4-0
:parameters ()
:precondition
(and
(STACKS-IN-USE-N5)
(STARTED-O3)
)
:effect
(and
(NOT-STARTED-O3)
(SHIPPED-O3)
(STACKS-IN-USE-N4)
(not (STARTED-O3))
(not (STACKS-IN-USE-N5))
)
)
(:action SHIP-ORDER-O2-N5-N4-0
:parameters ()
:precondition
(and
(STACKS-IN-USE-N5)
(STARTED-O2)
)
:effect
(and
(NOT-STARTED-O2)
(SHIPPED-O2)
(STACKS-IN-USE-N4)
(not (STARTED-O2))
(not (STACKS-IN-USE-N5))
)
)
(:action SHIP-ORDER-O1-N5-N4-0
:parameters ()
:precondition
(and
(STACKS-IN-USE-N5)
(STARTED-O1)
)
:effect
(and
(NOT-STARTED-O1)
(SHIPPED-O1)
(STACKS-IN-USE-N4)
(not (STARTED-O1))
(not (STACKS-IN-USE-N5))
)
)
(:action START-ORDER-O10-N4-N5-0
:parameters ()
:precondition
(and
(STACKS-IN-USE-N4)
(WAITING-O10)
)
:effect
(and
(STARTED-O10)
(STACKS-IN-USE-N5)
(not (WAITING-O10))
(not (NOT-STARTED-O10))
(not (STACKS-IN-USE-N4))
)
)
(:action START-ORDER-O9-N4-N5-0
:parameters ()
:precondition
(and
(STACKS-IN-USE-N4)
(WAITING-O9)
)
:effect
(and
(STARTED-O9)
(STACKS-IN-USE-N5)
(not (WAITING-O9))
(not (NOT-STARTED-O9))
(not (STACKS-IN-USE-N4))
)
)
(:action START-ORDER-O8-N4-N5-0
:parameters ()
:precondition
(and
(STACKS-IN-USE-N4)
(WAITING-O8)
)
:effect
(and
(STARTED-O8)
(STACKS-IN-USE-N5)
(not (WAITING-O8))
(not (NOT-STARTED-O8))
(not (STACKS-IN-USE-N4))
)
)
(:action START-ORDER-O7-N4-N5-0
:parameters ()
:precondition
(and
(STACKS-IN-USE-N4)
(WAITING-O7)
)
:effect
(and
(STARTED-O7)
(STACKS-IN-USE-N5)
(not (WAITING-O7))
(not (NOT-STARTED-O7))
(not (STACKS-IN-USE-N4))
)
)
(:action START-ORDER-O6-N4-N5-0
:parameters ()
:precondition
(and
(STACKS-IN-USE-N4)
(WAITING-O6)
)
:effect
(and
(STARTED-O6)
(STACKS-IN-USE-N5)
(not (WAITING-O6))
(not (NOT-STARTED-O6))
(not (STACKS-IN-USE-N4))
)
)
(:action START-ORDER-O5-N4-N5-0
:parameters ()
:precondition
(and
(STACKS-IN-USE-N4)
(WAITING-O5)
)
:effect
(and
(STARTED-O5)
(STACKS-IN-USE-N5)
(not (WAITING-O5))
(not (NOT-STARTED-O5))
(not (STACKS-IN-USE-N4))
)
)
(:action START-ORDER-O4-N4-N5-0
:parameters ()
:precondition
(and
(STACKS-IN-USE-N4)
(WAITING-O4)
)
:effect
(and
(STARTED-O4)
(STACKS-IN-USE-N5)
(not (WAITING-O4))
(not (NOT-STARTED-O4))
(not (STACKS-IN-USE-N4))
)
)
(:action START-ORDER-O3-N4-N5-0
:parameters ()
:precondition
(and
(STACKS-IN-USE-N4)
(WAITING-O3)
)
:effect
(and
(STARTED-O3)
(STACKS-IN-USE-N5)
(not (WAITING-O3))
(not (NOT-STARTED-O3))
(not (STACKS-IN-USE-N4))
)
)
(:action START-ORDER-O2-N4-N5-0
:parameters ()
:precondition
(and
(STACKS-IN-USE-N4)
(WAITING-O2)
)
:effect
(and
(STARTED-O2)
(STACKS-IN-USE-N5)
(not (WAITING-O2))
(not (NOT-STARTED-O2))
(not (STACKS-IN-USE-N4))
)
)
(:action START-ORDER-O1-N4-N5-0
:parameters ()
:precondition
(and
(STACKS-IN-USE-N4)
(WAITING-O1)
)
:effect
(and
(STARTED-O1)
(STACKS-IN-USE-N5)
(not (WAITING-O1))
(not (NOT-STARTED-O1))
(not (STACKS-IN-USE-N4))
)
)
(:action SHIP-ORDER-O10-N4-N3-0
:parameters ()
:precondition
(and
(STACKS-IN-USE-N4)
(STARTED-O10)
)
:effect
(and
(NOT-STARTED-O10)
(SHIPPED-O10)
(STACKS-IN-USE-N3)
(not (STARTED-O10))
(not (STACKS-IN-USE-N4))
)
)
(:action SHIP-ORDER-O9-N4-N3-0
:parameters ()
:precondition
(and
(STACKS-IN-USE-N4)
(STARTED-O9)
)
:effect
(and
(NOT-STARTED-O9)
(SHIPPED-O9)
(STACKS-IN-USE-N3)
(not (STARTED-O9))
(not (STACKS-IN-USE-N4))
)
)
(:action SHIP-ORDER-O8-N4-N3-0
:parameters ()
:precondition
(and
(STACKS-IN-USE-N4)
(STARTED-O8)
)
:effect
(and
(NOT-STARTED-O8)
(SHIPPED-O8)
(STACKS-IN-USE-N3)
(not (STARTED-O8))
(not (STACKS-IN-USE-N4))
)
)
(:action SHIP-ORDER-O7-N4-N3-0
:parameters ()
:precondition
(and
(STACKS-IN-USE-N4)
(STARTED-O7)
)
:effect
(and
(NOT-STARTED-O7)
(SHIPPED-O7)
(STACKS-IN-USE-N3)
(not (STARTED-O7))
(not (STACKS-IN-USE-N4))
)
)
(:action SHIP-ORDER-O6-N4-N3-0
:parameters ()
:precondition
(and
(STACKS-IN-USE-N4)
(STARTED-O6)
)
:effect
(and
(NOT-STARTED-O6)
(SHIPPED-O6)
(STACKS-IN-USE-N3)
(not (STARTED-O6))
(not (STACKS-IN-USE-N4))
)
)
(:action SHIP-ORDER-O5-N4-N3-0
:parameters ()
:precondition
(and
(STACKS-IN-USE-N4)
(STARTED-O5)
)
:effect
(and
(NOT-STARTED-O5)
(SHIPPED-O5)
(STACKS-IN-USE-N3)
(not (STARTED-O5))
(not (STACKS-IN-USE-N4))
)
)
(:action SHIP-ORDER-O4-N4-N3-0
:parameters ()
:precondition
(and
(STACKS-IN-USE-N4)
(STARTED-O4)
)
:effect
(and
(NOT-STARTED-O4)
(SHIPPED-O4)
(STACKS-IN-USE-N3)
(not (STARTED-O4))
(not (STACKS-IN-USE-N4))
)
)
(:action SHIP-ORDER-O3-N4-N3-0
:parameters ()
:precondition
(and
(STACKS-IN-USE-N4)
(STARTED-O3)
)
:effect
(and
(NOT-STARTED-O3)
(SHIPPED-O3)
(STACKS-IN-USE-N3)
(not (STARTED-O3))
(not (STACKS-IN-USE-N4))
)
)
(:action SHIP-ORDER-O2-N4-N3-0
:parameters ()
:precondition
(and
(STACKS-IN-USE-N4)
(STARTED-O2)
)
:effect
(and
(NOT-STARTED-O2)
(SHIPPED-O2)
(STACKS-IN-USE-N3)
(not (STARTED-O2))
(not (STACKS-IN-USE-N4))
)
)
(:action SHIP-ORDER-O1-N4-N3-0
:parameters ()
:precondition
(and
(STACKS-IN-USE-N4)
(STARTED-O1)
)
:effect
(and
(NOT-STARTED-O1)
(SHIPPED-O1)
(STACKS-IN-USE-N3)
(not (STARTED-O1))
(not (STACKS-IN-USE-N4))
)
)
(:action START-ORDER-O10-N3-N4-0
:parameters ()
:precondition
(and
(STACKS-IN-USE-N3)
(WAITING-O10)
)
:effect
(and
(STARTED-O10)
(STACKS-IN-USE-N4)
(not (WAITING-O10))
(not (NOT-STARTED-O10))
(not (STACKS-IN-USE-N3))
)
)
(:action START-ORDER-O9-N3-N4-0
:parameters ()
:precondition
(and
(STACKS-IN-USE-N3)
(WAITING-O9)
)
:effect
(and
(STARTED-O9)
(STACKS-IN-USE-N4)
(not (WAITING-O9))
(not (NOT-STARTED-O9))
(not (STACKS-IN-USE-N3))
)
)
(:action START-ORDER-O8-N3-N4-0
:parameters ()
:precondition
(and
(STACKS-IN-USE-N3)
(WAITING-O8)
)
:effect
(and
(STARTED-O8)
(STACKS-IN-USE-N4)
(not (WAITING-O8))
(not (NOT-STARTED-O8))
(not (STACKS-IN-USE-N3))
)
)
(:action START-ORDER-O7-N3-N4-0
:parameters ()
:precondition
(and
(STACKS-IN-USE-N3)
(WAITING-O7)
)
:effect
(and
(STARTED-O7)
(STACKS-IN-USE-N4)
(not (WAITING-O7))
(not (NOT-STARTED-O7))
(not (STACKS-IN-USE-N3))
)
)
(:action START-ORDER-O6-N3-N4-0
:parameters ()
:precondition
(and
(STACKS-IN-USE-N3)
(WAITING-O6)
)
:effect
(and
(STARTED-O6)
(STACKS-IN-USE-N4)
(not (WAITING-O6))
(not (NOT-STARTED-O6))
(not (STACKS-IN-USE-N3))
)
)
(:action START-ORDER-O5-N3-N4-0
:parameters ()
:precondition
(and
(STACKS-IN-USE-N3)
(WAITING-O5)
)
:effect
(and
(STARTED-O5)
(STACKS-IN-USE-N4)
(not (WAITING-O5))
(not (NOT-STARTED-O5))
(not (STACKS-IN-USE-N3))
)
)
(:action START-ORDER-O4-N3-N4-0
:parameters ()
:precondition
(and
(STACKS-IN-USE-N3)
(WAITING-O4)
)
:effect
(and
(STARTED-O4)
(STACKS-IN-USE-N4)
(not (WAITING-O4))
(not (NOT-STARTED-O4))
(not (STACKS-IN-USE-N3))
)
)
(:action START-ORDER-O3-N3-N4-0
:parameters ()
:precondition
(and
(STACKS-IN-USE-N3)
(WAITING-O3)
)
:effect
(and
(STARTED-O3)
(STACKS-IN-USE-N4)
(not (WAITING-O3))
(not (NOT-STARTED-O3))
(not (STACKS-IN-USE-N3))
)
)
(:action START-ORDER-O2-N3-N4-0
:parameters ()
:precondition
(and
(STACKS-IN-USE-N3)
(WAITING-O2)
)
:effect
(and
(STARTED-O2)
(STACKS-IN-USE-N4)
(not (WAITING-O2))
(not (NOT-STARTED-O2))
(not (STACKS-IN-USE-N3))
)
)
(:action START-ORDER-O1-N3-N4-0
:parameters ()
:precondition
(and
(STACKS-IN-USE-N3)
(WAITING-O1)
)
:effect
(and
(STARTED-O1)
(STACKS-IN-USE-N4)
(not (WAITING-O1))
(not (NOT-STARTED-O1))
(not (STACKS-IN-USE-N3))
)
)
(:action SHIP-ORDER-O10-N3-N2-0
:parameters ()
:precondition
(and
(STACKS-IN-USE-N3)
(STARTED-O10)
)
:effect
(and
(NOT-STARTED-O10)
(SHIPPED-O10)
(STACKS-IN-USE-N2)
(not (STARTED-O10))
(not (STACKS-IN-USE-N3))
)
)
(:action SHIP-ORDER-O9-N3-N2-0
:parameters ()
:precondition
(and
(STACKS-IN-USE-N3)
(STARTED-O9)
)
:effect
(and
(NOT-STARTED-O9)
(SHIPPED-O9)
(STACKS-IN-USE-N2)
(not (STARTED-O9))
(not (STACKS-IN-USE-N3))
)
)
(:action SHIP-ORDER-O8-N3-N2-0
:parameters ()
:precondition
(and
(STACKS-IN-USE-N3)
(STARTED-O8)
)
:effect
(and
(NOT-STARTED-O8)
(SHIPPED-O8)
(STACKS-IN-USE-N2)
(not (STARTED-O8))
(not (STACKS-IN-USE-N3))
)
)
(:action SHIP-ORDER-O7-N3-N2-0
:parameters ()
:precondition
(and
(STACKS-IN-USE-N3)
(STARTED-O7)
)
:effect
(and
(NOT-STARTED-O7)
(SHIPPED-O7)
(STACKS-IN-USE-N2)
(not (STARTED-O7))
(not (STACKS-IN-USE-N3))
)
)
(:action SHIP-ORDER-O6-N3-N2-0
:parameters ()
:precondition
(and
(STACKS-IN-USE-N3)
(STARTED-O6)
)
:effect
(and
(NOT-STARTED-O6)
(SHIPPED-O6)
(STACKS-IN-USE-N2)
(not (STARTED-O6))
(not (STACKS-IN-USE-N3))
)
)
(:action SHIP-ORDER-O5-N3-N2-0
:parameters ()
:precondition
(and
(STACKS-IN-USE-N3)
(STARTED-O5)
)
:effect
(and
(NOT-STARTED-O5)
(SHIPPED-O5)
(STACKS-IN-USE-N2)
(not (STARTED-O5))
(not (STACKS-IN-USE-N3))
)
)
(:action SHIP-ORDER-O4-N3-N2-0
:parameters ()
:precondition
(and
(STACKS-IN-USE-N3)
(STARTED-O4)
)
:effect
(and
(NOT-STARTED-O4)
(SHIPPED-O4)
(STACKS-IN-USE-N2)
(not (STARTED-O4))
(not (STACKS-IN-USE-N3))
)
)
(:action SHIP-ORDER-O3-N3-N2-0
:parameters ()
:precondition
(and
(STACKS-IN-USE-N3)
(STARTED-O3)
)
:effect
(and
(NOT-STARTED-O3)
(SHIPPED-O3)
(STACKS-IN-USE-N2)
(not (STARTED-O3))
(not (STACKS-IN-USE-N3))
)
)
(:action SHIP-ORDER-O2-N3-N2-0
:parameters ()
:precondition
(and
(STACKS-IN-USE-N3)
(STARTED-O2)
)
:effect
(and
(NOT-STARTED-O2)
(SHIPPED-O2)
(STACKS-IN-USE-N2)
(not (STARTED-O2))
(not (STACKS-IN-USE-N3))
)
)
(:action SHIP-ORDER-O1-N3-N2-0
:parameters ()
:precondition
(and
(STACKS-IN-USE-N3)
(STARTED-O1)
)
:effect
(and
(NOT-STARTED-O1)
(SHIPPED-O1)
(STACKS-IN-USE-N2)
(not (STARTED-O1))
(not (STACKS-IN-USE-N3))
)
)
(:action START-ORDER-O10-N2-N3-0
:parameters ()
:precondition
(and
(STACKS-IN-USE-N2)
(WAITING-O10)
)
:effect
(and
(STARTED-O10)
(STACKS-IN-USE-N3)
(not (WAITING-O10))
(not (NOT-STARTED-O10))
(not (STACKS-IN-USE-N2))
)
)
(:action START-ORDER-O9-N2-N3-0
:parameters ()
:precondition
(and
(STACKS-IN-USE-N2)
(WAITING-O9)
)
:effect
(and
(STARTED-O9)
(STACKS-IN-USE-N3)
(not (WAITING-O9))
(not (NOT-STARTED-O9))
(not (STACKS-IN-USE-N2))
)
)
(:action START-ORDER-O8-N2-N3-0
:parameters ()
:precondition
(and
(STACKS-IN-USE-N2)
(WAITING-O8)
)
:effect
(and
(STARTED-O8)
(STACKS-IN-USE-N3)
(not (WAITING-O8))
(not (NOT-STARTED-O8))
(not (STACKS-IN-USE-N2))
)
)
(:action START-ORDER-O7-N2-N3-0
:parameters ()
:precondition
(and
(STACKS-IN-USE-N2)
(WAITING-O7)
)
:effect
(and
(STARTED-O7)
(STACKS-IN-USE-N3)
(not (WAITING-O7))
(not (NOT-STARTED-O7))
(not (STACKS-IN-USE-N2))
)
)
(:action START-ORDER-O6-N2-N3-0
:parameters ()
:precondition
(and
(STACKS-IN-USE-N2)
(WAITING-O6)
)
:effect
(and
(STARTED-O6)
(STACKS-IN-USE-N3)
(not (WAITING-O6))
(not (NOT-STARTED-O6))
(not (STACKS-IN-USE-N2))
)
)
(:action START-ORDER-O5-N2-N3-0
:parameters ()
:precondition
(and
(STACKS-IN-USE-N2)
(WAITING-O5)
)
:effect
(and
(STARTED-O5)
(STACKS-IN-USE-N3)
(not (WAITING-O5))
(not (NOT-STARTED-O5))
(not (STACKS-IN-USE-N2))
)
)
(:action START-ORDER-O4-N2-N3-0
:parameters ()
:precondition
(and
(STACKS-IN-USE-N2)
(WAITING-O4)
)
:effect
(and
(STARTED-O4)
(STACKS-IN-USE-N3)
(not (WAITING-O4))
(not (NOT-STARTED-O4))
(not (STACKS-IN-USE-N2))
)
)
(:action START-ORDER-O3-N2-N3-0
:parameters ()
:precondition
(and
(STACKS-IN-USE-N2)
(WAITING-O3)
)
:effect
(and
(STARTED-O3)
(STACKS-IN-USE-N3)
(not (WAITING-O3))
(not (NOT-STARTED-O3))
(not (STACKS-IN-USE-N2))
)
)
(:action START-ORDER-O2-N2-N3-0
:parameters ()
:precondition
(and
(STACKS-IN-USE-N2)
(WAITING-O2)
)
:effect
(and
(STARTED-O2)
(STACKS-IN-USE-N3)
(not (WAITING-O2))
(not (NOT-STARTED-O2))
(not (STACKS-IN-USE-N2))
)
)
(:action START-ORDER-O1-N2-N3-0
:parameters ()
:precondition
(and
(STACKS-IN-USE-N2)
(WAITING-O1)
)
:effect
(and
(STARTED-O1)
(STACKS-IN-USE-N3)
(not (WAITING-O1))
(not (NOT-STARTED-O1))
(not (STACKS-IN-USE-N2))
)
)
(:action SHIP-ORDER-O10-N2-N1-0
:parameters ()
:precondition
(and
(STACKS-IN-USE-N2)
(STARTED-O10)
)
:effect
(and
(NOT-STARTED-O10)
(SHIPPED-O10)
(STACKS-IN-USE-N1)
(not (STARTED-O10))
(not (STACKS-IN-USE-N2))
)
)
(:action SHIP-ORDER-O9-N2-N1-0
:parameters ()
:precondition
(and
(STACKS-IN-USE-N2)
(STARTED-O9)
)
:effect
(and
(NOT-STARTED-O9)
(SHIPPED-O9)
(STACKS-IN-USE-N1)
(not (STARTED-O9))
(not (STACKS-IN-USE-N2))
)
)
(:action SHIP-ORDER-O8-N2-N1-0
:parameters ()
:precondition
(and
(STACKS-IN-USE-N2)
(STARTED-O8)
)
:effect
(and
(NOT-STARTED-O8)
(SHIPPED-O8)
(STACKS-IN-USE-N1)
(not (STARTED-O8))
(not (STACKS-IN-USE-N2))
)
)
(:action SHIP-ORDER-O7-N2-N1-0
:parameters ()
:precondition
(and
(STACKS-IN-USE-N2)
(STARTED-O7)
)
:effect
(and
(NOT-STARTED-O7)
(SHIPPED-O7)
(STACKS-IN-USE-N1)
(not (STARTED-O7))
(not (STACKS-IN-USE-N2))
)
)
(:action SHIP-ORDER-O6-N2-N1-0
:parameters ()
:precondition
(and
(STACKS-IN-USE-N2)
(STARTED-O6)
)
:effect
(and
(NOT-STARTED-O6)
(SHIPPED-O6)
(STACKS-IN-USE-N1)
(not (STARTED-O6))
(not (STACKS-IN-USE-N2))
)
)
(:action SHIP-ORDER-O5-N2-N1-0
:parameters ()
:precondition
(and
(STACKS-IN-USE-N2)
(STARTED-O5)
)
:effect
(and
(NOT-STARTED-O5)
(SHIPPED-O5)
(STACKS-IN-USE-N1)
(not (STARTED-O5))
(not (STACKS-IN-USE-N2))
)
)
(:action SHIP-ORDER-O4-N2-N1-0
:parameters ()
:precondition
(and
(STACKS-IN-USE-N2)
(STARTED-O4)
)
:effect
(and
(NOT-STARTED-O4)
(SHIPPED-O4)
(STACKS-IN-USE-N1)
(not (STARTED-O4))
(not (STACKS-IN-USE-N2))
)
)
(:action SHIP-ORDER-O3-N2-N1-0
:parameters ()
:precondition
(and
(STACKS-IN-USE-N2)
(STARTED-O3)
)
:effect
(and
(NOT-STARTED-O3)
(SHIPPED-O3)
(STACKS-IN-USE-N1)
(not (STARTED-O3))
(not (STACKS-IN-USE-N2))
)
)
(:action SHIP-ORDER-O2-N2-N1-0
:parameters ()
:precondition
(and
(STACKS-IN-USE-N2)
(STARTED-O2)
)
:effect
(and
(NOT-STARTED-O2)
(SHIPPED-O2)
(STACKS-IN-USE-N1)
(not (STARTED-O2))
(not (STACKS-IN-USE-N2))
)
)
(:action SHIP-ORDER-O1-N2-N1-0
:parameters ()
:precondition
(and
(STACKS-IN-USE-N2)
(STARTED-O1)
)
:effect
(and
(NOT-STARTED-O1)
(SHIPPED-O1)
(STACKS-IN-USE-N1)
(not (STARTED-O1))
(not (STACKS-IN-USE-N2))
)
)
(:action START-ORDER-O10-N1-N2-0
:parameters ()
:precondition
(and
(STACKS-IN-USE-N1)
(WAITING-O10)
)
:effect
(and
(STARTED-O10)
(STACKS-IN-USE-N2)
(not (WAITING-O10))
(not (NOT-STARTED-O10))
(not (STACKS-IN-USE-N1))
)
)
(:action START-ORDER-O9-N1-N2-0
:parameters ()
:precondition
(and
(STACKS-IN-USE-N1)
(WAITING-O9)
)
:effect
(and
(STARTED-O9)
(STACKS-IN-USE-N2)
(not (WAITING-O9))
(not (NOT-STARTED-O9))
(not (STACKS-IN-USE-N1))
)
)
(:action START-ORDER-O8-N1-N2-0
:parameters ()
:precondition
(and
(STACKS-IN-USE-N1)
(WAITING-O8)
)
:effect
(and
(STARTED-O8)
(STACKS-IN-USE-N2)
(not (WAITING-O8))
(not (NOT-STARTED-O8))
(not (STACKS-IN-USE-N1))
)
)
(:action START-ORDER-O7-N1-N2-0
:parameters ()
:precondition
(and
(STACKS-IN-USE-N1)
(WAITING-O7)
)
:effect
(and
(STARTED-O7)
(STACKS-IN-USE-N2)
(not (WAITING-O7))
(not (NOT-STARTED-O7))
(not (STACKS-IN-USE-N1))
)
)
(:action START-ORDER-O6-N1-N2-0
:parameters ()
:precondition
(and
(STACKS-IN-USE-N1)
(WAITING-O6)
)
:effect
(and
(STARTED-O6)
(STACKS-IN-USE-N2)
(not (WAITING-O6))
(not (NOT-STARTED-O6))
(not (STACKS-IN-USE-N1))
)
)
(:action START-ORDER-O5-N1-N2-0
:parameters ()
:precondition
(and
(STACKS-IN-USE-N1)
(WAITING-O5)
)
:effect
(and
(STARTED-O5)
(STACKS-IN-USE-N2)
(not (WAITING-O5))
(not (NOT-STARTED-O5))
(not (STACKS-IN-USE-N1))
)
)
(:action START-ORDER-O4-N1-N2-0
:parameters ()
:precondition
(and
(STACKS-IN-USE-N1)
(WAITING-O4)
)
:effect
(and
(STARTED-O4)
(STACKS-IN-USE-N2)
(not (WAITING-O4))
(not (NOT-STARTED-O4))
(not (STACKS-IN-USE-N1))
)
)
(:action START-ORDER-O3-N1-N2-0
:parameters ()
:precondition
(and
(STACKS-IN-USE-N1)
(WAITING-O3)
)
:effect
(and
(STARTED-O3)
(STACKS-IN-USE-N2)
(not (WAITING-O3))
(not (NOT-STARTED-O3))
(not (STACKS-IN-USE-N1))
)
)
(:action START-ORDER-O2-N1-N2-0
:parameters ()
:precondition
(and
(STACKS-IN-USE-N1)
(WAITING-O2)
)
:effect
(and
(STARTED-O2)
(STACKS-IN-USE-N2)
(not (WAITING-O2))
(not (NOT-STARTED-O2))
(not (STACKS-IN-USE-N1))
)
)
(:action START-ORDER-O1-N1-N2-0
:parameters ()
:precondition
(and
(STACKS-IN-USE-N1)
(WAITING-O1)
)
:effect
(and
(STARTED-O1)
(STACKS-IN-USE-N2)
(not (WAITING-O1))
(not (NOT-STARTED-O1))
(not (STACKS-IN-USE-N1))
)
)
(:action SHIP-ORDER-O10-N1-N0-0
:parameters ()
:precondition
(and
(STACKS-IN-USE-N1)
(STARTED-O10)
)
:effect
(and
(NOT-STARTED-O10)
(SHIPPED-O10)
(STACKS-IN-USE-N0)
(not (STARTED-O10))
(not (STACKS-IN-USE-N1))
)
)
(:action SHIP-ORDER-O9-N1-N0-0
:parameters ()
:precondition
(and
(STACKS-IN-USE-N1)
(STARTED-O9)
)
:effect
(and
(NOT-STARTED-O9)
(SHIPPED-O9)
(STACKS-IN-USE-N0)
(not (STARTED-O9))
(not (STACKS-IN-USE-N1))
)
)
(:action SHIP-ORDER-O8-N1-N0-0
:parameters ()
:precondition
(and
(STACKS-IN-USE-N1)
(STARTED-O8)
)
:effect
(and
(NOT-STARTED-O8)
(SHIPPED-O8)
(STACKS-IN-USE-N0)
(not (STARTED-O8))
(not (STACKS-IN-USE-N1))
)
)
(:action SHIP-ORDER-O7-N1-N0-0
:parameters ()
:precondition
(and
(STACKS-IN-USE-N1)
(STARTED-O7)
)
:effect
(and
(NOT-STARTED-O7)
(SHIPPED-O7)
(STACKS-IN-USE-N0)
(not (STARTED-O7))
(not (STACKS-IN-USE-N1))
)
)
(:action SHIP-ORDER-O6-N1-N0-0
:parameters ()
:precondition
(and
(STACKS-IN-USE-N1)
(STARTED-O6)
)
:effect
(and
(NOT-STARTED-O6)
(SHIPPED-O6)
(STACKS-IN-USE-N0)
(not (STARTED-O6))
(not (STACKS-IN-USE-N1))
)
)
(:action SHIP-ORDER-O5-N1-N0-0
:parameters ()
:precondition
(and
(STACKS-IN-USE-N1)
(STARTED-O5)
)
:effect
(and
(NOT-STARTED-O5)
(SHIPPED-O5)
(STACKS-IN-USE-N0)
(not (STARTED-O5))
(not (STACKS-IN-USE-N1))
)
)
(:action SHIP-ORDER-O4-N1-N0-0
:parameters ()
:precondition
(and
(STACKS-IN-USE-N1)
(STARTED-O4)
)
:effect
(and
(NOT-STARTED-O4)
(SHIPPED-O4)
(STACKS-IN-USE-N0)
(not (STARTED-O4))
(not (STACKS-IN-USE-N1))
)
)
(:action SHIP-ORDER-O3-N1-N0-0
:parameters ()
:precondition
(and
(STACKS-IN-USE-N1)
(STARTED-O3)
)
:effect
(and
(NOT-STARTED-O3)
(SHIPPED-O3)
(STACKS-IN-USE-N0)
(not (STARTED-O3))
(not (STACKS-IN-USE-N1))
)
)
(:action SHIP-ORDER-O2-N1-N0-0
:parameters ()
:precondition
(and
(STACKS-IN-USE-N1)
(STARTED-O2)
)
:effect
(and
(NOT-STARTED-O2)
(SHIPPED-O2)
(STACKS-IN-USE-N0)
(not (STARTED-O2))
(not (STACKS-IN-USE-N1))
)
)
(:action SHIP-ORDER-O1-N1-N0-0
:parameters ()
:precondition
(and
(STACKS-IN-USE-N1)
(STARTED-O1)
)
:effect
(and
(NOT-STARTED-O1)
(SHIPPED-O1)
(STACKS-IN-USE-N0)
(not (STARTED-O1))
(not (STACKS-IN-USE-N1))
)
)
(:action START-ORDER-O10-N0-N1-0
:parameters ()
:precondition
(and
(STACKS-IN-USE-N0)
(WAITING-O10)
)
:effect
(and
(STARTED-O10)
(STACKS-IN-USE-N1)
(not (WAITING-O10))
(not (NOT-STARTED-O10))
(not (STACKS-IN-USE-N0))
)
)
(:action START-ORDER-O9-N0-N1-0
:parameters ()
:precondition
(and
(STACKS-IN-USE-N0)
(WAITING-O9)
)
:effect
(and
(STARTED-O9)
(STACKS-IN-USE-N1)
(not (WAITING-O9))
(not (NOT-STARTED-O9))
(not (STACKS-IN-USE-N0))
)
)
(:action START-ORDER-O8-N0-N1-0
:parameters ()
:precondition
(and
(STACKS-IN-USE-N0)
(WAITING-O8)
)
:effect
(and
(STARTED-O8)
(STACKS-IN-USE-N1)
(not (WAITING-O8))
(not (NOT-STARTED-O8))
(not (STACKS-IN-USE-N0))
)
)
(:action START-ORDER-O7-N0-N1-0
:parameters ()
:precondition
(and
(STACKS-IN-USE-N0)
(WAITING-O7)
)
:effect
(and
(STARTED-O7)
(STACKS-IN-USE-N1)
(not (WAITING-O7))
(not (NOT-STARTED-O7))
(not (STACKS-IN-USE-N0))
)
)
(:action START-ORDER-O6-N0-N1-0
:parameters ()
:precondition
(and
(STACKS-IN-USE-N0)
(WAITING-O6)
)
:effect
(and
(STARTED-O6)
(STACKS-IN-USE-N1)
(not (WAITING-O6))
(not (NOT-STARTED-O6))
(not (STACKS-IN-USE-N0))
)
)
(:action START-ORDER-O5-N0-N1-0
:parameters ()
:precondition
(and
(STACKS-IN-USE-N0)
(WAITING-O5)
)
:effect
(and
(STARTED-O5)
(STACKS-IN-USE-N1)
(not (WAITING-O5))
(not (NOT-STARTED-O5))
(not (STACKS-IN-USE-N0))
)
)
(:action START-ORDER-O4-N0-N1-0
:parameters ()
:precondition
(and
(STACKS-IN-USE-N0)
(WAITING-O4)
)
:effect
(and
(STARTED-O4)
(STACKS-IN-USE-N1)
(not (WAITING-O4))
(not (NOT-STARTED-O4))
(not (STACKS-IN-USE-N0))
)
)
(:action START-ORDER-O3-N0-N1-0
:parameters ()
:precondition
(and
(STACKS-IN-USE-N0)
(WAITING-O3)
)
:effect
(and
(STARTED-O3)
(STACKS-IN-USE-N1)
(not (WAITING-O3))
(not (NOT-STARTED-O3))
(not (STACKS-IN-USE-N0))
)
)
(:action START-ORDER-O2-N0-N1-0
:parameters ()
:precondition
(and
(STACKS-IN-USE-N0)
(WAITING-O2)
)
:effect
(and
(STARTED-O2)
(STACKS-IN-USE-N1)
(not (WAITING-O2))
(not (NOT-STARTED-O2))
(not (STACKS-IN-USE-N0))
)
)
(:action START-ORDER-O1-N0-N1-0
:parameters ()
:precondition
(and
(STACKS-IN-USE-N0)
(WAITING-O1)
)
:effect
(and
(STARTED-O1)
(STACKS-IN-USE-N1)
(not (WAITING-O1))
(not (NOT-STARTED-O1))
(not (STACKS-IN-USE-N0))
)
)
(:action MAKE-PRODUCT-P10-0
:parameters ()
:precondition
(and
(NOT-MADE-P10)
(NOT-STARTED-O4)
(NOT-STARTED-O6)
(NOT-STARTED-O8)
)
:effect
(and
(MADE-P10)
(not (NOT-MADE-P10))
)
)
(:action MAKE-PRODUCT-P10-1
:parameters ()
:precondition
(and
(NOT-MADE-P10)
(NOT-STARTED-O4)
(NOT-STARTED-O6)
(STARTED-O8)
)
:effect
(and
(MADE-P10)
(DELIVERED-O8-P10)
(not (NOT-MADE-P10))
)
)
(:action MAKE-PRODUCT-P10-2
:parameters ()
:precondition
(and
(NOT-MADE-P10)
(NOT-STARTED-O4)
(STARTED-O6)
(NOT-STARTED-O8)
)
:effect
(and
(MADE-P10)
(DELIVERED-O6-P10)
(not (NOT-MADE-P10))
)
)
(:action MAKE-PRODUCT-P10-3
:parameters ()
:precondition
(and
(NOT-MADE-P10)
(NOT-STARTED-O4)
(STARTED-O6)
(STARTED-O8)
)
:effect
(and
(MADE-P10)
(DELIVERED-O6-P10)
(DELIVERED-O8-P10)
(not (NOT-MADE-P10))
)
)
(:action MAKE-PRODUCT-P10-4
:parameters ()
:precondition
(and
(NOT-MADE-P10)
(STARTED-O4)
(NOT-STARTED-O6)
(NOT-STARTED-O8)
)
:effect
(and
(MADE-P10)
(DELIVERED-O4-P10)
(not (NOT-MADE-P10))
)
)
(:action MAKE-PRODUCT-P10-5
:parameters ()
:precondition
(and
(NOT-MADE-P10)
(STARTED-O4)
(NOT-STARTED-O6)
(STARTED-O8)
)
:effect
(and
(MADE-P10)
(DELIVERED-O4-P10)
(DELIVERED-O8-P10)
(not (NOT-MADE-P10))
)
)
(:action MAKE-PRODUCT-P10-6
:parameters ()
:precondition
(and
(NOT-MADE-P10)
(STARTED-O4)
(STARTED-O6)
(NOT-STARTED-O8)
)
:effect
(and
(MADE-P10)
(DELIVERED-O4-P10)
(DELIVERED-O6-P10)
(not (NOT-MADE-P10))
)
)
(:action MAKE-PRODUCT-P10-7
:parameters ()
:precondition
(and
(NOT-MADE-P10)
(STARTED-O4)
(STARTED-O6)
(STARTED-O8)
)
:effect
(and
(MADE-P10)
(DELIVERED-O4-P10)
(DELIVERED-O6-P10)
(DELIVERED-O8-P10)
(not (NOT-MADE-P10))
)
)
(:action MAKE-PRODUCT-P9-0
:parameters ()
:precondition
(and
(NOT-MADE-P9)
(NOT-STARTED-O1)
(NOT-STARTED-O2)
(NOT-STARTED-O9)
)
:effect
(and
(MADE-P9)
(not (NOT-MADE-P9))
)
)
(:action MAKE-PRODUCT-P9-1
:parameters ()
:precondition
(and
(NOT-MADE-P9)
(NOT-STARTED-O1)
(NOT-STARTED-O2)
(STARTED-O9)
)
:effect
(and
(MADE-P9)
(DELIVERED-O9-P9)
(not (NOT-MADE-P9))
)
)
(:action MAKE-PRODUCT-P9-2
:parameters ()
:precondition
(and
(NOT-MADE-P9)
(NOT-STARTED-O1)
(STARTED-O2)
(NOT-STARTED-O9)
)
:effect
(and
(MADE-P9)
(DELIVERED-O2-P9)
(not (NOT-MADE-P9))
)
)
(:action MAKE-PRODUCT-P9-3
:parameters ()
:precondition
(and
(NOT-MADE-P9)
(NOT-STARTED-O1)
(STARTED-O2)
(STARTED-O9)
)
:effect
(and
(MADE-P9)
(DELIVERED-O2-P9)
(DELIVERED-O9-P9)
(not (NOT-MADE-P9))
)
)
(:action MAKE-PRODUCT-P9-4
:parameters ()
:precondition
(and
(NOT-MADE-P9)
(STARTED-O1)
(NOT-STARTED-O2)
(NOT-STARTED-O9)
)
:effect
(and
(MADE-P9)
(DELIVERED-O1-P9)
(not (NOT-MADE-P9))
)
)
(:action MAKE-PRODUCT-P9-5
:parameters ()
:precondition
(and
(NOT-MADE-P9)
(STARTED-O1)
(NOT-STARTED-O2)
(STARTED-O9)
)
:effect
(and
(MADE-P9)
(DELIVERED-O1-P9)
(DELIVERED-O9-P9)
(not (NOT-MADE-P9))
)
)
(:action MAKE-PRODUCT-P9-6
:parameters ()
:precondition
(and
(NOT-MADE-P9)
(STARTED-O1)
(STARTED-O2)
(NOT-STARTED-O9)
)
:effect
(and
(MADE-P9)
(DELIVERED-O1-P9)
(DELIVERED-O2-P9)
(not (NOT-MADE-P9))
)
)
(:action MAKE-PRODUCT-P9-7
:parameters ()
:precondition
(and
(NOT-MADE-P9)
(STARTED-O1)
(STARTED-O2)
(STARTED-O9)
)
:effect
(and
(MADE-P9)
(DELIVERED-O1-P9)
(DELIVERED-O2-P9)
(DELIVERED-O9-P9)
(not (NOT-MADE-P9))
)
)
(:action MAKE-PRODUCT-P8-0
:parameters ()
:precondition
(and
(NOT-MADE-P8)
(NOT-STARTED-O2)
(NOT-STARTED-O3)
(NOT-STARTED-O6)
)
:effect
(and
(MADE-P8)
(not (NOT-MADE-P8))
)
)
(:action MAKE-PRODUCT-P8-1
:parameters ()
:precondition
(and
(NOT-MADE-P8)
(NOT-STARTED-O2)
(NOT-STARTED-O3)
(STARTED-O6)
)
:effect
(and
(MADE-P8)
(DELIVERED-O6-P8)
(not (NOT-MADE-P8))
)
)
(:action MAKE-PRODUCT-P8-2
:parameters ()
:precondition
(and
(NOT-MADE-P8)
(NOT-STARTED-O2)
(STARTED-O3)
(NOT-STARTED-O6)
)
:effect
(and
(MADE-P8)
(DELIVERED-O3-P8)
(not (NOT-MADE-P8))
)
)
(:action MAKE-PRODUCT-P8-3
:parameters ()
:precondition
(and
(NOT-MADE-P8)
(NOT-STARTED-O2)
(STARTED-O3)
(STARTED-O6)
)
:effect
(and
(MADE-P8)
(DELIVERED-O3-P8)
(DELIVERED-O6-P8)
(not (NOT-MADE-P8))
)
)
(:action MAKE-PRODUCT-P8-4
:parameters ()
:precondition
(and
(NOT-MADE-P8)
(STARTED-O2)
(NOT-STARTED-O3)
(NOT-STARTED-O6)
)
:effect
(and
(MADE-P8)
(DELIVERED-O2-P8)
(not (NOT-MADE-P8))
)
)
(:action MAKE-PRODUCT-P8-5
:parameters ()
:precondition
(and
(NOT-MADE-P8)
(STARTED-O2)
(NOT-STARTED-O3)
(STARTED-O6)
)
:effect
(and
(MADE-P8)
(DELIVERED-O2-P8)
(DELIVERED-O6-P8)
(not (NOT-MADE-P8))
)
)
(:action MAKE-PRODUCT-P8-6
:parameters ()
:precondition
(and
(NOT-MADE-P8)
(STARTED-O2)
(STARTED-O3)
(NOT-STARTED-O6)
)
:effect
(and
(MADE-P8)
(DELIVERED-O2-P8)
(DELIVERED-O3-P8)
(not (NOT-MADE-P8))
)
)
(:action MAKE-PRODUCT-P8-7
:parameters ()
:precondition
(and
(NOT-MADE-P8)
(STARTED-O2)
(STARTED-O3)
(STARTED-O6)
)
:effect
(and
(MADE-P8)
(DELIVERED-O2-P8)
(DELIVERED-O3-P8)
(DELIVERED-O6-P8)
(not (NOT-MADE-P8))
)
)
(:action MAKE-PRODUCT-P7-0
:parameters ()
:precondition
(and
(NOT-MADE-P7)
(NOT-STARTED-O6)
(NOT-STARTED-O7)
(NOT-STARTED-O9)
)
:effect
(and
(MADE-P7)
(not (NOT-MADE-P7))
)
)
(:action MAKE-PRODUCT-P7-1
:parameters ()
:precondition
(and
(NOT-MADE-P7)
(NOT-STARTED-O6)
(NOT-STARTED-O7)
(STARTED-O9)
)
:effect
(and
(MADE-P7)
(DELIVERED-O9-P7)
(not (NOT-MADE-P7))
)
)
(:action MAKE-PRODUCT-P7-2
:parameters ()
:precondition
(and
(NOT-MADE-P7)
(NOT-STARTED-O6)
(STARTED-O7)
(NOT-STARTED-O9)
)
:effect
(and
(MADE-P7)
(DELIVERED-O7-P7)
(not (NOT-MADE-P7))
)
)
(:action MAKE-PRODUCT-P7-3
:parameters ()
:precondition
(and
(NOT-MADE-P7)
(NOT-STARTED-O6)
(STARTED-O7)
(STARTED-O9)
)
:effect
(and
(MADE-P7)
(DELIVERED-O7-P7)
(DELIVERED-O9-P7)
(not (NOT-MADE-P7))
)
)
(:action MAKE-PRODUCT-P7-4
:parameters ()
:precondition
(and
(NOT-MADE-P7)
(STARTED-O6)
(NOT-STARTED-O7)
(NOT-STARTED-O9)
)
:effect
(and
(MADE-P7)
(DELIVERED-O6-P7)
(not (NOT-MADE-P7))
)
)
(:action MAKE-PRODUCT-P7-5
:parameters ()
:precondition
(and
(NOT-MADE-P7)
(STARTED-O6)
(NOT-STARTED-O7)
(STARTED-O9)
)
:effect
(and
(MADE-P7)
(DELIVERED-O6-P7)
(DELIVERED-O9-P7)
(not (NOT-MADE-P7))
)
)
(:action MAKE-PRODUCT-P7-6
:parameters ()
:precondition
(and
(NOT-MADE-P7)
(STARTED-O6)
(STARTED-O7)
(NOT-STARTED-O9)
)
:effect
(and
(MADE-P7)
(DELIVERED-O6-P7)
(DELIVERED-O7-P7)
(not (NOT-MADE-P7))
)
)
(:action MAKE-PRODUCT-P7-7
:parameters ()
:precondition
(and
(NOT-MADE-P7)
(STARTED-O6)
(STARTED-O7)
(STARTED-O9)
)
:effect
(and
(MADE-P7)
(DELIVERED-O6-P7)
(DELIVERED-O7-P7)
(DELIVERED-O9-P7)
(not (NOT-MADE-P7))
)
)
(:action MAKE-PRODUCT-P6-0
:parameters ()
:precondition
(and
(NOT-MADE-P6)
(NOT-STARTED-O1)
(NOT-STARTED-O5)
(NOT-STARTED-O10)
)
:effect
(and
(MADE-P6)
(not (NOT-MADE-P6))
)
)
(:action MAKE-PRODUCT-P6-1
:parameters ()
:precondition
(and
(NOT-MADE-P6)
(NOT-STARTED-O1)
(NOT-STARTED-O5)
(STARTED-O10)
)
:effect
(and
(MADE-P6)
(DELIVERED-O10-P6)
(not (NOT-MADE-P6))
)
)
(:action MAKE-PRODUCT-P6-2
:parameters ()
:precondition
(and
(NOT-MADE-P6)
(NOT-STARTED-O1)
(STARTED-O5)
(NOT-STARTED-O10)
)
:effect
(and
(MADE-P6)
(DELIVERED-O5-P6)
(not (NOT-MADE-P6))
)
)
(:action MAKE-PRODUCT-P6-3
:parameters ()
:precondition
(and
(NOT-MADE-P6)
(NOT-STARTED-O1)
(STARTED-O5)
(STARTED-O10)
)
:effect
(and
(MADE-P6)
(DELIVERED-O5-P6)
(DELIVERED-O10-P6)
(not (NOT-MADE-P6))
)
)
(:action MAKE-PRODUCT-P6-4
:parameters ()
:precondition
(and
(NOT-MADE-P6)
(STARTED-O1)
(NOT-STARTED-O5)
(NOT-STARTED-O10)
)
:effect
(and
(MADE-P6)
(DELIVERED-O1-P6)
(not (NOT-MADE-P6))
)
)
(:action MAKE-PRODUCT-P6-5
:parameters ()
:precondition
(and
(NOT-MADE-P6)
(STARTED-O1)
(NOT-STARTED-O5)
(STARTED-O10)
)
:effect
(and
(MADE-P6)
(DELIVERED-O1-P6)
(DELIVERED-O10-P6)
(not (NOT-MADE-P6))
)
)
(:action MAKE-PRODUCT-P6-6
:parameters ()
:precondition
(and
(NOT-MADE-P6)
(STARTED-O1)
(STARTED-O5)
(NOT-STARTED-O10)
)
:effect
(and
(MADE-P6)
(DELIVERED-O1-P6)
(DELIVERED-O5-P6)
(not (NOT-MADE-P6))
)
)
(:action MAKE-PRODUCT-P6-7
:parameters ()
:precondition
(and
(NOT-MADE-P6)
(STARTED-O1)
(STARTED-O5)
(STARTED-O10)
)
:effect
(and
(MADE-P6)
(DELIVERED-O1-P6)
(DELIVERED-O5-P6)
(DELIVERED-O10-P6)
(not (NOT-MADE-P6))
)
)
(:action MAKE-PRODUCT-P5-0
:parameters ()
:precondition
(and
(NOT-MADE-P5)
(NOT-STARTED-O5)
(NOT-STARTED-O8)
(NOT-STARTED-O10)
)
:effect
(and
(MADE-P5)
(not (NOT-MADE-P5))
)
)
(:action MAKE-PRODUCT-P5-1
:parameters ()
:precondition
(and
(NOT-MADE-P5)
(NOT-STARTED-O5)
(NOT-STARTED-O8)
(STARTED-O10)
)
:effect
(and
(MADE-P5)
(DELIVERED-O10-P5)
(not (NOT-MADE-P5))
)
)
(:action MAKE-PRODUCT-P5-2
:parameters ()
:precondition
(and
(NOT-MADE-P5)
(NOT-STARTED-O5)
(STARTED-O8)
(NOT-STARTED-O10)
)
:effect
(and
(MADE-P5)
(DELIVERED-O8-P5)
(not (NOT-MADE-P5))
)
)
(:action MAKE-PRODUCT-P5-3
:parameters ()
:precondition
(and
(NOT-MADE-P5)
(NOT-STARTED-O5)
(STARTED-O8)
(STARTED-O10)
)
:effect
(and
(MADE-P5)
(DELIVERED-O8-P5)
(DELIVERED-O10-P5)
(not (NOT-MADE-P5))
)
)
(:action MAKE-PRODUCT-P5-4
:parameters ()
:precondition
(and
(NOT-MADE-P5)
(STARTED-O5)
(NOT-STARTED-O8)
(NOT-STARTED-O10)
)
:effect
(and
(MADE-P5)
(DELIVERED-O5-P5)
(not (NOT-MADE-P5))
)
)
(:action MAKE-PRODUCT-P5-5
:parameters ()
:precondition
(and
(NOT-MADE-P5)
(STARTED-O5)
(NOT-STARTED-O8)
(STARTED-O10)
)
:effect
(and
(MADE-P5)
(DELIVERED-O5-P5)
(DELIVERED-O10-P5)
(not (NOT-MADE-P5))
)
)
(:action MAKE-PRODUCT-P5-6
:parameters ()
:precondition
(and
(NOT-MADE-P5)
(STARTED-O5)
(STARTED-O8)
(NOT-STARTED-O10)
)
:effect
(and
(MADE-P5)
(DELIVERED-O5-P5)
(DELIVERED-O8-P5)
(not (NOT-MADE-P5))
)
)
(:action MAKE-PRODUCT-P5-7
:parameters ()
:precondition
(and
(NOT-MADE-P5)
(STARTED-O5)
(STARTED-O8)
(STARTED-O10)
)
:effect
(and
(MADE-P5)
(DELIVERED-O5-P5)
(DELIVERED-O8-P5)
(DELIVERED-O10-P5)
(not (NOT-MADE-P5))
)
)
(:action MAKE-PRODUCT-P4-0
:parameters ()
:precondition
(and
(NOT-MADE-P4)
(NOT-STARTED-O4)
(NOT-STARTED-O7)
(NOT-STARTED-O9)
)
:effect
(and
(MADE-P4)
(not (NOT-MADE-P4))
)
)
(:action MAKE-PRODUCT-P4-1
:parameters ()
:precondition
(and
(NOT-MADE-P4)
(NOT-STARTED-O4)
(NOT-STARTED-O7)
(STARTED-O9)
)
:effect
(and
(MADE-P4)
(DELIVERED-O9-P4)
(not (NOT-MADE-P4))
)
)
(:action MAKE-PRODUCT-P4-2
:parameters ()
:precondition
(and
(NOT-MADE-P4)
(NOT-STARTED-O4)
(STARTED-O7)
(NOT-STARTED-O9)
)
:effect
(and
(MADE-P4)
(DELIVERED-O7-P4)
(not (NOT-MADE-P4))
)
)
(:action MAKE-PRODUCT-P4-3
:parameters ()
:precondition
(and
(NOT-MADE-P4)
(NOT-STARTED-O4)
(STARTED-O7)
(STARTED-O9)
)
:effect
(and
(MADE-P4)
(DELIVERED-O7-P4)
(DELIVERED-O9-P4)
(not (NOT-MADE-P4))
)
)
(:action MAKE-PRODUCT-P4-4
:parameters ()
:precondition
(and
(NOT-MADE-P4)
(STARTED-O4)
(NOT-STARTED-O7)
(NOT-STARTED-O9)
)
:effect
(and
(MADE-P4)
(DELIVERED-O4-P4)
(not (NOT-MADE-P4))
)
)
(:action MAKE-PRODUCT-P4-5
:parameters ()
:precondition
(and
(NOT-MADE-P4)
(STARTED-O4)
(NOT-STARTED-O7)
(STARTED-O9)
)
:effect
(and
(MADE-P4)
(DELIVERED-O4-P4)
(DELIVERED-O9-P4)
(not (NOT-MADE-P4))
)
)
(:action MAKE-PRODUCT-P4-6
:parameters ()
:precondition
(and
(NOT-MADE-P4)
(STARTED-O4)
(STARTED-O7)
(NOT-STARTED-O9)
)
:effect
(and
(MADE-P4)
(DELIVERED-O4-P4)
(DELIVERED-O7-P4)
(not (NOT-MADE-P4))
)
)
(:action MAKE-PRODUCT-P4-7
:parameters ()
:precondition
(and
(NOT-MADE-P4)
(STARTED-O4)
(STARTED-O7)
(STARTED-O9)
)
:effect
(and
(MADE-P4)
(DELIVERED-O4-P4)
(DELIVERED-O7-P4)
(DELIVERED-O9-P4)
(not (NOT-MADE-P4))
)
)
(:action MAKE-PRODUCT-P3-0
:parameters ()
:precondition
(and
(NOT-MADE-P3)
(NOT-STARTED-O4)
(NOT-STARTED-O7)
(NOT-STARTED-O8)
)
:effect
(and
(MADE-P3)
(not (NOT-MADE-P3))
)
)
(:action MAKE-PRODUCT-P3-1
:parameters ()
:precondition
(and
(NOT-MADE-P3)
(NOT-STARTED-O4)
(NOT-STARTED-O7)
(STARTED-O8)
)
:effect
(and
(MADE-P3)
(DELIVERED-O8-P3)
(not (NOT-MADE-P3))
)
)
(:action MAKE-PRODUCT-P3-2
:parameters ()
:precondition
(and
(NOT-MADE-P3)
(NOT-STARTED-O4)
(STARTED-O7)
(NOT-STARTED-O8)
)
:effect
(and
(MADE-P3)
(DELIVERED-O7-P3)
(not (NOT-MADE-P3))
)
)
(:action MAKE-PRODUCT-P3-3
:parameters ()
:precondition
(and
(NOT-MADE-P3)
(NOT-STARTED-O4)
(STARTED-O7)
(STARTED-O8)
)
:effect
(and
(MADE-P3)
(DELIVERED-O7-P3)
(DELIVERED-O8-P3)
(not (NOT-MADE-P3))
)
)
(:action MAKE-PRODUCT-P3-4
:parameters ()
:precondition
(and
(NOT-MADE-P3)
(STARTED-O4)
(NOT-STARTED-O7)
(NOT-STARTED-O8)
)
:effect
(and
(MADE-P3)
(DELIVERED-O4-P3)
(not (NOT-MADE-P3))
)
)
(:action MAKE-PRODUCT-P3-5
:parameters ()
:precondition
(and
(NOT-MADE-P3)
(STARTED-O4)
(NOT-STARTED-O7)
(STARTED-O8)
)
:effect
(and
(MADE-P3)
(DELIVERED-O4-P3)
(DELIVERED-O8-P3)
(not (NOT-MADE-P3))
)
)
(:action MAKE-PRODUCT-P3-6
:parameters ()
:precondition
(and
(NOT-MADE-P3)
(STARTED-O4)
(STARTED-O7)
(NOT-STARTED-O8)
)
:effect
(and
(MADE-P3)
(DELIVERED-O4-P3)
(DELIVERED-O7-P3)
(not (NOT-MADE-P3))
)
)
(:action MAKE-PRODUCT-P3-7
:parameters ()
:precondition
(and
(NOT-MADE-P3)
(STARTED-O4)
(STARTED-O7)
(STARTED-O8)
)
:effect
(and
(MADE-P3)
(DELIVERED-O4-P3)
(DELIVERED-O7-P3)
(DELIVERED-O8-P3)
(not (NOT-MADE-P3))
)
)
(:action MAKE-PRODUCT-P2-0
:parameters ()
:precondition
(and
(NOT-MADE-P2)
(NOT-STARTED-O2)
(NOT-STARTED-O3)
(NOT-STARTED-O5)
)
:effect
(and
(MADE-P2)
(not (NOT-MADE-P2))
)
)
(:action MAKE-PRODUCT-P2-1
:parameters ()
:precondition
(and
(NOT-MADE-P2)
(NOT-STARTED-O2)
(NOT-STARTED-O3)
(STARTED-O5)
)
:effect
(and
(MADE-P2)
(DELIVERED-O5-P2)
(not (NOT-MADE-P2))
)
)
(:action MAKE-PRODUCT-P2-2
:parameters ()
:precondition
(and
(NOT-MADE-P2)
(NOT-STARTED-O2)
(STARTED-O3)
(NOT-STARTED-O5)
)
:effect
(and
(MADE-P2)
(DELIVERED-O3-P2)
(not (NOT-MADE-P2))
)
)
(:action MAKE-PRODUCT-P2-3
:parameters ()
:precondition
(and
(NOT-MADE-P2)
(NOT-STARTED-O2)
(STARTED-O3)
(STARTED-O5)
)
:effect
(and
(MADE-P2)
(DELIVERED-O3-P2)
(DELIVERED-O5-P2)
(not (NOT-MADE-P2))
)
)
(:action MAKE-PRODUCT-P2-4
:parameters ()
:precondition
(and
(NOT-MADE-P2)
(STARTED-O2)
(NOT-STARTED-O3)
(NOT-STARTED-O5)
)
:effect
(and
(MADE-P2)
(DELIVERED-O2-P2)
(not (NOT-MADE-P2))
)
)
(:action MAKE-PRODUCT-P2-5
:parameters ()
:precondition
(and
(NOT-MADE-P2)
(STARTED-O2)
(NOT-STARTED-O3)
(STARTED-O5)
)
:effect
(and
(MADE-P2)
(DELIVERED-O2-P2)
(DELIVERED-O5-P2)
(not (NOT-MADE-P2))
)
)
(:action MAKE-PRODUCT-P2-6
:parameters ()
:precondition
(and
(NOT-MADE-P2)
(STARTED-O2)
(STARTED-O3)
(NOT-STARTED-O5)
)
:effect
(and
(MADE-P2)
(DELIVERED-O2-P2)
(DELIVERED-O3-P2)
(not (NOT-MADE-P2))
)
)
(:action MAKE-PRODUCT-P2-7
:parameters ()
:precondition
(and
(NOT-MADE-P2)
(STARTED-O2)
(STARTED-O3)
(STARTED-O5)
)
:effect
(and
(MADE-P2)
(DELIVERED-O2-P2)
(DELIVERED-O3-P2)
(DELIVERED-O5-P2)
(not (NOT-MADE-P2))
)
)
(:action MAKE-PRODUCT-P1-0
:parameters ()
:precondition
(and
(NOT-MADE-P1)
(NOT-STARTED-O1)
(NOT-STARTED-O3)
(NOT-STARTED-O10)
)
:effect
(and
(MADE-P1)
(not (NOT-MADE-P1))
)
)
(:action MAKE-PRODUCT-P1-1
:parameters ()
:precondition
(and
(NOT-MADE-P1)
(NOT-STARTED-O1)
(NOT-STARTED-O3)
(STARTED-O10)
)
:effect
(and
(MADE-P1)
(DELIVERED-O10-P1)
(not (NOT-MADE-P1))
)
)
(:action MAKE-PRODUCT-P1-2
:parameters ()
:precondition
(and
(NOT-MADE-P1)
(NOT-STARTED-O1)
(STARTED-O3)
(NOT-STARTED-O10)
)
:effect
(and
(MADE-P1)
(DELIVERED-O3-P1)
(not (NOT-MADE-P1))
)
)
(:action MAKE-PRODUCT-P1-3
:parameters ()
:precondition
(and
(NOT-MADE-P1)
(NOT-STARTED-O1)
(STARTED-O3)
(STARTED-O10)
)
:effect
(and
(MADE-P1)
(DELIVERED-O3-P1)
(DELIVERED-O10-P1)
(not (NOT-MADE-P1))
)
)
(:action MAKE-PRODUCT-P1-4
:parameters ()
:precondition
(and
(NOT-MADE-P1)
(STARTED-O1)
(NOT-STARTED-O3)
(NOT-STARTED-O10)
)
:effect
(and
(MADE-P1)
(DELIVERED-O1-P1)
(not (NOT-MADE-P1))
)
)
(:action MAKE-PRODUCT-P1-5
:parameters ()
:precondition
(and
(NOT-MADE-P1)
(STARTED-O1)
(NOT-STARTED-O3)
(STARTED-O10)
)
:effect
(and
(MADE-P1)
(DELIVERED-O1-P1)
(DELIVERED-O10-P1)
(not (NOT-MADE-P1))
)
)
(:action MAKE-PRODUCT-P1-6
:parameters ()
:precondition
(and
(NOT-MADE-P1)
(STARTED-O1)
(STARTED-O3)
(NOT-STARTED-O10)
)
:effect
(and
(MADE-P1)
(DELIVERED-O1-P1)
(DELIVERED-O3-P1)
(not (NOT-MADE-P1))
)
)
(:action MAKE-PRODUCT-P1-7
:parameters ()
:precondition
(and
(NOT-MADE-P1)
(STARTED-O1)
(STARTED-O3)
(STARTED-O10)
)
:effect
(and
(MADE-P1)
(DELIVERED-O1-P1)
(DELIVERED-O3-P1)
(DELIVERED-O10-P1)
(not (NOT-MADE-P1))
)
)
)

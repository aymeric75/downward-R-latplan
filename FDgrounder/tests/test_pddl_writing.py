
from FDgrounder.pddl_parser import open
import pytest


def test_predicate_to_pddl():
    task = open('FDgrounder/tests/PDDL/trucks/domain.pddl', 'FDgrounder/tests/PDDL/trucks/p05.pddl')
    predicate = task.predicates[0]
    assert predicate.to_pddl() == '(at ?x - locatable ?l - location)'
    print(task.get_pddl_domain())

if __name__ == "__main__":
    test_predicate_to_pddl()
import unittest
import os
from FDgrounder.pddl_parser import lisp_parser, parsing_functions
from FDgrounder import normalize
from FDgrounder import pddl
from FDgrounder import instantiate
from FDgrounder import hard_constraints_manager

file_open = open
NUM = 'num'
CONSTRAINTS = 'constraints'


def parse_pddl_file(type, filename):
    try:
        # The builtin open function is shadowed by this module's open function.
        # We use the Latin-1 encoding (which allows a superset of ASCII, of the
        # Latin-* encodings and of UTF-8) to allow special characters in
        # comments. In all other parts, we later validate that only ASCII is
        # used.
        return lisp_parser.parse_nested_list(file_open(filename,
                                                       encoding='ISO-8859-1'))
    except OSError as e:
        raise SystemExit("Error: Could not read file: %s\nReason: %s." %
                         (e.filename, e))
    except lisp_parser.ParseError as e:
        raise SystemExit("Error: Could not parse %s file: %s\nReason: %s." %
                         (type, filename, e))


def open(domain_filename=None, task_filename=None):
    task_filename = task_filename
    domain_filename = domain_filename

    domain_pddl = parse_pddl_file("domain", domain_filename)
    task_pddl = parse_pddl_file("task", task_filename)

    return parsing_functions.parse_task(domain_pddl, task_pddl)


class TestSplitAlways(unittest.TestCase):

    def setUp(self):
        self.a = pddl.Atom('A', '')
        self.b = pddl.Atom('B', '')
        self.c = pddl.Atom('C', '')
        self.d = pddl.Atom('D', '')
        self.e = pddl.Atom('E', '')
        self.f = pddl.Atom('F', '')
        self.g = pddl.Atom('G', '')

    def test_split_always(self):
        hard_constraints_manager.SPLIT_ALWAYS = True
        a1 = pddl.Disjunction([self.a, self.b])
        a2 = pddl.Disjunction([self.c, self.d])
        always = pddl.Always(pddl.Conjunction([a1, a2, self.e, self.f]))
        constr_formula = pddl.Conjunction([always, pddl.Sometime(self.f), pddl.AtMostOnce(self.g), pddl.Always(self.a)])
        normalizer = hard_constraints_manager.ConstraintsNormalizer(constr_formula, [], [])
        self.assertEqual(len(normalizer.constraint_list), 7)

        hard_constraints_manager.SPLIT_ALWAYS = False
        a1 = pddl.Disjunction([self.a, self.b])
        a2 = pddl.Disjunction([self.c, self.d])
        always = pddl.Always(pddl.Conjunction([a1, a2, self.e, self.f]))
        constr_formula = pddl.Conjunction([always, pddl.Sometime(self.f), pddl.AtMostOnce(self.g), pddl.Always(self.a)])
        normalizer = hard_constraints_manager.ConstraintsNormalizer(constr_formula, [], [])
        self.assertEqual(len(normalizer.constraint_list), 4)


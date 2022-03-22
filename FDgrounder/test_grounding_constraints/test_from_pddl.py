import unittest
import os

import pkg_resources
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


class TestRover(unittest.TestCase):

    def setUp(self):
        task = open(
            domain_filename=pkg_resources.resource_filename(__name__, 'PDDL/rover/domain.pddl'),
            task_filename=pkg_resources.resource_filename(__name__,'PDDL/rover/rover1.pddl'))
        normalize.normalize(task)
        (relaxed_reachable, atoms, actions, axioms, reachable_action_params) = instantiate.explore(task)
        self.groundedTask = hard_constraints_manager.GroundedConstraintsTask(task, atoms, actions, axioms)

    def test_formula(self):
        task = open(
            domain_filename=pkg_resources.resource_filename(__name__, 'PDDL/rover/domain.pddl'),
            task_filename=pkg_resources.resource_filename(__name__,'PDDL/rover/rover2.pddl'))
        normalize.normalize(task)
        (relaxed_reachable, atoms, actions, axioms, reachable_action_params) = instantiate.explore(task)
        groundedTask = hard_constraints_manager.GroundedConstraintsTask(task, atoms, actions, axioms)

    def test_sometime(self):
        sometime_constraints = self.groundedTask.ground_constraints_dict['sometime'][CONSTRAINTS]
        self.assertEqual(len(sometime_constraints), 4)
        for i in range(4):
            conjuction_parts = [pddl.Atom('at', ['rover0', 'waypoint{}'.format(i)]),
                                pddl.Atom('at', ['rover1', 'waypoint{}'.format(i)])]
            conj = pddl.Conjunction(conjuction_parts)
            sometime = pddl.constraints.Sometime(conj)
            self.assertTrue(sometime in sometime_constraints)

    def test_always(self):
        always_constraints = self.groundedTask.ground_constraints_dict['always'][CONSTRAINTS]
        self.assertEqual(len(always_constraints), 1)
        disjunction = []
        for w in ['waypoint1', 'waypoint2', 'waypoint3']:
            conjunction = []
            for r in ['rover0', 'rover1']:
                atom = pddl.Atom('have_rock_analysis', [r, w])
                atom = atom.negate()
                conjunction.append(atom)
            disjunction.append(pddl.Conjunction(conjunction))
        resulting_formula = pddl.constraints.Always(pddl.Disjunction(disjunction).simplified())
        self.assertTrue(resulting_formula in always_constraints)

    def test_amo(self):
        constraints = self.groundedTask.ground_constraints_dict['at-most-once'][CONSTRAINTS]
        self.assertEqual(len(constraints), 4)
        for w in ['waypoint0', 'waypoint1', 'waypoint2', 'waypoint3']:
            atom1 = pddl.Atom('have_rock_analysis', ['rover0', w])
            atom2 = pddl.Atom('have_soil_analysis', ['rover0', w])
            # waypoint0 does not have the rock sample
            if w == 'waypoint0':
                atom1 = pddl.Falsity()
            # waypoint1 does not have the soil sample
            if w == 'waypoint1':
                atom2 = pddl.Falsity()
            resulting_formula = pddl.constraints.AtMostOnce(pddl.Disjunction([atom2, atom1]).simplified())
            self.assertTrue(resulting_formula in constraints)

    def test_sometime_after(self):
        constraints = self.groundedTask.ground_constraints_dict['sometime-after'][CONSTRAINTS]
        self.assertEqual(len(constraints), 6)
        for w in ['waypoint1', 'waypoint2', 'waypoint3']:
            for r in ['rover0', 'rover1']:
                atom1 = pddl.Atom('have_rock_analysis', [r, w])
                atom2 = pddl.Atom('have_soil_analysis', [r, w])
                # waypoint1 does not have the soil sample
                if w == 'waypoint1':
                    atom2 = pddl.Falsity()
                resulting_formula = pddl.constraints.SometimeAfter(atom1, atom2)
                self.assertTrue(resulting_formula in constraints)


    def test_constraints_count_p60(self):
        task = open(
            domain_filename=pkg_resources.resource_filename(__name__,'PDDL/rover/domain.pddl'),
            task_filename=pkg_resources.resource_filename(__name__,'PDDL/rover/p60.pddl'))
        normalize.normalize(task)
        (relaxed_reachable, atoms, actions, axioms, reachable_action_params) = instantiate.explore(task)
        groundedTask_p60 = hard_constraints_manager.GroundedConstraintsTask(task, atoms, actions,
                                                                                              axioms)
        hard_constraints_map = {pddl.constraints.ATMOSTONCE: 7,
                                pddl.constraints.ALWAYS: 1,
                                pddl.constraints.SOMETIME: 30,
                                pddl.constraints.SOMETIMEBEFORE: 63,
                                pddl.constraints.SOMETIMEAFTER: 0}
        for key in hard_constraints_map.keys():
            num = groundedTask_p60.normalized_task.hard_constraints_map[key]['num']
            self.assertEqual(hard_constraints_map[key], num)
            self.assertEqual(hard_constraints_map[key], groundedTask_p60.ground_constraints_dict[key]['num'])


class TestTrucks(unittest.TestCase):

    def setUp(self):
        task = open(
            domain_filename=pkg_resources.resource_filename(__name__,'PDDL/trucks/domain_trucks_alt.pddl'),
            task_filename=pkg_resources.resource_filename(__name__,'PDDL/trucks/problem_trucks.pddl'))
        normalize.normalize(task)
        (relaxed_reachable, atoms, actions, axioms, reachable_action_params) = instantiate.explore(task)
        self.groundedTask = hard_constraints_manager.GroundedConstraintsTask(task, atoms, actions, axioms)

    def test_action_precondition(self):
        # If there is a forall in the precondition of an action,
        # then it is translated in an axiom. Here i test that the system
        # replace the axiom with the conjunction
        for act in self.groundedTask.ground_actions:
            for precondition in act.precondition:
                self.assertFalse(precondition.predicate.startswith('new-axiom@'))
        test_action1 = [act for act in self.groundedTask.ground_actions if act.name.startswith("(test-precond1")]
        test_action2 = [act for act in self.groundedTask.ground_actions if act.name.startswith("(test-precond2")]
        self.assertEqual(len(test_action1), 1)
        self.assertEqual(len(test_action2), 3)
        precondition1 = test_action1[0].precondition
        self.assertEqual(len(precondition1), 6)
        for truck in ['truck1', 'truck2']:
            for location in ['l1', 'l2', 'l3']:
                self.assertTrue(pddl.NegatedAtom('at', [truck, location]) in precondition1)
        i = 1
        for action in test_action2:
            precondition = action.precondition
            self.assertEqual(len(precondition), 2)
            location = 'l{}'.format(i)
            for truck in ['truck1', 'truck2']:
                self.assertTrue(pddl.Atom('at', [truck, location]) in precondition)
            i += 1

    def test_constraints_count_p60_no_quantifiers(self):
        task = open(
            domain_filename=pkg_resources.resource_filename(__name__,'PDDL/trucks/domain_trucks.pddl'),
            task_filename=pkg_resources.resource_filename(__name__,'PDDL/trucks/p60.pddl'))
        hard_constraints_manager.SPLIT_ALWAYS = False
        normalize.normalize(task)
        (relaxed_reachable, atoms, actions, axioms, reachable_action_params) = instantiate.explore(task)
        groundedTask_p60 = hard_constraints_manager.GroundedConstraintsTask(task, atoms, actions,
                                                                                              axioms)
        hard_constraints_map = {pddl.constraints.ATMOSTONCE: 18,
                                pddl.constraints.ALWAYS: 39,
                                pddl.constraints.SOMETIME: 0,
                                pddl.constraints.SOMETIMEBEFORE: 1,
                                pddl.constraints.SOMETIMEAFTER: 0}
        for key in hard_constraints_map.keys():
            num = groundedTask_p60.normalized_task.hard_constraints_map[key]['num']
            self.assertEqual(hard_constraints_map[key], num)
            self.assertEqual(hard_constraints_map[key], groundedTask_p60.ground_constraints_dict[key]['num'])

    def test_constraints_count_p60_quantifiers(self):
        task = open(
            domain_filename=pkg_resources.resource_filename(__name__,'PDDL/trucks/domain-p60.pddl'),
            task_filename=pkg_resources.resource_filename(__name__,'PDDL/trucks/p60_l.pddl'))
        hard_constraints_manager.SPLIT_ALWAYS = False
        normalize.normalize(task)
        (relaxed_reachable, atoms, actions, axioms, reachable_action_params) = instantiate.explore(task)
        groundedTask = hard_constraints_manager.GroundedConstraintsTask(task, atoms, actions, axioms)
        hard_constraints_map = {pddl.constraints.ATMOSTONCE: 18,
                                pddl.constraints.ALWAYS: 39,
                                pddl.constraints.SOMETIME: 0,
                                pddl.constraints.SOMETIMEBEFORE: 1,
                                pddl.constraints.SOMETIMEAFTER: 0}
        for key in hard_constraints_map.keys():
            num = groundedTask.normalized_task.hard_constraints_map[key]['num']
            self.assertEqual(hard_constraints_map[key], num)
            self.assertEqual(hard_constraints_map[key], groundedTask.ground_constraints_dict[key]['num'])


class TestTpp(unittest.TestCase):

    def test_constraints_count_p60_no_quantifiers_no_goals(self):
        task = open(
            domain_filename=pkg_resources.resource_filename(__name__,'PDDL/tpp/domain.pddl'),
            task_filename=pkg_resources.resource_filename(__name__,'PDDL/tpp/p60.pddl'))
        normalize.normalize(task)
        (relaxed_reachable, atoms, actions, axioms, reachable_action_params) = instantiate.explore(task)
        groundedTask_p60 = hard_constraints_manager.GroundedConstraintsTask(task, atoms, actions,
                                                                                              axioms)
        hard_constraints_map = {pddl.constraints.ATMOSTONCE: 51,
                                pddl.constraints.ALWAYS: 36,
                                pddl.constraints.SOMETIME: 3,
                                pddl.constraints.SOMETIMEBEFORE: 6,
                                pddl.constraints.SOMETIMEAFTER: 0}
        for key in hard_constraints_map.keys():
            num = groundedTask_p60.normalized_task.hard_constraints_map[key]['num']
            self.assertEqual(hard_constraints_map[key], num)
            self.assertEqual(hard_constraints_map[key], groundedTask_p60.ground_constraints_dict[key]['num'])


class TestOpenstack(unittest.TestCase):

    def setUp(self):
        task = open(
            domain_filename=pkg_resources.resource_filename(__name__,'PDDL/openstack/domain.pddl'),
            task_filename=pkg_resources.resource_filename(__name__,'PDDL/openstack/p01.pddl'))
        normalize.normalize(task)
        (relaxed_reachable, atoms, actions, axioms, reachable_action_params) = instantiate.explore(task)
        self.groundedTask = hard_constraints_manager.GroundedConstraintsTask(task, atoms, actions, axioms)


    def test(self):
        a = pddl.Atom('A', [])
        conj = pddl.Conjunction([pddl.Conjunction([pddl.Conjunction([a])])])
        simp = conj.simplified()


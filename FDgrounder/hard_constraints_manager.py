from . import pddl
from . import instantiate

NON_DISJOINT_PARAMETER_SET_MSG = "WARNING, in the hard constraints normalization process there are universal quantifiers with non disjoint parameter set"
DEBUG = True

NUM = 'num'
CONSTRAINTS = 'constraints'
NEW_ACTION_TEMPLATE = 'constraint@{}'
NEW_ATOM_TEMPLATE = 'constraint-reachable@{}'
VERBOSE = False
SPLIT_ALWAYS = True


def get_atom_key(atom):
    return "%s(%s)" % (atom.predicate, ", ".join(map(str, atom.args)))


def get_axiom_key(axiom):
    return get_atom_key(axiom.effect)


def isConstraint(action):
    if len(action.add_effects) == 1:
        cond, eff = action.add_effects[0]
        effect_name = eff.predicate
        return '@' in effect_name and effect_name == NEW_ATOM_TEMPLATE.format(effect_name.split('@')[1])
    return False


def get_constraint_action_keys(action):
    cond, eff = action.add_effects[0]
    return eff.predicate, "%s(%s)" % (eff.predicate, ", ".join(map(str, eff.args)))


class AlwaysError(Exception):
    pass


class SometimeError(Exception):
    pass


class GroundedConstraintsTask:
    def __init__(self, normalized_task, ground_atoms, ground_actions, ground_axioms):
        self.normalized_task = normalized_task
        self.total_atoms = ground_atoms
        self.ground_actions = ground_actions
        self.ground_axioms = ground_axioms
        self.axiom_list_dict = {}
        self.constraints_action_list_dict = {}
        self.axiom2formula_dict = {}
        self.init_dictionaries()
        self.action2formula_dict = {}
        self.ground_constraints_dict = {pddl.constraints.ATMOSTONCE: {NUM: 0, CONSTRAINTS: []},
                                        pddl.constraints.ALWAYS: {NUM: 0, CONSTRAINTS: []},
                                        pddl.constraints.SOMETIME: {NUM: 0, CONSTRAINTS: []},
                                        pddl.constraints.SOMETIMEBEFORE: {NUM: 0, CONSTRAINTS: []},
                                        pddl.constraints.SOMETIMEAFTER: {NUM: 0, CONSTRAINTS: []}}
        self.init_ground_constraints()
        self.actions2constraints()
        self.complete_ground_constraints()
        if VERBOSE:
            self.print_ground_constraints_info()
        self.initial_state = [atom for atom in self.normalized_task.init if atom in ground_atoms]
        self.goal = self.fix_goal(self.normalized_task.goal)
        self.atoms = [atom for atom in self.total_atoms if atom.predicate not in self.constraints_action_list_dict
                      and atom.predicate not in self.axiom_list_dict]
        self.check_constraints()

    def print_ground_constraints_info(self):
        print("Always pre grounding --------------> {}".format(
            self.normalized_task.hard_constraints_map[pddl.constraints.ALWAYS][NUM]))
        print("Always post grounding -------------> {}".format(
            self.ground_constraints_dict[pddl.constraints.ALWAYS][NUM]))

        print("Sometime pre grounding ------------> {}".format(
            self.normalized_task.hard_constraints_map[pddl.constraints.SOMETIME][NUM]))
        print("Sometime post grounding -----------> {}".format(
            self.ground_constraints_dict[pddl.constraints.SOMETIME][NUM]))

        print("Sometime-Before pre grounding -----> {}".format(
            self.normalized_task.hard_constraints_map[pddl.constraints.SOMETIMEBEFORE][NUM]))
        print("Sometime-Before post grounding ----> {}".format(
            self.ground_constraints_dict[pddl.constraints.SOMETIMEBEFORE][NUM]))

        print("Sometime-After pre grounding ------> {}".format(
            self.normalized_task.hard_constraints_map[pddl.constraints.SOMETIMEAFTER][NUM]))
        print("Sometime-After post grounding -----> {}".format(
            self.ground_constraints_dict[pddl.constraints.SOMETIMEAFTER][NUM]))

        print("At-Most-Once pre grounding --------> {}".format(
            self.normalized_task.hard_constraints_map[pddl.constraints.ATMOSTONCE][NUM]))
        print("At-Most-Once post grounding -------> {}".format(
            self.ground_constraints_dict[pddl.constraints.ATMOSTONCE][NUM]))

    def check_constraints(self):
        # Here i check that the i have the right number of always and
        # sometime constraints
        num_always = self.ground_constraints_dict[pddl.constraints.ALWAYS][NUM]
        num_sometime = self.ground_constraints_dict[pddl.constraints.SOMETIME][NUM]
        if num_always != self.normalized_task.hard_constraints_map[pddl.constraints.ALWAYS][NUM]:
            raise AlwaysError('Problem not solvable! one or more always constraints are not satisfiable')
        if num_sometime != self.normalized_task.hard_constraints_map[pddl.constraints.SOMETIME][NUM]:
            raise SometimeError('Problem not solvable! one or more sometime constraints are not satisfiable')

    def fix_goal(self, goal):
        if isinstance(goal, pddl.Literal):
            new_goal = self.axiom2formula_dict.get(get_atom_key(goal), None)
            if new_goal is None:
                return goal
            else:
                return new_goal
        else:
            new_parts = []
            for part in goal.parts:
                new_part = self.axiom2formula_dict.get(get_atom_key(part), None)
                if new_part is None:
                    new_parts.append(part)
                else:
                    if part.negated:
                        new_parts.append(new_part.negate())
                    else:
                        new_parts.append(new_part)
            if isinstance(goal, pddl.Disjunction):
                return pddl.Disjunction(new_parts).simplified()
            elif isinstance(goal, pddl.Conjunction):
                return pddl.Conjunction(new_parts).simplified()

    def init_dictionaries(self):
        axioms_dict = {}
        for axiom in self.ground_axioms:
            pred = axiom.effect.predicate
            axiom_key = get_axiom_key(axiom)
            if pred not in axioms_dict:
                axioms_dict[pred] = {}
            if axiom_key not in axioms_dict[pred]:
                axioms_dict[pred][axiom_key] = []
            axioms_dict[pred][axiom_key].append(axiom)
        self.axiom_list_dict = axioms_dict
        self.axioms2formulas()

        original_actions = []
        constraints_action_dict = {}
        for action in self.ground_actions:
            if isConstraint(action):
                primary_key, secondary_key = get_constraint_action_keys(action)
                if primary_key not in constraints_action_dict:
                    constraints_action_dict[primary_key] = {}
                if secondary_key not in constraints_action_dict[primary_key]:
                    constraints_action_dict[primary_key][secondary_key] = []
                constraints_action_dict[primary_key][secondary_key].append(action)
            else:
                self.check_preconditions(action)
                original_actions.append(action)
        self.constraints_action_list_dict = constraints_action_dict
        self.ground_actions = original_actions

    def check_preconditions(self, action):
        # To remove axioms to the preconditions of an action
        # TODO possible optimization: the presence of an axiom could be verified in the lifted
        # TODO action. No need to check this for all actions.
        new_preconditions = []
        for pre in action.precondition:
            new_pre = self.axiom2formula_dict.get(get_atom_key(pre), None)
            if new_pre is None:
                new_preconditions.append(pre)
            else:
                if pre.negated:
                    new_pre = new_pre.negate()
                if isinstance(new_pre, pddl.Conjunction):
                    for part in new_pre.parts:
                        if isinstance(part, pddl.Literal):
                            new_preconditions.append(part)
                        else:
                            raise Exception("Error in axiom to precondition translation")
                elif isinstance(new_pre, pddl.Literal):
                    new_preconditions.append(new_pre)
                else:
                    raise Exception("Error in axiom to precondition translation")
        action.precondition = new_preconditions

    def axioms2formulas(self):
        for axiom_pred in self.axiom_list_dict.keys():
            for axiom_name in self.axiom_list_dict[axiom_pred].keys():
                if axiom_name not in self.axiom2formula_dict:
                    formula = self.axiom2formula(axiom_name, axiom_pred)
                    self.axiom2formula_dict[axiom_name] = formula

    def axiom2formula(self, axiom_name, axiom_pred):
        axiom_list = self.axiom_list_dict[axiom_pred][axiom_name]
        disjunction_parts = []
        for axiom in axiom_list:
            conjunction_parts = []
            for atom in axiom.condition:
                atom_name = get_atom_key(atom)
                if atom.predicate in self.axiom_list_dict:
                    part = self.axiom2formula_dict.get(atom_name, None)
                    if part is None:
                        part = self.axiom2formula(atom_name, atom.predicate)
                        self.axiom2formula_dict[atom_name] = part
                    if atom.negated:
                        part = part.negate()
                else:
                    part = atom
                conjunction_parts.append(part)
            if len(conjunction_parts) == 0:
                conjunction = pddl.Truth()
            else:
                conjunction = pddl.Conjunction(conjunction_parts)
            disjunction_parts.append(conjunction)
        disjunction = pddl.Disjunction(disjunction_parts)
        return disjunction.simplified()

    def actions2constraints(self):
        for atom_predicate in self.constraints_action_list_dict.keys():
            for atom_predicate_args in self.constraints_action_list_dict[atom_predicate].keys():
                if atom_predicate_args not in self.action2formula_dict:
                    formula = self.action2formula(atom_predicate, atom_predicate_args)
                    self.action2formula_dict[atom_predicate_args] = formula

    def action2formula(self, primary_key, secondary_key):
        action_list = self.constraints_action_list_dict[primary_key][secondary_key]
        disjunction_parts = []
        for action in action_list:
            conjunction_parts = []
            for atom in action.precondition:
                atom_name = get_atom_key(atom)
                if atom.predicate in self.axiom_list_dict:
                    part = self.axiom2formula_dict.get(atom_name, None)
                    if part is None:
                        raise Exception("ERROR! axiom not converted in formula")
                    if atom.negated:
                        part = part.negate()
                else:
                    part = atom
                conjunction_parts.append(part)
            if len(conjunction_parts) == 0:
                conjunction = pddl.Truth()
            else:
                conjunction = pddl.Conjunction(conjunction_parts)
            disjunction_parts.append(conjunction)
        disjunction = pddl.Disjunction(disjunction_parts)
        return disjunction.simplified()

    def init_ground_constraints(self):
        for kind in pddl.constraints.KINDS:
            lifted_cation_constraints_list = self.normalized_task.hard_constraints_map[kind][CONSTRAINTS]
            if kind == pddl.constraints.SOMETIMEBEFORE or kind == pddl.constraints.SOMETIMEAFTER:
                self.manage_pair_gd(kind, lifted_cation_constraints_list)
            else:
                self.manage_single_gd(kind, lifted_cation_constraints_list)

    def manage_pair_gd(self, kind, lifted_axiom_constraints_list):
        for (phi_lifted, psi_lifted) in lifted_axiom_constraints_list:
            ground_phi_list = self.constraints_action_list_dict.get(phi_lifted, None)
            if ground_phi_list is not None:
                for phi_ground in ground_phi_list.keys():
                    # phi_ground contains at least one axiom, that has the axiom itself
                    # as effect. So i get the axiom in this way (by accessing at the first element of the list).
                    # I need this axiom because i can (with the substitution of the parameters) get the psi axiom
                    # in O(1) (without scanning the ground_axiom_constraints_list of psi to get the axiom with the same
                    # parameters). This method run in O(k) where k is the number of instantiations of a
                    # sometime-[after, before]
                    _, atom_phi = ground_phi_list[phi_ground][0].add_effects[0]
                    atom_psi = pddl.Atom(psi_lifted, atom_phi.args)
                    if atom_psi.predicate not in self.constraints_action_list_dict or \
                            not get_atom_key(atom_psi) in self.constraints_action_list_dict[atom_psi.predicate]:
                        self.ground_constraints_dict[kind][CONSTRAINTS].append((phi_ground, None))
                    # TODO maybe it's better to instantiate an object here
                    else:
                        self.remove_support_axiom(atom_phi, atom_psi)
                        self.ground_constraints_dict[kind][CONSTRAINTS].append((phi_ground, get_atom_key(atom_psi)))

    def manage_single_gd(self, kind, lifted_action_constraints_list):
        for phi_lifted in lifted_action_constraints_list:
            ground_phi_list = self.constraints_action_list_dict.get(phi_lifted, None)
            # ground_phi_list is none when a constraint is removed in the grounding phase
            if ground_phi_list is not None:
                for phi_ground in ground_phi_list.keys():
                    # TODO maybe it's better to instantiate an object here
                    self.ground_constraints_dict[kind][CONSTRAINTS].append(phi_ground)

    def remove_support_axiom(self, phi, psi):
        # I need to remove phi from psi axioms precondition
        psi_action_list = self.constraints_action_list_dict[psi.predicate][get_atom_key(psi)]
        for action in psi_action_list:
            action.precondition = [condition for condition in action.precondition if condition != phi]

    '''This is not really efficient, maybe this can be aggregated to another method'''

    def complete_ground_constraints(self):
        for kind in pddl.constraints.KINDS:
            ground_constraints = []
            if pddl.constraints.has2gd(kind):
                for (phi, psi) in self.ground_constraints_dict[kind][CONSTRAINTS]:
                    gd1 = self.action2formula_dict[phi]
                    if psi is None:
                        gd2 = pddl.Falsity()
                    else:
                        gd2 = self.action2formula_dict[psi]
                    if kind == pddl.constraints.SOMETIMEBEFORE:
                        ground_constraints.append(pddl.constraints.SometimeBefore(gd1, gd2))
                    else:
                        ground_constraints.append(pddl.constraints.SometimeAfter(gd1, gd2))
            else:
                for phi in self.ground_constraints_dict[kind][CONSTRAINTS]:
                    gd = self.action2formula_dict[phi]
                    if kind == pddl.constraints.ALWAYS:
                        ground_constraints.append(pddl.constraints.Always(gd))
                    elif kind == pddl.constraints.SOMETIME:
                        ground_constraints.append(pddl.constraints.Sometime(gd))
                    elif kind == pddl.constraints.ATMOSTONCE:
                        ground_constraints.append(pddl.constraints.AtMostOnce(gd))
                    elif kind == pddl.constraints.ATEND:
                        ground_constraints.append(pddl.constraints.AtEnd(gd))
            self.ground_constraints_dict[kind][CONSTRAINTS] = ground_constraints
            self.ground_constraints_dict[kind][NUM] = len(ground_constraints)


def get_num_instantiations(type_to_objects, parameters):
    card_list = [len(type_to_objects.get(par.type_name, []))
                 for par in parameters]
    num = 1
    for card in card_list:
        num *= card
    return num


# def substitute_goal_with_at_end(task):
#     if isinstance(task.goal, pddl.Conjunction):
#         new_at_end = []
#         for part in task.goal.parts:
#             new_at_end.append(pddl.AtEnd(part))
#         task.goal = pddl.Truth()
#         at_end_constr = pddl.Conjunction(new_at_end)
#         new_constraints = pddl.Conjunction([task.hard_constraints, at_end_constr]).simplified()
#         task.hard_constraints = new_constraints

def hard_constraints_preprocessing(task):
    normalizer = ConstraintsNormalizer(task.hard_constraints, task.objects, task.types)
    task.hard_constraints_map = normalizer.hard_constraints_map
    task.actions = task.actions + normalizer.new_actions


class ConstraintsNormalizer:

    def __init__(self, constraints_formula, objects, types):
        self.hard_constraints_map = {pddl.constraints.ATMOSTONCE: {NUM: 0, CONSTRAINTS: []},
                                     pddl.constraints.ALWAYS: {NUM: 0, CONSTRAINTS: []},
                                     pddl.constraints.SOMETIME: {NUM: 0, CONSTRAINTS: []},
                                     pddl.constraints.SOMETIMEBEFORE: {NUM: 0, CONSTRAINTS: []},
                                     pddl.constraints.SOMETIMEAFTER: {NUM: 0, CONSTRAINTS: []}}
        self.objects = objects
        self.types = types
        self.constraint_list = []
        self.new_actions = []
        self.new_action_counter = 0
        if constraints_formula is not None and not isinstance(constraints_formula, pddl.Truth):
            self.normalize(constraints_formula, ())
            # TODO should i re-uniquify the parameters?
            if SPLIT_ALWAYS:
                self.split_always()
            self.constraints2actions()

    def normalize(self, constraints_formula, parameters):
        if isinstance(constraints_formula, pddl.Conjunction):
            for conjunct in constraints_formula.parts:
                self.normalize(conjunct, parameters)
        elif isinstance(constraints_formula, pddl.UniversalCondition):
            if DEBUG:
                self.check_disjoint_paramters(parameters, constraints_formula.parameters)
            self.normalize(constraints_formula.parts[0], parameters + constraints_formula.parameters)
        elif isinstance(constraints_formula, pddl.constraints.HardConstraint):
            self.store(constraints_formula, parameters)
        else:
            raise Exception("Constraints Normalization Error. Check the (:constraints field")

    def store(self, constraints_formula, parameters):
        if len(parameters) == 0:
            self.constraint_list.append(constraints_formula)
        else:
            self.constraint_list.append(pddl.UniversalCondition(parameters, [constraints_formula]))

    def check_disjoint_paramters(self, p1, p2):
        intersection = set(p1).intersection(set(p2))
        if len(intersection) > 0:
            print(NON_DISJOINT_PARAMETER_SET_MSG)

    def constraints2actions(self):
        type_to_objects = instantiate.get_objects_by_type(self.objects, self.types)
        for c in self.constraint_list:
            if isinstance(c, pddl.UniversalCondition):
                constraint = c.parts[0]
                kind = constraint.kind
                parameters = c.parameters
                num = get_num_instantiations(type_to_objects, parameters)
                self.hard_constraints_map[kind][NUM] += num
            else:
                constraint = c
                kind = constraint.kind
                parameters = ()
                self.hard_constraints_map[kind][NUM] += 1
            phi_atom = self.constraint2action(parameters, constraint.gd1)
            if pddl.constraints.has2gd(kind):
                psi_precondition = pddl.Conjunction([constraint.gd2, phi_atom]).simplified()
                psi_atom = self.constraint2action(parameters, psi_precondition)
                self.hard_constraints_map[kind][CONSTRAINTS].append((phi_atom.predicate, psi_atom.predicate))
            else:
                self.hard_constraints_map[kind][CONSTRAINTS].append(phi_atom.predicate)

    def constraint2action(self, parameters, preconditions):
        atom_predicate = NEW_ATOM_TEMPLATE.format(self.new_action_counter)
        atom_arguments = [parameter.name for parameter in parameters]
        action_name = NEW_ACTION_TEMPLATE.format(self.new_action_counter)
        atom = pddl.Atom(atom_predicate, atom_arguments)
        effect = pddl.Effect([], pddl.Truth(), atom)
        action = pddl.Action(action_name, parameters, len(parameters), preconditions, [effect], 1)
        self.new_action_counter += 1
        self.new_actions.append(action)
        return atom

    def split_always(self):
        new_constraints_list = []
        for c in self.constraint_list:
            if isinstance(c, pddl.Always):
                if isinstance(c.gd1, pddl.Conjunction):
                    new_constraints_list = new_constraints_list + [pddl.Always(part) for part in c.gd1.parts]
                else:
                    new_constraints_list.append(c)
            else:
                new_constraints_list.append(c)
        self.constraint_list = new_constraints_list

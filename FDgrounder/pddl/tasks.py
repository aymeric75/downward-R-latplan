from . import axioms
from . import predicates
from . import conditions


class Task:
    def __init__(self, domain_name, task_name, requirements,
                 types, objects, predicates, functions, init, goal,
                 actions, axioms, use_metric, hard_constraints=None):
        self.domain_name = domain_name
        self.task_name = task_name
        self.requirements = requirements
        self.types = types
        self.objects = objects
        self.predicates = predicates
        self.functions = functions
        self.init = init
        self.goal = goal
        self.actions = actions
        self.axioms = axioms
        self.axiom_counter = 0
        self.use_min_cost_metric = use_metric
        self.hard_constraints = hard_constraints
        self.hard_constraints_map = {}

    def add_axiom(self, parameters, condition):
        name = "new-axiom@%d" % self.axiom_counter
        self.axiom_counter += 1
        axiom = axioms.Axiom(name, parameters, len(parameters), condition)
        self.predicates.append(predicates.Predicate(name, parameters))
        self.axioms.append(axiom)
        return axiom

    def dump(self):
        print("Problem %s: %s [%s]" % (
            self.domain_name, self.task_name, self.requirements))
        print("Types:")
        for type in self.types:
            print("  %s" % type)
        print("Objects:")
        for obj in self.objects:
            print("  %s" % obj)
        print("Predicates:")
        for pred in self.predicates:
            print("  %s" % pred)
        print("Functions:")
        for func in self.functions:
            print("  %s" % func)
        print("Init:")
        for fact in self.init:
            print("  %s" % fact)
        print("Goal:")
        self.goal.dump()
        print("Actions:")
        for action in self.actions:
            action.dump()
        if self.axioms:
            print("Axioms:")
            for axiom in self.axioms:
                axiom.dump()
    
    '''
    Returns a string with the domain of the task in PDDL
    '''
    def get_pddl_domain(self):
        header = '(define (domain {domain_name})\n{domain_body})'
        requirements = '(:requirements :adl)\n'
        predicates_str = '(:predicates \n{})\n'
        actions = ''
        predicates = ''
        axioms = ''
        for axiom in self.axioms:
            axioms += f'{axiom.to_pddl()}\n\n'
        for predicate in self.predicates:
            if predicate.name != '=':
                predicates += '\t{}\n'.format(predicate.to_pddl())
        for action in self.actions:
            actions += '{}\n\n'.format(action.to_pddl())
        domain_types = ''
        for t in self.types:
            if t.basetype_name is not None:
                domain_types += f"\t{t.name} - {t.basetype_name}\n"
        domain_types = '(:types\n' + domain_types + ')\n'
        domain_body = requirements + domain_types + predicates_str.format(predicates) + axioms + actions
        if self.domain_name != '':
            domain_name = self.domain_name
        else:
            domain_name = 'pddl-domain'
        domain_str = header.format(domain_name=domain_name,
                                   domain_body=domain_body)
        return domain_str
    
    '''
    Returns a string with the problem of the task in PDDL
    '''
    def get_pddl_problem(self):
        header = '(define (problem {problem_name})\n(:domain {domain_name})\n{problem_body})'

        objects_field = '(:objects \n{})\n'

        obj_str = ''
        for obj in self.objects:
            obj_str += '\t{}\n'.format(obj.to_pddl())

        init_facts = '(:init \n{})\n'

        if isinstance(self.goal, conditions.Truth):
            goal = '(:goal (and ))\n'
        else:
            goal = '(:goal {})\n'.format(self.goal.to_pddl())

        init = ''
        init_list = list(self.init)
        for atom in sorted(init_list):
            if atom.predicate != '=':
                init += '\t{}\n'.format(atom.to_pddl())
        problem_body = objects_field.format(obj_str) + init_facts.format(init) + goal
        if self.domain_name != '':
            domain_name = self.domain_name
        else:
            domain_name = 'pddl-domain'

        if self.hard_constraints is not None:
            problem_body += f'(:constraints {self.hard_constraints.to_pddl()})'
            
        problem_str = header.format(problem_name=self.task_name,
                                    domain_name=domain_name,
                                    problem_body=problem_body)
        
        return problem_str


class Requirements:
    def __init__(self, requirements):
        self.requirements = requirements
        for req in requirements:
            assert req in (
              ":strips", ":adl", ":typing", ":negation", ":equality",
              ":negative-preconditions", ":disjunctive-preconditions",
              ":existential-preconditions", ":universal-preconditions",
              ":quantified-preconditions", ":conditional-effects",
              ":derived-predicates", ":action-costs", ":preferences", ":constraints"), req
    def __str__(self):
        return ", ".join(self.requirements)

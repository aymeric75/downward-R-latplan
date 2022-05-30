from . import pddl
from . import pddl_parser
from . import normalize
from . import hard_constraints_manager
from . import instantiate


def ground(domain, problem):
    task = pddl_parser.open(domain_filename=domain, task_filename=problem)
    normalize.normalize(task)
    (relaxed_reachable, atoms, actions, axioms, reachable_action_params) = instantiate.explore(task)
    hard_constraints_manager.SPLIT_ALWAYS = True
    groundedTask = hard_constraints_manager.GroundedConstraintsTask(task, atoms, actions, axioms)
    G = groundedTask.goal
    A = groundedTask.ground_actions
    F = groundedTask.atoms
    I = groundedTask.initial_state
    C = []
    for kind in pddl.constraints.KINDS:
        C += groundedTask.ground_constraints_dict[kind][hard_constraints_manager.CONSTRAINTS]
    return F, A, I, G, C

def get_ground_task(domain, problem):
    task = pddl_parser.open(domain_filename=domain, task_filename=problem)
    normalize.normalize(task)
    (relaxed_reachable, atoms, actions, axioms, reachable_action_params) = instantiate.explore(task)
    hard_constraints_manager.SPLIT_ALWAYS = True
    groundedTask = hard_constraints_manager.GroundedConstraintsTask(task, atoms, actions, axioms)
    G = groundedTask.goal
    A = groundedTask.ground_actions
    F = groundedTask.atoms
    I = groundedTask.initial_state
    C = []
    for kind in pddl.constraints.KINDS:
        C += groundedTask.ground_constraints_dict[kind][hard_constraints_manager.CONSTRAINTS]
    return F, A, I, G, C, groundedTask

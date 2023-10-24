from . import conditions


class Axiom:
    def __init__(self, name, parameters, num_external_parameters, condition):
        # For an explanation of num_external_parameters, see the
        # related Action class. Note that num_external_parameters
        # always equals the arity of the derived predicate.
        assert 0 <= num_external_parameters <= len(parameters)
        self.name = name
        self.parameters = parameters
        self.num_external_parameters = num_external_parameters
        self.condition = condition
        self.uniquify_variables()

    def dump(self):
        args = map(str, self.parameters[:self.num_external_parameters])
        print("Axiom %s(%s)" % (self.name, ", ".join(args)))
        self.condition.dump()

    def uniquify_variables(self):
        self.type_map = {par.name: par.type_name for par in self.parameters}
        self.condition = self.condition.uniquify_variables(self.type_map)

    def instantiate(self, var_mapping, init_facts, fluent_facts):
        # The comments for Action.instantiate apply accordingly.
        arg_list = [self.name] + [
            var_mapping[par.name]
            for par in self.parameters[:self.num_external_parameters]]
        name = "(%s)" % " ".join(arg_list)

        condition = []
        try:
            self.condition.instantiate(var_mapping, init_facts, fluent_facts, condition)
        except conditions.Impossible:
            return None

        effect_args = [var_mapping.get(arg.name, arg.name)
                       for arg in self.parameters[:self.num_external_parameters]]
        effect = conditions.Atom(self.name, effect_args)
        return PropositionalAxiom(name, condition, effect)

    def __repr__(self) -> str:
        return '<Axiom %s(%s) <- %s>' % (self.name, " ".join([str(p) for p in self.parameters]), self.condition)


class PropositionalAxiom:
    def __init__(self, name, condition, effect):
        self.name = name
        self.condition = condition
        self.effect = effect

    def clone(self):
        return PropositionalAxiom(self.name, list(self.condition), self.effect)

    def dump(self):
        if self.effect.negated:
            print("not", end=' ')
        print(self.name)
        for fact in self.condition:
            print("PRE: %s" % fact)
        print("EFF: %s" % self.effect)

    @property
    def key(self):
        return (self.name, self.condition, self.effect)

    def __hash__(self) -> int:
        return hash((self.name, tuple(self.condition), self.effect))

    def __lt__(self, other):
        return self.key < other.key

    def __le__(self, other):
        return self.key <= other.key

    def __eq__(self, other):
        return self.key == other.key

    def __repr__(self):
        return '<PropAxiom [%s] %s <- %s>' % (
            self.name, self.effect, self.condition)

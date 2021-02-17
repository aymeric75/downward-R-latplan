from . import conditions

ALWAYS = 'always'
SOMETIME = 'sometime'
ATMOSTONCE = 'at-most-once'
SOMETIMEBEFORE = 'sometime-before'
SOMETIMEAFTER = 'sometime-after'

KINDS = [ALWAYS, SOMETIME, ATMOSTONCE, SOMETIMEAFTER, SOMETIMEBEFORE]


def has2gd(kind):
    return kind == SOMETIMEAFTER or kind == SOMETIMEBEFORE


class HardConstraint:
    def __init__(self, condition, kind):
        self.gd1 = condition
        self.kind = kind
        self.hash = hash((self.__class__, self.gd1))
        self.monitoring_atom = ''

    def uniquify_variables(self, type_map, renamings={}):
        return self.__class__(self.gd1.uniquify_variables(type_map, renamings))

    def _postorder_visit(self, method_name, *args):
        return self.__class__(self.gd1._postorder_visit(method_name, *args))

    def __eq__(self, other):
        return (self.__class__ == other.__class__ and
                self.gd1 == other.gd1)

    def __hash__(self):
        return self.hash

    def set_monitoring_atom_predicate(self, predicate):
        self.monitoring_atom = predicate

class Always(HardConstraint):
    def __init__(self, condition):
        super().__init__(condition, ALWAYS)


class Sometime(HardConstraint):
    def __init__(self, condition):
        super().__init__(condition, SOMETIME)


class AtMostOnce(HardConstraint):
    def __init__(self, condition):
        super().__init__(condition, ATMOSTONCE)


class SometimeBefore(HardConstraint):
    def __init__(self, condition1, condition2):
        super().__init__(condition1, SOMETIMEBEFORE)
        self.gd2 = condition2
        self.hash = hash((self.__class__, self.gd1, self.gd2))

    def uniquify_variables(self, type_map, renamings={}):
        # TODO check this !!!
        return self.__class__(self.gd1.uniquify_variables(type_map, renamings),
                              self.gd2.uniquify_variables(type_map, renamings))

    def _postorder_visit(self, method_name, *args):
        return self.__class__(self.gd1._postorder_visit(method_name, *args),
                              self.gd2._postorder_visit(method_name, *args))

    def __eq__(self, other):
        return (self.__class__ == other.__class__ and
                self.gd1 == other.gd1 and self.gd2 == other.gd2)

    def __hash__(self):
        return self.hash


class SometimeAfter(HardConstraint):
    def __init__(self, condition1, condition2):
        super().__init__(condition1, SOMETIMEAFTER)
        self.gd2 = condition2
        self.hash = hash((self.__class__, self.gd1, self.gd2))

    def uniquify_variables(self, type_map, renamings={}):
        # TODO check this !!!
        return self.__class__(self.gd1.uniquify_variables(type_map, renamings),
                              self.gd2.uniquify_variables(type_map, renamings))

    def _postorder_visit(self, method_name, *args):
        return self.__class__(self.gd1._postorder_visit(method_name, *args),
                              self.gd2._postorder_visit(method_name, *args))

    def __eq__(self, other):
        return (self.__class__ == other.__class__ and
                self.gd1 == other.gd1 and self.gd2 == other.gd2)

    def __hash__(self):
        return self.hash

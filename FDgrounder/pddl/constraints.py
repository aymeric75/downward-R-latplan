from . import conditions

ALWAYS = 'always'
SOMETIME = 'sometime'
ATMOSTONCE = 'at-most-once'
SOMETIMEBEFORE = 'sometime-before'
SOMETIMEAFTER = 'sometime-after'
ALWAYSNEXT = 'always-next'
PATTERN = 'pattern'

NARY_KINDS = [PATTERN]

KINDS = [ALWAYS, SOMETIME, ATMOSTONCE, SOMETIMEAFTER, SOMETIMEBEFORE, ALWAYSNEXT, PATTERN]


def has2gd(kind):
    return kind == SOMETIMEAFTER or kind == SOMETIMEBEFORE or kind == ALWAYSNEXT


def isNary(kind):
    return kind in NARY_KINDS


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


class AlwaysNext(HardConstraint):
    def __init__(self, condition1, condition2):
        super().__init__(condition1, ALWAYSNEXT)
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


class NaryConstraint:
    def __init__(self, condition_list, kind):
        self.gd1 = condition_list
        self.kind = kind
        assert isinstance(condition_list, list)
        self.hash = hash((self.__class__, tuple(condition_list)))

    def uniquify_variables(self, type_map, renamings={}):
        return self.__class__([cond.uniquify_variables(type_map, renamings) for cond in self.gd1])

    def _postorder_visit(self, method_name, *args):
        return self.__class__([cond._postorder_visit(method_name, *args) for cond in self.gd1])

    def __eq__(self, other):
        if self.__class__ != other.__class__:
            return False
        if len(self.gd1) != len(other.gd1):
            return False
        for i in range(len(self.gd1)):
            if self.gd1[i] != other.gd1[i]:
                return False
        return True

    def __hash__(self):
        return self.hash


class Pattern(NaryConstraint):
    def __init__(self, condition_list):
        super(Pattern, self).__init__(condition_list, PATTERN)

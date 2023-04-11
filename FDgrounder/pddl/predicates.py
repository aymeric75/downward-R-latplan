class Predicate:
    def __init__(self, name, arguments):
        self.name = name
        self.arguments = arguments

    def __str__(self):
        return "%s(%s)" % (self.name, ", ".join(map(str, self.arguments)))
    
    def __repr__(self):
        return f'Predicate: {str(self)}'

    def get_arity(self):
        return len(self.arguments)

import unittest
import os

import pkg_resources
from FDgrounder import ground


class TestRoversFirstOrder(unittest.TestCase):
    
    def setUp(self):
        self.pddl_path = pkg_resources.resource_filename(__name__, 'PDDL/foc/rover')


    def test_count_sa(self):
        F, A, I, G, C = ground(os.path.join(self.pddl_path, 'domain.pddl'), os.path.join(self.pddl_path, 'sometime-after.pddl'))
        assert len(C) == 4
    
    def test_count_sb(self):
        F, A, I, G, C = ground(os.path.join(self.pddl_path, 'domain.pddl'), os.path.join(self.pddl_path, 'sometime-before.pddl'))
        assert len(C) == 6
    
    def test_count_shared_forall_with_error_simple(self):
        F, A, I, G, C = ground(os.path.join(self.pddl_path, 'domain.pddl'), os.path.join(self.pddl_path, 'shared_forall_error_simple.pddl'))
        assert len(C) == 8
    
    def test_count_sa_sb_with_shared_forall(self):
        F, A, I, G, C = ground(os.path.join(self.pddl_path, 'domain.pddl'), os.path.join(self.pddl_path, 'shared_forall.pddl'))
        assert len(C) == 10
    
    def test_count_sa_sb_with_shared_forall_with_error(self):
        F, A, I, G, C = ground(os.path.join(self.pddl_path, 'domain.pddl'), os.path.join(self.pddl_path, 'shared_forall_error.pddl'))
        assert len(C) == 10
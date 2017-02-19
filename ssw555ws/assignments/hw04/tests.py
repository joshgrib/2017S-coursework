import unittest
from main import *

class UserStory04Tests(unittest.TestCase):
    def test1(self):
        #no marriage or divorce is fine
        self.assertTrue(marriage_before_divorce({},{}))
    def test2(self):
        #marriage without divorce is fine
        m = {"year":2000, "month":01, "day":01}
        self.assertTrue(marriage_before_divorce(m,{}))
    def test3(self):
        #divorce without marriage is NOT fine
        d = {"year":2000, "month":01, "day":01}
        self.assertFalse(marriage_before_divorce({},d))
    def test4(self):
        #both events, with marriage first is fine
        m = {"year":2000, "month":01, "day":01}
        d = {"year":2010, "month":01, "day":01}
        self.assertTrue(marriage_before_divorce(m,d))
    def test5(self):
        #both events, with divorce first is NOT fine
        d = {"year":2000, "month":01, "day":01}
        m = {"year":2010, "month":01, "day":01}
        self.assertFalse(marriage_before_divorce(m,d))

class UserStory05Tests(unittest.TestCase):
    def test1(self):
        #no marriage or death is fine
        self.assertTrue(marriage_before_death({},{}))
    def test2(self):
        #marriage without death is fine
        m = {"year":2000, "month":01, "day":01}
        self.assertTrue(marriage_before_death(m,{}))
    def test3(self):
        #death without marriage is fine
        d = {"year":2000, "month":01, "day":01}
        self.assertTrue(marriage_before_death({},d))
    def test4(self):
        #both events, with marriage first is fine
        m = {"year":2000, "month":01, "day":01}
        d = {"year":2010, "month":01, "day":01}
        self.assertTrue(marriage_before_death(m,d))
    def test5(self):
        #both events, with death first is NOT fine
        d = {"year":2000, "month":01, "day":01}
        m = {"year":2010, "month":01, "day":01}
        self.assertFalse(marriage_before_death(m,d))

if __name__ == '__main__':
    unittest.main()

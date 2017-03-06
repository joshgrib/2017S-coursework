# -*- coding: utf-8 -*-

"""
Josh Gribbon
SSW555WS - Agile Methods for Software Development
Homework 06 - Phase 1
2017-03-05
"""

import unittest
import datetime

def diffDays(d1, d2):
    """
    Takes in two datetimes and calculates the difference
    in days between them.
    """
    if d1 < d2:
        return (d2-d1).days
    return (d1-d2).days

def diffMonths(d1, d2):
    """
    Takes in two datetimes and calculates the difference
    in months between them.
    """
    return int(diffDays(d1, d2)/30.4)

def diffYears(d1, d2):
    """
    Takes in two datetimes and calculates the difference
    in years between them.
    """
    return int(diffDays(d1, d2)/365.25)

class dateDiffTests(unittest.TestCase):
    """
    Test cases for date difference functions
    """
    target1 = datetime.date(2000, 1, 1)
    target2 = datetime.date(2016, 10, 3)
    test1 = datetime.date(2010, 1, 15)
    test2 = datetime.date(2012, 6, 29)
    def testDayDiff0(self):
        self.assertEqual(diffDays(self.target1, self.test1), 3667)
    def testDayDiff1(self):
        self.assertEqual(diffDays(self.target2, self.test1), 2453)
    def testDayDiff2(self):
        self.assertEqual(diffDays(self.target1, self.test2), 4563)
    def testDayDiff3(self):
        self.assertEqual(diffDays(self.target2, self.test2), 1557)

    def testMonthDiff0(self):
        self.assertEqual(diffMonths(self.target1, self.test1), 120)
    def testMonthDiff1(self):
        self.assertEqual(diffMonths(self.target2, self.test1), 80)
    def testMonthDiff2(self):
        self.assertEqual(diffMonths(self.target1, self.test2), 150)
    def testMonthDiff3(self):
        self.assertEqual(diffMonths(self.target2, self.test2), 51)

    def testYearDiff0(self):
        self.assertEqual(diffYears(self.target1, self.test1), 10)
    def testYearDiff1(self):
        self.assertEqual(diffYears(self.target2, self.test1), 6)
    def testYearDiff2(self):
        self.assertEqual(diffYears(self.target1, self.test2), 12)
    def testYearDiff3(self):
        self.assertEqual(diffYears(self.target2, self.test2), 4)

def main():
    """ Write and test code to demonstrate calculating the number of
        days, months, and years between two arbitrary dates.
    """
    # dates lists for testing
    dates = [
        datetime.date(2010, 1, 15),
        datetime.date(2012, 6, 29)
    ]
    targets = [
        datetime.date(2000, 1, 1),
        datetime.date(2016, 10, 3)
    ]
    #loop through cases
    for d in dates:
        for t in targets:
            #calculate differences
            dayDiff = diffDays(d, t)
            monthDiff = diffMonths(d, t)
            yearDiff = diffYears(d, t)
            #create dictionary for printing
            vals = {"day":dayDiff, "month":monthDiff, "year":yearDiff}
            #print out values
            for period in vals:
                diff = vals[period]
                period = str(period) + ("s" if diff != 1 else "")
                print "There are {0} {1} between {2} and {3}".format(diff, period, t, d)

if __name__ == '__main__':
    unittest.main(exit=False)
    main()

""" TEST OUTPUT
............
----------------------------------------------------------------------
Ran 12 tests in 0.000s

OK
There are 10 years between 2000-01-01 and 2010-01-15
There are 3667 days between 2000-01-01 and 2010-01-15
There are 120 months between 2000-01-01 and 2010-01-15
There are 6 years between 2016-10-03 and 2010-01-15
There are 2453 days between 2016-10-03 and 2010-01-15
There are 80 months between 2016-10-03 and 2010-01-15
There are 12 years between 2000-01-01 and 2012-06-29
There are 4563 days between 2000-01-01 and 2012-06-29
There are 150 months between 2000-01-01 and 2012-06-29
There are 4 years between 2016-10-03 and 2012-06-29
There are 1557 days between 2016-10-03 and 2012-06-29
There are 51 months between 2016-10-03 and 2012-06-29
"""

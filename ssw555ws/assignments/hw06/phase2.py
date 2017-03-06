# -*- coding: utf-8 -*-
"""
Josh Gribbon
SSW555WS - Agile Methods for Software Development
Homework 06 - Phase 2
2017-03-05
"""

import unittest
import datetime

def diffDates(d1, d2, units):
    """
    Get day months and year differences between dates
    """
    if units not in ["days", "months", "years"]:
        error("Invalid unit type: " + str(units))
    divisors = {"days":1, "months":30.4, "years":365.25}
    divNum = divisors[units]
    diffDays = abs((d2-d1).days)
    return int(diffDays/divNum)

class dateDiffTests(unittest.TestCase):
    """
    Test cases for date difference functions
    """
    target1 = datetime.date(2000, 1, 1)
    target2 = datetime.date(2016, 10, 3)
    test1 = datetime.date(2010, 1, 15)
    test2 = datetime.date(2012, 6, 29)
    def testDayDiff0(self):
        self.assertEqual(diffDates(self.target1, self.test1, "days"), 3667)
    def testDayDiff1(self):
        self.assertEqual(diffDates(self.target2, self.test1, "days"), 2453)
    def testDayDiff2(self):
        self.assertEqual(diffDates(self.target1, self.test2, "days"), 4563)
    def testDayDiff3(self):
        self.assertEqual(diffDates(self.target2, self.test2, "days"), 1557)

    def testMonthDiff0(self):
        self.assertEqual(diffDates(self.target1, self.test1, "months"), 120)
    def testMonthDiff1(self):
        self.assertEqual(diffDates(self.target2, self.test1, "months"), 80)
    def testMonthDiff2(self):
        self.assertEqual(diffDates(self.target1, self.test2, "months"), 150)
    def testMonthDiff3(self):
        self.assertEqual(diffDates(self.target2, self.test2, "months"), 51)

    def testYearDiff0(self):
        self.assertEqual(diffDates(self.target1, self.test1, "years"), 10)
    def testYearDiff1(self):
        self.assertEqual(diffDates(self.target2, self.test1, "years"), 6)
    def testYearDiff2(self):
        self.assertEqual(diffDates(self.target1, self.test2, "years"), 12)
    def testYearDiff3(self):
        self.assertEqual(diffDates(self.target2, self.test2, "years"), 4)

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
            dayDiff = diffDates(d, t, "days")
            monthDiff = diffDates(d, t, "months")
            yearDiff = diffDates(d, t, "years")
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

"""TEST OUTPUT
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

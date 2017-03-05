# -*- coding: utf-8 -*-


"""
    We discussed both automatic testing with xUnit and refactoring.

    Your assignment is to use refactoring and automated testing to improve the
    code over two distinct phases.

    Phase 1:
        Start with the existing code.  You may choose to rewrite the Python
        code into Java, C++ or any other language of your choice.

        Create three separate reusable methods or functions that calculate:
        - the number of days between two arbitrary dates
        - the number of months between two arbitrary dates
        - the number of years between two arbitrary dates

        Use xUnit or other test platform to automatically test your new methods
        to eliminate the need for a human to review the output of print statements.
        Refactor the existing main() routine to use your new methods.
        Submit to Canvas your Phase 1 refactored code, unit tests, and the
        output from running the unit tests and the revised Phase 1 main() routine.

    Phase 2:
        Refactor your code from phase 1 to replace the three separate methods
        for calculating the number of days, months, and years between two
        arbitrary dates with a single method/function.

        Update your automated test cases to test the new method/function.
        Notice how testing is easier after the Phase 1 refactoring because you
        already have test cases that require only small changes to use the
        new Phase 2 method.

        Update the main() routine to use the new Phase 2 method.
        Submit the second refactoring of your code along with the output of
        the automated testing and main() routine.

    For the record, this code is intentionally UGLY to encourage you
    to refactor it to make it better!

"""

import unittest
import datetime

def diffDays(d1, d2):
    print "Not Implemented yet."

def main():
    """ Write and test code to demonstrate calculating the number of
        days, months, and years between two arbitrary dates.
    """
    target1 = datetime.date(2000, 1, 1)
    target2 = datetime.date(2016, 10, 3)

    # dates is a list of dates
    dates = [
        datetime.date(2010, 1, 15),
        datetime.date(2012, 6, 29)
    ]

    # loop through each of the dates and compare to the target1 and target2
    for date in dates:
        # print number of days between date and target1
        if target1 > date:
            print('There are', (target1 - date).days, 'days between', target1, 'and', date)
        else:
            print('There are', (date - target1).days, 'days between', target1, 'and', date)

        # print number of days between date and target1
        if target2 > date:
            print('There are', (target2 - date).days, 'days between', target2, 'and', date)
        else:
            print('There are', (date - target2).days, 'days between', target2, 'and', date)

        # Assume there are 30.4 days per month
        # Print the number of months between date and target1
        if target1 > date:
            print('There are', int((target1 - date).days / 30.4), 'months between', target1, 'and', date)
        else:
            print('There are', int((date - target1).days / 30.4), 'months between', target1, 'and', date)

        # Print the number of months between date and target2
        if target2 > date:
            print('There are', int((target2 - date).days / 30.4), 'months between', target2, 'and', date)
        else:
            print('There are', int((date - target2).days / 30.4), 'months between', target2, 'and', date)

        # Assume there are 365.25 days per year
        # Print the number of years between date and target1
        if target1 > date:
            print('There are', int((target1 - date).days / 365.25), 'years between', target1, 'and', date)
        else:
            print('There are', int((date - target1).days / 365.25), 'years between', target1, 'and', date)

        # Print the number of years between date and target2
        if target2 > date:
            print('There are', int((target2 - date).days / 365.25), 'years between', target2, 'and', date)
        else:
            print('There are', int((date - target2).days / 365.25), 'years between', target2, 'and', date)



if __name__ == '__main__':
    unittest.main(exit=False)
    main()

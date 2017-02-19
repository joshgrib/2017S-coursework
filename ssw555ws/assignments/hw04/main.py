def firstDateIsEarlier(d1, d2):
    """
    Given dates in the form {"year":1970, "month": 01, "day": 01},
    return True if the first date is the earlier of the two
    """
    yyyymmdd1 = str(d1["year"]) + str(d1["month"]) + str(d1["day"])
    yyyymmdd2 = str(d2["year"]) + str(d2["month"]) + str(d2["day"])
    return int(yyyymmdd1) < int(yyyymmdd2)

def marriage_before_divorce(mar, div):
    """
    user story 04
    Marriage should occur before divorce of spouses,
    and divorce can only occur after marriage
    """
    if div == {}:
        return True #nothing to worry about
    if mar == {}:
        return False #divorce without marriage doesn't work
    return firstDateIsEarlier(mar, div)

def marriage_before_death(mar, death):
    """
    user story 05
    Marriage should occur before death of either spouse
    """
    if mar == {}:
        return True #nothing to worry about
    if death == {}:
        return True #marriage without death is fine
    return firstDateIsEarlier(mar, death)

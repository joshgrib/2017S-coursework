"""
Josh Gribbon
SSW555WS - Agile Methods for Software Development
Project 02 - programs to read GEDCOM file
20170205
"""

tags_level0 = ["INDI", "FAM", "HEAD", "TRLR", "NOTE"]
tags_level1 = ["NAME", "SEX", "BIRT", "DEAT", "FAMC", "FAMS", "MARR", "HUSB", "WIFE", "CHIL", "DIV"]
tags_level2 = ["DATE"]
tags = tags_level0 + tags_level1 + tags_level2
tags_special = ["INDI", "FAM"]

for line in open('project01.ged', 'r'):
    #print line
    l = line.rstrip() #remove trailing newline
    print l

    args = l.split(' ')

    #print level
    level = args[0]
    print "\tLevel: {0}".format(level)

    #print tag
    arg1 = args[1]
    arg2 = "not set yet"
    if len(args) > 2:
        arg2 = args[2]
    tag = "Invalid tag"
    if arg1 in tags:
        tag = arg1
    elif arg2 in tags_special:
        tag = arg2
    print "\tTag: {0}".format(tag)

"""
Josh Gribbon
SSW555WS - Agile Methods for Software Development
Project 02 - programs to read GEDCOM file
20170205
"""

text_file = open('./project01.ged', 'r')

print "Printing each line of gedcom file followed by level no and tag  line"

for line in text_file:
   print "line is:-", line

3 left | 9 down | 7 down
8 down | 6 down | 2 down
5 left | 1 up   | 4 up


find matching squares, then add on 2 to an end, then build up more.


blocks = {
    0:{
        0:{
            "color": "r",
            "head": 1
        1:{
            "color": "b",
            "head": 1
        2:{
            "color": "y",
            "head": 0
        3:{
            "color": "g"
            "head": 0
        top:1
    },
    1:...
}

Solution printout
+--------+--------+--------+
|0  B1   |1  B1   |2  B1   |
|R1    Y0|R1    Y0|R1    Y0|
|   G0   |   G0   |   G0   |
+--------+--------+--------+
|0  B1   |1  B1   |2  B1   |
|R1    Y0|R1    Y0|R1    Y0|
|   G0   |   G0   |   G0   |
+--------+--------+--------+
|0  B1   |1  B1   |2  B1   |
|R1    Y0|R1    Y0|R1    Y0|
|   G0   |   G0   |   G0   |
+--------+--------+--------+

0, 1, 2, and 3 are read-only to describe the edge colors
top specifies the number on the top, then colors go clockwise

# Heading 1

## Heading 2

### Heading 3

#### Heading 4

##### Heading 5

###### Heading 6

_Italic_
**Bold**
[Link](http://www.google.com)
^Upper^ and ~lower~
~~strikethrough~~ and ==highlighting==

-   Bulleted
-   Lists
    -   Can
        -   Even
            -   Be
            -   Nested
-   Numbers
-   Work
-   Too
    > Blockquote

Code `inline` and block:

```python
def hello:
    print "Hello"
```

Latex inline $x \\geq 2$ and block:
$$
x =
\\dfrac
    {-b \\pm \\sqrt{b^2 - 4ac}}
    {2a}
$$
[LaTeX Character Reference](http://www.combinatorics.net/weblib/)

-   [ ] Checkboxes?
-   [x] check.

| Item     |    Value | Qty |
| :------- | -------: | :-: |
| Computer | 1600 USD |  8  |
| Phone    |   12 USD |  12 |
| Pipe     |    1 USD | 234 |

## Graphs

> These graphs and stuff are made from a request to an API that makes them. I was kinda stuck between this and the ones below, but they use a bunch of the same things, and these can be rendered on github.

![Alt text](<https://g.gravizo.com/svg?
  digraph G {
    aize ="4,4";
    main [shape=box];
    main -> parse [weight=8];
    parse -> execute;
    main -> init [style=dotted];
    main -> cleanup;
    execute -> { make_string; printf};
    init -> make_string;
    edge [color=red];
    main -> printf [style=bold,label="100 times"];
    make_string [label="make a string"];
    node [shape=box,style=filled,color=".7 .3 1.0"];
    execute -> compare;
  }>)

![Alt text](<https://g.gravizo.com/svg?
    graph G {
		rankdir=LR;
		a -- { b c d }; b -- { c e }; c -- { e f }; d -- { f g }; e -- h;
		f -- { h i j g }; g -- k; h -- { o l }; i -- { l m j }; j -- { m n k };
		k -- { n r }; l -- { o m }; m -- { o p n }; n -- { q r };
		o -- { s p }; p -- { s t q }; q -- { t r }; r -- t; s -- z; t -- z;
		{ rank=same, b, c, d }
		{ rank=same, e, f, g }
		{ rank=same, h, i, j, k }
		{ rank=same, l, m, n }
		{ rank=same, o, p, q, r }
		{ rank=same, s, t }
	}>)
![Alt text](<https://g.gravizo.com/svg?
    digraph G {
        a -> b -> c;
        b -> d;
        a [shape=polygon,sides=5,peripheries=3,color=lightblue,style=filled];
        c [shape=polygon,sides=4,skew=.4,label="hello world"]
        d [shape=invtriangle];
        e [shape=polygon,sides=4,distortion=.7];
    }>)

![Alt text](<https://g.gravizo.com/svg?
    digraph g {
        node [shape = record,height=.1];
        node0[label = "<f0> |<f1> G|<f2> "];
        node1[label = "<f0> |<f1> E|<f2> "];
        node2[label = "<f0> |<f1> B|<f2> "];
        node3[label = "<f0> |<f1> F|<f2> "];
        node4[label = "<f0> |<f1> R|<f2> "];
        node5[label = "<f0> |<f1> H|<f2> "];
        node6[label = "<f0> |<f1> Y|<f2> "];
        node7[label = "<f0> |<f1> A|<f2> "];
        node8[label = "<f0> |<f1> C|<f2> "];
        "node0":f2 -> "node4":f1;
        "node0":f0 -> "node1":f1;
        "node1":f0 -> "node2":f1;
        "node1":f2 -> "node3":f1;
        "node2":f2 -> "node8":f1;
        "node2":f0 -> "node7":f1;
        "node4":f2 -> "node6":f1;
        "node4":f0 -> "node5":f1;
    }
)

## Old Graphs

> Stopped using because they required a package, the ones above work on github

```{mermaid}
%% Example diagram
graph LR
    A[Square Rect] -- Link text --> B((Circle))
    A --> C(Round Rect)
    B --> D{Rhombus}
    C --> D
```

```{mermaid}
%% Sequence diagram code
sequenceDiagram
    Alice ->> Bob: Hello Bob, how are you?
    Bob-->>John: How about you John?
    Bob--x Alice: I am good thanks!
    Bob-x John: I am good thanks!
    Note right of John: Bob thinks a long<br/>long time, so long<br/>that the text does<br/>not fit on a row.

    Bob-->Alice: Checking with John...
    Alice->John: Yes... John, how are you?
```

```{mermaid}
%% Sequence diagram code
sequenceDiagram
    loop Daily query
        Alice->>Bob: Hello Bob, how are you?
        alt is sick
            Bob->>Alice: Not so good :(
        else is well
            Bob->>Alice: Feeling fresh like a daisy
        end

        opt Extra response
            Bob->>Alice: Thanks for asking
        end
    end
```

```{mermaid}
%% Sequence diagram code
sequenceDiagram
    participant Alice
    participant Bob
    Alice->>John: Hello John, how are you?
    loop Healthcheck
        John->>John: Fight against hypochondria
    end
    Note right of John: Rational thoughts<br/>prevail...
    John-->>Alice: Great!
    John->>Bob: How about you?
    Bob-->>John: Jolly good!
```

### Go here

[Link to demos for mermaid](https://knsv.github.io/mermaid/#working-with-the-documentation)

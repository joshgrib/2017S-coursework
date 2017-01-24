# Heading 1
## Heading 2
### Heading 3
#### Heading 4
##### Heading 5
###### Heading 6


*Italic*
**Bold**
[Link](http://www.google.com)
^Upper^ and ~lower~
~~strikethrough~~ and ==highlighting==

* Bulleted
* Lists
    * Can
        * Even
            * Nested
1. Numbers
8. Work
73. Too
>Blockquote

Code `inline` and block:
``` python
def hello:
    print "Hello"
```
Latex inline $x \geq 2$ and block:
$$
x =
\dfrac
    {-b \pm \sqrt{b^2 - 4ac}}
    {2a}
$$
- [ ] Checkboxes?
- [x] check.


| Item      |    Value | Qty  |
| :-------- | --------:| :--: |
| Computer  | 1600 USD |  8   |
| Phone     |   12 USD |  12  |
| Pipe      |    1 USD | 234  |



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

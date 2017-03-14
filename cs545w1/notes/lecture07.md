# Lecture 7

**Roadmap**

-   Log
-   Multimedia and ubiquitous interfaces
-   Training and documentation
-   Errors
-   More design
-   Reading this class: Stone et.al. Ch 18, 20-23
-   Readings next class: Stone et.al. Ch 24-27

## Log book

Kindle VS iPad - better size vs more power

## Multimedia interfaces

(Moogridge)

-   Often about affordances - providing for a use
    -   Objects that are self evident in doing what you expect them to
    -   Surfaces for walking, tools for manipulating
    -   perceivable possibilities for action, the possible paths are clear
-   Blurring the line between real and simulated
-   Sound mostly tell you wear it comes from
-   Psychology - learning is enhanced, multiple traces, active learning, availability accessibility distinction
-   Alternate "realities"
    -   Augmented reality - add stuff to your environment
    -   Virtual reality - put you in a different environment
    -   Diminished reality - block things out from your environment

### Pointing devices

-   Direct control versus indirect control

#### Success criteria

-   Speed and accuracy
-   Efficacy for task ("size of "target")
-   Learning time
-   Cost and reliability
-   Size and weight
-   (environmental issues)

#### Heuristics

-   Touch screens and trackballs are durable and easy - usage in kiosks
-   Mouse is awesome - originally controversial
-   Pens for handwriting/drawing
-   Joysticks for games and navigation
-   Indirect requires more learning
-   Fitts law: MT = a+b\*log_2(D/W+1)
    -   MT = movement time
    -   a = start/stop time of device
    -   b = device speed
    -   D = distance moved
    -   W = target size
    -   _Time for hand movement is dependent on distance moved and target size_

### Speech and auditory interfaces

_"Speech is the bicycle of user-interface design: It is great fun to use and has an important role, but it can carry only a light load."_(Schneiderman)

Success: HMIHY - "How may I help you? Press 1 for x, 2 for y, 3 for..."

Use case:

-   Lightweight interface
-   Hands occupied
-   Mobility
-   Eyes occupied
-   Design does not allow for other interfaces

### Displays

-   Portable
-   Private
-   Salient - attracts attention
-   Simultaneity - multiple users
-   Size
-   Resolution
-   Color palette
-   Luminance, contrast, glare
-   Refresh rates
-   Cost
-   Reliability
-   Intended distance from eyes
    -   "Inch screens" - smart phone, smart watch
    -   "Foot screens" - laptop, desktop display
    -   "Yard screens" - large TV, store displays

### RFIDs

-   EZPass
-   Payment
-   Security
-   Car keys

### Smart dust

Tiny computer with a battery

### "Ubiquitous Computing"

The user has a world model.
The world model queries events to and gets operations from applications.
The world model sends actuations and devices to the environment and gets sensors and telemetry.
The user sends actions to the environment and gets back observations.

## User Documentation

_"Clean documentation cannot improve messy systems."_

Many users learn interfaces from other users that previously learned them - the _keystone species_. But this is apparently changing due to workplace changes the and the professor doesn't like that because experienced users are the best resource to learn from.

Good documentation is intention/task oriented - "I want to do print a page", "How to print a page".

> Installation manual, "Getting started" notes, introductory tutorial, thourough tutorial, detailed reference manual, quick reference card, conversion manual, roadmap.

### Criteria for effective documentation

_In order of priority_
1\. Availability - does it exist?
2\. Suitability - is it focused on the intentions and tasks of the users?
3\. Accessibility - can you find what you need?
4\. Readability - is it easy to understand?

### Intentions and examples

| Intention | Paper example              | Online example                                            |
| :-------- | :------------------------- | :-------------------------------------------------------- |
| buy       | sales brochure, fact sheet | animated demonstration, price listing, feature comparison |
| learn     | tutorial                   | manual, tutorial, guide, animated demo                    |
| use       | user manual                | manual, help, context-sensitive help                      |
| sovle     | FAQ                        | help, FAQ, online community                               |

**LBGUPS** - Learn, Buy, Get, Use, Pay, Service. An acronym for roles and intentions of users.

### Issues

-   Reading documentation is not as enjoyable as doing the main thing
-   _Active user paradox_ - too busy to learn, skills remain mediocre
-   "People are incredibly creative in generating errors and misconceptions" (Schneiderman)

### User manual guidelines

-   Action oriented approach - teach by doing, examples, verbs
-   Documentation should be organized by user tasks
-   Error recognition and recovery
-   Brief, not exhaustive
-   Easy access
-   _Clean simple writing style_: Elements of Style
-   Complete lessons
-   **Test for usability**

### Online Manual and Help Guidelines

-   Easy accessibility and return
-   Specific and procedural help
-   User control of help system, customizability
-   Help based on user types
-   _Not a good fix for poor interface design_
-   **Test for usability**

### Document development process

-   Start early
-   Manager involved - first user
-   Seek professional writers and creatives to interplay with engineer
-   Review drafts early
-   Field test
-   Feedback mechanism
-   Keep updated, maintain readability
-   Roadmaps - documents for the documents

## Errors

### Slips

**Intend to do one thing but do another.**

Psychology of everday errors - some may have darker meanings(Frued), most are accounted for by simple things

-   Result from lack of attention - you can only concentrate on one thing at a time

### Capture errors

**A frequent activity takes charge instead of the intended one**.

When two different action sequences share a common beginning, with one being unfamiliar or more recent ad the other being well practiced.

> Driving to work on a Sunday

### Description errors

**The intended action has much in common with others that are possible**.

The internal description of intention is not sufficiently precise, so the correct action can happen with the wrong object from an experienced user not paying attention.

> Shirt put on inside out

### Data-driven errors

**Automatic actions are data-driven, triggered by the arrival of sensory data**.

> You hear an alert and check your phone, but it was someone elses phone.

### Associative activation errors

**Internal thoughts and associations trigger actions**

> Fruedian slips - you have a thought and convey it accidentally in speech

### Loss of activation errors

**Forgetting to do something or part of an action**.

Activation of the goals has decayed, often from having to do too many things.

### Mode errors

**Devices have more than one mode and actions appropriate for one are not for others**.

Particularly problematic when the same control has different functions and the mode is not visible.

> Vim

### Another categorization or errors

-   User slips randomly
-   User does things in the wrong order
-   User misses steps but does the correct actions in the steps they do
-   User misses initial steps, but proceeds correctly
-   User quits before end of process - completion errors
-   User follows valid path for a different action, so everything seems fine
-   Habit takes over and a similar action is done by default - capture errors
-   User does not stop at end of process - overrun errors

### Detecting and preventing errors

-   Feedback
-   Make errors harder
-   _Error correction mechanism usually starts at lowest level possible and works its way up the chain_
-   Minimize modes or make them visible
-   Confirmation before execution can help but usually doesn't affect the users actions
-   Gaining attention
-   Reducing attention demands
-   Force functions
    -   Interlocks - force sequence
    -   Lockins - prevent premature exiting
    -   Lockouts - prevent an action
-   Understand causes of errors
-   Allow reversing actions, make it harder to do irreversible actions
-   Easy discovery and correction of errors
-   Record errors and causes

### Error taxonomy

| Error type | Situation                     | Remedy                                           |
| :--------- | :---------------------------- | :----------------------------------------------- |
| mode       | editors, watches              | decrease number of modes, highlight current mode |
| state      | fatigue, pressure, repetition | Address the situation                            |
| knowledge  | conflicts, naivety            | educate, prompt, automate                        |

## More design

-   Time is the enemy, but also drives new design
-   Curse of individuality - everyone wants to leave a mark on the design
-   Durability and aesthetics get in the way of usability and udnerstanding

### Common mistakes

-   Aesthetics first
-   Designers aren't typical users
-   Clients aren't typical users
-   There's no such thing as the average person
    -   Make everything adjustable, design with future self in mind
-   Problem of focus, selective attention
-   Creeping "featurism"
-   Worshiping false images
    -   Complexity
    -   Component interaction
-   Making things invisible
-   Inconsistency
-   Unhelpful error messages and guides
-   Dangerous and unrecoverable operations

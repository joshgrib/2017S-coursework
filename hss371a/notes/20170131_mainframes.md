# Mainframes
---
**Mentioned for importance**
* IBM 360 - the compatible computer
* Mainframes are synonymous with Military applications
---
**Second generation: late 1950s**
Vacuum tube ==> Transistor

**1970s/1980s hierarchy**
1. Supercomputer
2. Mainframes - IBM
3. Mini computer - DEC
4. Micro computer (PC) - HP

Mainframes carry the significance of only really being available to big entities. There's a certain privilege to being able to use a mainframe because of the barrier of entry with the cost of ownership and operation in both money and space. **This means to use a mainframe a company needs a lot of resources, and the proper structure and use and maintain it properly.**

Vacuum tubes are pretty large and also unreliable(maybe even around 70% uptime). Transistors changed this by being both very small and reliable.

>With some forms of power (windmill, burning wood) anyone can do it on their own. With something with nuclear power we have to kinda agree to hand over power to someone else and rely on them to have access to the technology. Mainframes were similar in this way that there's no way anyone can easily have access to it.

## Two kinds of computing
### Business
* Sell hundreds of mainframes(selling a couple hundred would be a big success)
* Compatibility
* Ease of use
* Cost
* Features
* Sales team (e.g. IBM)
> **IBM side note:** the oldest computing company, automated census work for the government in the 1890s. They spent a lot of money of technology, but also on the sales team and culture. **I**ternational **B**usiness **M**achines

A **business batch job** would commonly have large I/O with simple computing. They had a decimal design (not binary) to better accomodate dollars and cents and the applications it would be used for more

### Scientific
* Sell just a few(IBM Stretch had 5 made and 4 sold, and was a success)
* Speed and application-specific design
* Bidding team looking for government contracts

A **scientific batch job** was have a small I/O with complex computations, using a binary design. As an example you could input details about atoms and try to calculate the nuclear reaction between them

**Scientific applications**
* Private research
* Government research
* Military applications
    * Cryptography (the purpose of the NSA)
    * Aerospace monitoring
    * Ballistics modeling (ENIAC created for this)
    * Nuclear weapons development

## Politics and the Military
There was an embargo against selling computers to the Soviet Union because they were so powerful and dangerous.

### "IBM and the Seven Dwarfs"

#### IBM
* Punch cards - census and social security
    * Your social security number is a number made by IBM to track how much money people make set aside money for retirements. The system is totally centralized in Virginia
* IBM 704 - Air Force (SAGE: Semi-Automatic Ground Environment)
    * The most expensive and largest computer in the history of mankind
    * We used to have to check radars, compare to flight plans, and manually track locations on big boards.
    * Designed at MIT Lincoln Lab
    * You could point a little gun (a la Duck Hunt) at the dots on the screen to get more info
    * SAGE installations were strategically placed across the country with a few in each NORAD division
    * Because of the unreliability of vacuum tubes, each installation had two systems on two separate floor. Additionally they were all connected to communicate
    * So complex that wiring had to happen manually
    * By the time SAGE was finished weaponry had advanced to make it pretty much useless, but we advanced technology A LOT - networking, critical uptime, better interface
* IBM System/360 - NSA (Problem Lightning - architecture still in use today)
    * IBM started to realize that making all one-off computers incompatible with each other meant all software had to be rewritten. **The 360 marked the beginning of making compatibility important.** This meant they had to outdate all current machines and basically replace them all, and they had **2/3 of the market share**.
        > something similar happened when Apple made the iPhone and made the iPod much less useful, cannibalizing their most successful product. IBM's jump was a way bigger deal

    * They guessed it was take 5 Billion to develop, and their revenue in 1962 was 2.5B, so it was a bet on the company

**Most of the time these things were developed for a military application in the Cold War context, and then they were adapted for commercial use.**

**IBM** in Poughkeepsie NY

#### 1. Sperry Rand
* ENIAC (1946) - Army ballistics tables creation
    * Used to be done manually by a lot of women just doing the math all day
* UNIVAC (1951)
    * Scared IBM by being synonymous with "computer" with Kleenex and tissues today
    * **In the 1950s most people got the election prediction for Eisenhower wrong, but the UNIVAC got it right**, also culturally establishing what a mainframe was
* UNIVAC 1100 series (1962) - Navy M-460, AKA AN/USQ-17, architecture still in use today

"Rand" came from Remington-Rand who made typewriters and then guns

#### 2. Burroughs
* B-5000 (1961) - still used architecture today
* D825 (1962) - Navy/NSA - Multiprocessor
* ILLIAC IV (1971) - DARPA - Massively parallel

#### 3. NCR
Cryptography

#### 4. RCA
Spectra 70 - Air Force (SAGE)

#### 5. Honeywell
Cluster bombs and missile guidance systes

#### 6. Control Data Corporation
Supercomputer company
Seymore Cray worked here and also started Cray Computers, and together these companies established the supercomputer market

#### 7. General Electric
Multics - ARPA funded project MAC (1961)
The root of all Unix systems

> **Why is all this happening in the US?**
The world wars pretty much messed up all the big powers at home except us and the Soviet Union. Here the US had a big advantage by have capitalism to support random crazy ideas from anyone and support for innovation.
Additionally IBM also had a global presence since the 1800 making money all over the place and making their brand well known.

## Mainframe culture
There needs to be a "semi-authoritarian hierarchical system" to support and allow for a mainframe. Mainframes create centralized power structures, for better or worse.
Some uses:
* ATMs - you have to keep track of all the transactions
* Reservation systems - previously done manually using paper files and phone calls to verify the reservation. Ticketing agent, tracking everything, airport attendant, and all the process are basically eliminating.
    * The SABRE system used technology made for SAGE to handle reservations and flight tracking
* Credit cards - basically asking some random entity you don't know for money and promising you'll pay it back
* Remote businesses (timesharing)

### Space race - IBM
* Mercury - 1st manned space flight
* Gemini - 2nd manned space flight
* Apollo (Command Module had > 2 million parts, mainframes were vital for tracking)

### Geopolitics
* Hydrogen bombs
    * Hiroshima and Nagasaki bombs were actually done without mainframes and maybe without punch cards too, mostly just people thinking
* Missile defense systems
* Surveillance - as early as the 1960s mainframes were being used to monitor US citizen communication automatically

## Centralized VS Decentralized technology and power
Mainframes are centralized and put a lot of power concentrated in one place, while personal computers give a lot of people access to computing power.

A similar situation is nuclear power VS solar power. Solar lets anyone make their own power easily, so it makes the whole system more robust while minimizing the power in any one place.

Something Apple (and Uber recently) are all about is providing power to the people to have more freedom.

**FOSS** - Free and Open Source Software. Free to "hack" and modify as you wish, as long as you follow the license. Founded by Richard Stallman - "Free as in freedom, not free as in beer".
* IBM made money by selling the computer, and then if you want to change it you pay IBM to make the changes
    * Starting with the 360 as the compatible computer, other companies were able to come in and make products to work with IBMs computers, instead of only IBM making them.

**IBM had a self-image mirroring their technology as deeply centralized and hierarchical, whereas Apple would see themselves as more egalitarian**

**Both money and culture play a role in technology**

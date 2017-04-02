# System Programming - The C Language

## 10 - C Language Basics


## 11 - C Language Libraries


## 12 - C Language stdio


## 13 - The Memory Hierarchy (ch 6)
### 6.1 - Storage Technology
#### 6.1.1 - Random-Access Memory (RAM)
* Two types - static (SRAM) and dyanmic(DRAM)
* *Static*
    * faster
    * more expensive
    * take up more space
    * use more power
    * used for cache memories both on and off CPU chip
* *Dyanmic*
    * used for main memory and frame buffer for graphics system
* SRAM is usually only a few megabytes, while DRAM is hundreds or thousands of megabytes

##### Static RAM (SRAM)
* Memory is **bistable memory cells**
* Each cell has a 6-transistor circuit, which can stay indefinitely in one of two states. Any other state makes the cell unstable, where it will more easily move into a stable state
* The cell will retain value indefinitely as long as it has power. Even after electrical disturbances the cell will return to the stable value

##### Dynamic RAM (DRAM)
* Memory is **a charge on a capacitor**
* Each cell has a single access transistor
* Very sensitive to disturbances - light can change voltage, and it will never recover
    * Digital cameras are basically arrays of DRAM cells
* Various sources of voltage leaks cause cells to lose voltage in 10-100 milliseconds, so they need to be refreshed frequently by reading and rewriting all cells.

##### Conventional DRAMs
* Cells are split into *d* **supercells**, which each have *w* DRAM cells, each storing *dw* bits of information. Supercells are organized in a rectangular array
* Cells in the array are accessed through **pins**
    * *w* **data pins** to input the data to write to a supercell
    * Two **address pins** to relay the row and column of the supercell
* An addition to the supercell array, there is an **internal row buffer** that can hold the data in one row of the array
* A DRAM chip will have a **memory controller** that can transfer *w* bits to and from the array of DRAM supercells

**Reading**
1. **CAS** - Column access strobe
    * Memory controller sends row address to DRAM chip
    * Chip loads that row into the row buffer
2. **RAS** - Row access strobe
    * Memory controller sends column address to DRAM chip
    * Chip selects that column from the row buffer, copies the *w* bits there, and sending them to the memory controller

##### Memory Modules
* DRAM chips are packaged in **memory modules** than plug into expansion slows on the main system board (motherboard)
* These use multiple DRAM chips to manipulate a larger amount of memory

**Ex: 64 megabyte memory module made with 8 64 megabit 8Mx8 DRAM chips**
* Each supercell stores 1 byte of memory
* A 64 bit Word is stored as 8 bytes with one on each of the DRAM chips, all at the same row and column but on different chips.

##### Non-volatile memory
* DRAMs and SRAMs lose state if they lose power
* **Nonvolatile memory** will retain value after losing power
    * Read only memory(**ROM**) is programmed during production
    * Reprogrammable ROM (**PROM**) can be programmed once
    * Erasable PROM (**EPROM**) can be bulk erased with UV or X-rays
    * Electrically erasable PROM (**EEPROM**) can use electricity
    * **Flash memory** is EEPROM with partial erase capability, that runs out after 100,000 or so erasings

##### Accessing Main Memory
* Data flows back and forth over **buses**, collections of parallel wires carrying address, data, and control signals. These are typically shared by different devices
* Communication over a bus happens through a **bus transaction**
    * A **read transaction** moves data from *main memory to CPU*
        1. CPU places memory address on bus, *I/O bridge* passes signal to memory bus
        2. Main memory senses signal on bus, reads address, fetches data from DRAM, writes data to memory bus, I/O bridge translates memory bus signal into system bus signal, sends to system bus
        3. CPU senses data on system bus, reads from bus, copies to register
    * A **write transaction** moves data from *CPU to main memory*
        1. CPU places memory address on bus, memory reads address and waits for data to arrive
        2. CPU copies data word to system bus
        3. Main memory reads data from memory bus and stores bits in DRAM

#### 6.1.2 - Disk Storage
* **Disks** are storage devices that hold "enormous amounts of data", hundreds of thousands of gigabytes. The drawback is it takes milliseconds to read, which is a hundred thousand times longer than DRAM, and millions of times longer than SRAM

##### Disk Geometry
* Disks are made of **platters**, which each have 2 **surfaces**
* Surfaces have concentric rings called **tracks**, which have **sectors** and **gaps**
* A **cylinder** is all the tracks that are the same distance from the spindle, on both surfaces of all platters
* Tracks are grouped into **recording zones**
    * Each track in a zone has the same number of sectors
    * Different zones have different amounts of sectors per track
    * We use the average number of sectors/track when computing capacity
* Capacity determined by:
    * *Recording density* - bits/inch of track
    * *Track density* - tracks/inch radial on the surfaces
    * *Areal density* - bits/inch^2 calculated using recording and track density
    * **Capacity = (bytes/sector)x(avg sectors/track)x(tracks/surface)x(surfaces/platter)x(platters/disk)**
        >512 byte sectors, 300 sector tracks avg, 20,000 track surfaces, 2 surface platters, 5 platter disk = 30.72GB

##### Disk Operation
* Disks read and write on the magnetic surface with the **read/write head** at the end of an **actuator arm**, which moves it over the radial axis to find different tracks.
* Disks have a separate head for each surface, which remain aligned and move together
* Data is read and written in sector-sized blocks, where **access time** depends on:
    * **Seek time**, the time for the head to move to the track that has the desired sector
    * **Rotational latency**, the time for the disk to rotate so the beginning of the sector is under the head
    * **Transfer time**, the time for the sector to pass under the head and be read

##### Logical Disk Blocks
To hide geometric complexity and simplify interface, the disk is split into **logical blocks** by sector
* The mapping of logical blocks to physical sectors is done by a *disk controller* that converts a block number into a (surface, track, sector) 3-tuple.

##### Connecting I/O Devices
Things like graphics cards, monitors, mice, keyboard, and disks are connected to the CPU and main memory through **I/O buses**. These are slower but can connect a wide variety of devices.

##### Accessing Disks
Reading
1. CPU initiates read by writing a command, logical block number, and destination memory address to a **port**(address) associated with the disk controller
    * After this the CPU will do other stuff, because millions of instructions could be executed during the duration of the disk read
2. Disk controller reads sector and performs a **direct memory access**(DMA) transfer to main memory
3. Disk controller notifies CPU with an interrupt on completion

#### 6.1.3 - Solid State Disks
* **Pages** hold an amount of data (typically 512-4KB today)
* **Blocks** are groups of pages (typically 32-128 today)
* *Data is read an written in units of pages*
    * A page can only be written when its whole block has been erased
    * After a block is erased all pages in it can be written without erasing again
    * Blocks wear out after ~10,000 erases

Compared to rotating disks:
* All semiconductors - no moving parts
* Faster random access time
* Use less power
* More rugged
* Potentially wear out - mitigated by *wear leveling logic*, but still happens eventually
* More expensive per-byte, but cost is dropping and cost gap is narrowing

### 6.2 - Locality
**Locality** is the amount that programs use data and instructions with address near or equal to those recently used
* **Temporal locality** is when referenced items are used again in the near future
* **Spatial locality** is when addresses close to each other are used close together in time
    >The order in which a 2D array is accessed will affect spatial locality - you could go through each smaller array in order then go to the next array(good), or go through the first item in each array, then the second, etc(bad)

Programs with good locality tend to be faster than ones with bad locality


### 6.3 - The Memory Hierarchy
Two enduring and fundamental properties of storage technology and software:
* **Storage technology**: Different technology has different access times. Faster stuff costs more and has less capacity. *The gap between CPU and main memory speed is widening.*
* **Computer programs**: Well-written programs usually have good locality

This results in a **memory hierachy** in which *things get slower, cheaper, and larger as we move from higher to lower levels.*

Example memory hierarchy:
* L0: Registers
* L1: L1 Cache - SRAM
* L2: L2 Cache - SRAM
* L3: L3 Cache - SRAM
* L4: Main memory - DRAM
* L5: Local secondary memory - local disks
* L6: Remote secondary memory - distributed file system, server

#### Caches
A **cache** is a smaller faster storage device acting as a staging area for a subset of the data in a larger slower device

#### Cache Hits
When a program needs a data object *d* from level *k+1*, it will look for *d* in the current level *k*. If it is found, we have a **cache hit**, and it reads the data directly from level *k*, which is faster than going to level *k+1*. Good locality results in more cache hits, and less misses

#### Cache Misses
If *d*(from above) is not found at level *k* we have a **cache miss**, and the cache gets the block containing *d* from level *k+1*.

If the cache at level *k* is full, we overwrite an existing block through **replacing** or **evicting**.
* The evicted block is the *victim block*, chosen by the caches **replacement/eviction policy/strategy**
    * A *random replacement policy* will choose a random block
    * A *least recently used(LRU)* replacement policy will choose the "oldest" block

##### Kinds of misses
* **Compulsory/cold miss** - cache is empty(cold) so any attempted access is a mis
* **Conflict miss** - a replacement strategy would put two data objects map to the same block at level *k*, so different data will conflict, causes an overwrite when the cache isn't necesarily full
* **Capacity miss** - cache is full and stuff has to be overwritten

##### Writing
* Multiple copies of data exist - L1, L2, L3, main memory, disk
* On a **write-hit**
    * **write-through** - write immediately to memory
    * **write-back** - defer writing to memory until replacement of line
        * Requires a **dirty-bit** that shows if the line is different from memory or not
* On a **write-miss**
    * **write-allocate** - load into cache, update line in cache
        * Good if there will be more writes to the location after
    * **no-write-allocate** - write straight to memory, do not load into cache
* Typical combinations are *write-through & no-write-allocate* or *write-back & write-allocate*

## 14 - Cache Memories
#### The Memory Mountain
>The thing on the front of the textbook

**Read throughput** (read bandwidth) is the number of bytes read from memory per second (MB/s)

A **memory mountain** shows read throughput as a function of spatial and temporal locality, creating a nice way to visualize memory system performance
* The jumping "ridges" show when there is a jump in temporal locality, switching between levels in the memory hierarchy
* The smooth "slopes" show the difference spatial locality matters as memory accesses use addresses farther away from each other

#### Rearranging loops to improve spatial locality
If you're using a 2D array iterate over the outer array, then iterate over the inner array

#### Using blocking to improve temporal locality
???

## 15 - Linking (ch 7)
* **Linking** is the process of combining pieces of code into a single file to be loaded into memory and executed
* Linking can be preformed at:
    * *Compile time*, when source code becomes machine code
    * *Load time*, when the program is loaded into memory
    * *Run time*, by application programs
* Linkers allow for *separate compilation* of files

### 7.1 Compiler Drivers
Included in most compilation systems to invoke language preprocessor, compiler, assembler, and linker on behalf of the user

### 7.2 Static Linking
* Input a collection of relocatable object files and command line arguments
* Output a fully linked executable object file that can be loaded and run
* Two tasks involved
    * **Symbol resolution** - object files define and reference symbols, resolutions links each symbol with exactly one symbol definition
    * **Relocation** - Compilers and assemblers make code with addresses starting at 0, so they get *relocated* by mapping memory addresses to symbol definitions, then replacing all references with the memory addresses

Following sections describe this stuff more. Keep in mind, object files are just collections of blocks of bytes, some have code, others have program data, others have data structures, *the linker concatenates blocks together, decides on run-time locations for the concatenated blocks, and modifies locations within the code and data blocks*

### 7.3 Object Files
Three forms:
* **Relocatable object files** contain binary code and data to be combined with other relocatable object files to create an executable
* **Executable object files** contain binary code and data to be copied directly into memory and executed
* **Shared object files** are a special type of relocatable that can be loaded into memory and linked dynamically at load or run time

Compilers and assemblers generate relocatable object files, linkers generate executable object files.

There are different file formats, the book uses the Unix *Executable and Linkable Format*(**ELF**).

### 7.4 Relocatable Object Files
### 7.5 Symbols and Symbol Tables
### 7.6 Symbol Resolution
### 7.7 Relocation
### 7.8 Executable Object Files
### 7.9 Loading Executable Object Files
### 7.10 Dynamic Linking with Shared Libraries
### 7.11 Loading and Linking Shared Libraries from Applications
### 7.12 Position-Independent Code (PIC)
### 7.13 Tools for Manipulating Object Files
### 7.14 Summary

## 16 - Exceptional Control Flow

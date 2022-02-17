# Brainfuck Game of Life

Abandon All Hope, Ye Who Clicked On This Repo. This is Conway's Game of Life, written by yours truly, entirely in Brainfuck.

### Why would you do this?

Because it's funny.

### Was it worth it?

Yes.

### Can I see the version with comments?

No.

## Deploying

### Input

Paste the code into this website: https://copy.sh/brainfuck/

In the right sidebar, under "Memory Overflow Behavior", select "wrap". Set the memory size to an arbitrary large number - you'll see that the memory is insufficient if the program gets stuck for no reason.

Inputs are formatted as follows:
```
0406
-++-+-
+-+-+-
++-+-+
-+--+-
```
Where `04` is the amount of rows (height), `06` is the amount of columns (width), `+` is an alive cell in the seed, and `-` a dead cell in the seed. Additional rows outside of the specified amount of rows will be ignored, but additional columns or uneven columns/rows will break the program.

You can also check out `sample_input.txt` to get started. These inputs are to be copied and pasted into the website's input field directly, and the linebreaks will be read as spaces - this does not matter, as you can put any single character as separator.

Another thing: The universe (playing field) is bordered by "permadead" cells, which are cells that always count as dead. This can save you some rows.

### Output

When you're satisfied with the seed, press "run" to run the simulation. You'll see patterns of \` and @ repeat in the output log. ` represents a dead cell, and @ is a live cell. Each pattern represents a generation, and is in the same width and height of the seed.

**NOTE: The program does not have a stop condition yet.** After allowing the simulation to run for as long as you desire, press the "stop" button to stop the program. (I'm working on an additional variable alongside the row and column numbers that sets the program to run x amount of times, but for now, manual stopping will do.)

When pressing "stop", it's very possible that you stop the program when it's halfway through printing the next generation. This is normal, because the interpreter can't possibly print every character at the same time, especially when it goes on forever. Simply disregard the half-baked generation.

The program also gets slower and slower the longer you allow it to run. This is probably very obvious, but in case it isn't, this is also normal as with the interpreter. I'd be getting slower too if you handed me 50 million instructions of moving a pointer back and forth and adding numbers one at a time.

## Contributing

Good luck.
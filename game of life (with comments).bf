========= IMPORTANT =========
Before you run this code，you must make
sure the interpreter *wraps* upons
memory overflow．Also make sure you have
allocated enough memory to fit all slots:
The program needs a minimum of
[( (column number plus 2) times (row number plus 2) times 9 ) plus 2]
blocks in order to fit．

The program will run its simulations indefinitely．Manual stop is required．


========= CHAPTER 1 =========
====== INITIALIZATION  ======

THE OBTAINATION OF ROW

>>>>>, ^x saved to block6
  >++++++[<-------->-]< minus 48 in b6 via b7
  [>++++++++++<-] multiply by 10 into b7; pointer at b6 rn
>>, x saved to b8
  >++++++[<-------->-]< minus 48 in b8 via b9
< go to b7
[>+<-] add b7 to b8; point at b7


THE OBTAINATION OF COL

>>>, ^y saved to b11
  >++++++[<-------->-]< use b12
  [>++++++++++<-] multiply into b12; point at b11
<, y saved to b9
  >++++++[<-------->-] use b10; point at b10
> go to b11
  [<<+>>-]<< add b11 to b9; point at b9


THE COPY OF COL

pointer is at b9
  [<<<+>>>-] move to b6
<<< go to b6
  [>+>>+<<<-] copy to b7 and b9


THE SETTING OF {DISPLAY}

pointer is at b6
< go to b5
  <++++[>++++++++<-] b5 = 32 via b4; point b4
> go to b5
  [<+++<+>>-] set b3 to 32; b4 to 96; point b5 (now 0)
<<.>> print space

now the cell should look like:
0 0 32 96 0 0 col x y
          ^


== THE REMAINDER OF FIRST ROW ==

>>>> go to b9 (y)
[ the col loop
  [>>>>>>>>>+<<<<<<<<<-] move y to next cell's y (9 blocks apart)
  >>>>>>>>>-<<<<<<<<< go back to the next cell and subtract 1 from it then come back
  < go to b8 (x)   [>>>>>>>>>+<<<<<<<<<-]
  < go to b7 (col) [>>>>>>>>>+<<<<<<<<<-]
  >>>>>>> go to c5
    <++++[>++++++++<-] see "THE SETTING OF {DISPLAY}"
    >[<+++<+>>-]
    <<.>>
  >>>> back to c9 and the loop repeats
]
!! final column
< go to b8 [>>>>>>>>>+<<<<<<<<<-]
< go to b7 [>>>>>>>>>+<<<<<<<<<-]
>>>>>>> go to c5
    <++++[>++++++++<-]
    >[<+++<+>>-]
    <<.
  <++++++++++. c2 = 10 and print \n

>>>>>> back to c8


== THE ROW LOOP ==

[
  FIRST P
    old cell
      start at b8 [>>>>>>>>>+<<<<<<<<<-]
      >>>>>>>>>-<<<<<<<<< minus one from row counter = x = c8
      < go to b7 [>>>>>>>>>+<<<<<<<<<-]
    this cell
      (This clause is the usual permadead display set function; deconstructed for debugging use)
        >>>>>> b7 to c4
            ++++[>++++++++<-] c5=32 via c4; point c4
          > c5
            [<+++<+>>-] c4=92 c3=32 via c5; point c5
          <<. print c3
      >>>> c7
    [<+>-] move to c6
  < b6
    [>+>>+<<<-] copy to c7 and c9 (c9 to be used to count down col loop)
  >>> b9
  >>>>, c4 to dump \n character
  <<<< b9
  
  [ COL LOOP
    old cell
      [>>>>>>>>>+<<<<<<<<<-] y to y
      >>>>>>>>>-<<<<<<<<<
      < go to b8 (x)   [>>>>>>>>>+<<<<<<<<<-]
      < go to b7 (col) [>>>>>>>>>+<<<<<<<<<-]
    this cell
      >>>>>> go to c4
      , get character
      >[-] c5
        >[-]++++[<++++++++++>-]<+ c5=41 via c6
        [<->-] c4 minus c5
      < c4
        [>++++++++++++++++<-] multiply by 16 into c5
        ++++[>>++++++++<<-] c6=32 via c4
      >> c6 [<<+>>-] c4 add from c6
      < c5 [<+>-] c4 add from c5 <.> print c4
      >> c7 [<+>-] move to c6
      < c6 [<<<<<+>>>>>>+<-] move to c1 and c7
      >>> c9
  ]

  FINAL P
    old cell
      < go to b8 (x)   [>>>>>>>>>+<<<<<<<<<-]
      < go to b7 (col) [>>>>>>>>>+<<<<<<<<<-]
    this cell
      >>>>>>> see "final column" from earlier
        <++++[>++++++++<-]
        >[<+++<+>>-]
        <<.
      <++++++++++. c2 \n
      >>>>>> back to c8
]


== FINAL ROW ==

start at b8 (final cell of previous row); b8 is empty and b7 has been copied
< b7 [<+>-] move to b6
< b6 [>+>>+<<<-] copy to b7 and b9
> b7 [>>>>>>>>>+<<<<<<<<<-] move to c7
>> b9 [>>>>>>>>>+<<<<<<<<<-] move to c9
first cell of final row
>>>>> c5
  <++++[>++++++++<-] see "THE SETTING OF {DISPLAY}"
  >[<+++<+>>-]
  <<.>>
>>>> c9

[ the col loop
  [>>>>>>>>>+<<<<<<<<<-] move y to next cell's y (9 blocks apart)
  >>>>>>>>>-<<<<<<<<< go back to the next cell and subtract 1 from it then come back
  < there is nothing left of b8 :pensive:
  < go to b7 (col) [>>>>>>>>>+<<<<<<<<<-]
  >>>>>>> go to c5
    <++++[>++++++++<-] see "THE SETTING OF {DISPLAY}"
    >[<+++<+>>-]
    <<.>>
  >>>> back to c9 and the loop repeats
]
!! final column
<< go to b7 [>>>>>>>>>+<<<<<<<<<-]
>>>>>>> go to c5
    <++++[>++++++++<-]
    >[<+++<+>>-]
    <<.
  <++++++++++. c2 = 10 and print \n

>>>>> back to c7

the plan: save col at the end and use it to loop all the way back to the beginning

start at b7
[>+>+<<-] move to b8 and b9
>> go to b9


========= CHAPTER 2 =========
======  THE MAIN LOOP  ======

repeat forever: this loop ALWAYS start and end on b9 of the final cell
[

  ================= FIRST ITERATION =================
  Calculate the new output of every cell，but no actual change and print

  <<<<< return to b4
  [<<<<<<<<<] if b4 isnt 0 then go back another cell; this repeats until it's all the way back to the start
  >>>>>> go to c1; this should be the absolute first block of the program
  >>> go to c4 and initiate the loop

  repeat until final cell: this loop ALWAYS start and end on c4 of the current cell (which is only empty if nonexistent)
  [
    
    THE ALMIGHTY IF CLAUSE: CHECK IF B1 IS 0 (thank you esolangs dot org)

      terminology:

      b1 = BLACK = Main
      b2 = RED = Neighbors
      b3 = ORANGE = Flip
      b4 = BLUE = Display
      b5~b9 = ABCXY = temp var blocks in the specified order
      ABC = reserved for calculation temps
      XY = reserved for IF condition temps
    
    <<< go back to b1
    <[-] clean out XY
    <[-]
      this clauses uses the X and Y BEFORE b1，while the X and Y AFTER b1 are used for all other clauses

      >>[<<+>+>-]<<[>>+<<-]+
        ^if b1==0: skip this bracket entirely
             else: move b1 to X and Y
                 ^go to X
                   ^if X==0 (which means b1==0): skip this clause
                                             else: return b1's value; X = 1
      move to Y; clause is skipped if Y==0 (which means b1==0)
      >[ if b1 != 0 (pointer is at Y)
        
        ===== PROTOCOL: THIS CELL HAS SIGNS OF LIFE =====

        INITIALIZE: OPERATION RED SQUARE (b2)
          >>[-]>>>[-]>[-]>[-] clean out b2/RED and ABC just in case
          <<<<<< go to b1
          [>>>>+>+>+<<<<<<-] move to AB (C is for restoring)
          >>>>>>[<<<<<<+>>>>>>-] restore b1

          TOP LEFT NEIGHBOR CHECK:
            <+++<+++ add 3 to B and A (now at A)
            [ the expedition
              [<<<<<<<<<+>>>>>>>>>-] move A to the previous cell's A
              > go to B
              [<<<<<<<<<+>>>>>>>>>-] move B to the previous cell's B
              <<<<<<<<<< go to previous cell's A
              - one less stop to make
            ] if A==0: we are at our destination
            < go to b4/BLUE of that cell
            [>+>>+<<<-] move to A (C is for restoring)
            >>>[<<<+>>>-] restore b4
            < go to B
            [ the home trip (where B is fuel and A is cargo instead)
              [>>>>>>>>>+<<<<<<<<<-]
              <[>>>>>>>>>+<<<<<<<<<-]
              >>>>>>>>>>-
            ] if B==0: we are home
            < go to A
            [>+<--------------------------------] B = A/32
            >-- B minus 2
            [<<<<+>>>>-] if B==1: add 1 to b2/RED
          
          TOP CENTER NEIGHBOR CHECK:
          
            pointer currently at B
              [-]>[-]<<[-] clean BCA (in that order) just in case
              <_<<< go to b1 (replace _ with period for debug print)
              [>>>>+>+>+<<<<<<-] move b1 to AB (C is for restoring)
              >>>>>>[<<<<<<+>>>>>>-] restore b1

            pointer currently at C
            <++<++ add 2 to B and A (now at A)
            [ the expedition
              [<<<<<<<<<+>>>>>>>>>-] move A to the previous cell's A
              > go to B
              [<<<<<<<<<+>>>>>>>>>-] move B to the previous cell's B
              <<<<<<<<<< go to previous cell's A
              -
            ] if A==0: we are at our destination
            < go to b4/BLUE of that cell
            [>+>>+<<<-] move to A (C is for restoring)
            >>>[<<<+>>>-] restore b4
            < go to B
            [ the home trip (where B is fuel and A is cargo instead)
              [>>>>>>>>>+<<<<<<<<<-]
              <[>>>>>>>>>+<<<<<<<<<-]
              >>>>>>>>>>-
            ] if B==0: we are home
            < go to A
            [>+<--------------------------------] B = A/32
            >-- B minus 2
            [<<<<+>>>>-] if B==1: add 1 to b2/RED

          TOP RIGHT NEIGHBOR CHECK:
          
            pointer currently at B
              [-]>[-]<<[-] clean BCA (in that order) just in case
              <<<< go to b1
              [>>>>+>+>+<<<<<<-] move to AB (C is for restoring)
              >>>>>>[<<<<<<+>>>>>>-] restore b1

            pointer currently at C
            <+<+ add 1 to B and A (now at A)
            [ the expedition
              [<<<<<<<<<+>>>>>>>>>-] move A to the previous cell's A
              > go to B
              [<<<<<<<<<+>>>>>>>>>-] move B to the previous cell's B
              <<<<<<<<<< go to previous cell's A
              -
            ] if A==0: we are at our destination
            < go to b4/BLUE of that cell
            [>+>>+<<<-] move to A (C is for restoring)
            >>>[<<<+>>>-] restore b4
            < go to B
            [ the home trip (where B is fuel and A is cargo instead)
              [>>>>>>>>>+<<<<<<<<<-]
              <[>>>>>>>>>+<<<<<<<<<-]
              >>>>>>>>>>-
            ] if B==0: we are home
            < go to A
            [>+<--------------------------------] B = A/32
            >-- B minus 2
            [<<<<+>>>>-] if B==1: add 1 to b2/RED
          

          LEFT NEIGHBOR CHECK:
            
            pointer currently at B
              [-]>[-]<<[-] clean BCA (in that order) just in case
            
            pointer currently at A
            <<<<<<<<< go to previous cell's A < then b4
            [>+>>>>>>>>>+<<<<<<<<<<-] move b4 to the two A's
            >[<+>-] restore b4
            >>>>>>>>> go back to current cell's A
            [>+<--------------------------------] B = A/32
            >-- B minus 2
            [<<<<+>>>>-] if B==1: add 1 to b2/RED

          MIRROR POINT: ALL NEIGHBOR CHECKS NOW MOVE FORWARD (you'll see)

          RIGHT NEIGHBOR CHECK:
            pointer currently at B
              [-]>[-]<<[-] clean BCA (in that order) just in case
            
            pointer currently at A
            >>>>>>>>> go to next cell's A < then c4
            [>+<<<<<<<<<+>>>>>>>>-] move c4 to the two A's
            >[<+>-] restore b4 (pointer now at c5)
            <<<<<<<<< go back to current cell's A
            [>+<--------------------------------] B = A/32
            >-- B minus 2
            [<<<<+>>>>-] if B==1: add 1 to b2/RED

          BOTTOM LEFT NEIGHBOR CHECK:
            
            pointer currently at B
              [-]>[-]<<[-] you get it
              <<<<
              [>>>>+>+>+<<<<<<-] move b1 to AB (C is for restoring)
              >>>>>>[<<<<<<+>>>>>>-] restore b1

            pointer currently at C
            <+<+ add 1 to B and A (now at A)
            [ the expedition
              [>>>>>>>>>+<<<<<<<<<-] move A to the next cell's A
              > go to B
              [>>>>>>>>>+<<<<<<<<<-] move B to the next cell's B
              >>>>>>>> go to next cell's A
              -
            ] if A==0: we are at our destination
            < go to b4/BLUE of that cell
            [>+>>+<<<-] move to A (C is for restoring)
            >>>[<<<+>>>-] restore b4
            < go to B
            [ the home trip (where B is fuel and A is cargo instead)
              [<<<<<<<<<+>>>>>>>>>-]
              <[<<<<<<<<<+>>>>>>>>>-]
              <<<<<<<<-
            ] if B==0: we are home
            < go to A
            [>+<--------------------------------] B = A/32
            >-- B minus 2
            [<<<<+>>>>-] if B==1: add 1 to b2/RED


          BOTTOM CENTER NEIGHBOR CHECK:

            pointer currently at B
              [-]>[-]<<[-] you get it
              <<<<
              [>>>>+>+>+<<<<<<-] move b1 to AB (C is for restoring)
              >>>>>>[<<<<<<+>>>>>>-] restore b1

            pointer currently at C
            <++<++ add 2 to B and A (now at A)
            [ the expedition
              [>>>>>>>>>+<<<<<<<<<-] move A to the next cell's A
              > go to B
              [>>>>>>>>>+<<<<<<<<<-] move B to the next cell's B
              >>>>>>>> go to next cell's A
              -
            ] if A==0: we are at our destination
            < go to b4/BLUE of that cell
            [>+>>+<<<-] move to A (C is for restoring)
            >>>[<<<+>>>-] restore b4
            < go to B
            [ the home trip (where B is fuel and A is cargo instead)
              [<<<<<<<<<+>>>>>>>>>-]
              <[<<<<<<<<<+>>>>>>>>>-]
              <<<<<<<<-
            ] if B==0: we are home
            < go to A
            [>+<--------------------------------] B = A/32
            >-- B minus 2
            [<<<<+>>>>-] if B==1: add 1 to b2/RED

          BOTTOM RIGHT NEIGHBOR CHECK:

            pointer currently at B
              [-]>[-]<<[-] you get it
              <<<<
              [>>>>+>+>+<<<<<<-] move b1 to AB (C is for restoring)
              >>>>>>[<<<<<<+>>>>>>-] restore b1

            pointer currently at C
            <+++<+++ add 3 to B and A (now at A)
            [ the expedition
              [>>>>>>>>>+<<<<<<<<<-] move A to the next cell's A
              > go to B
              [>>>>>>>>>+<<<<<<<<<-] move B to the next cell's B
              >>>>>>>> go to next cell's A
              -
            ] if A==0: we are at our destination
            < go to b4/BLUE of that cell
            [>+>>+<<<-] move to A (C is for restoring)
            >>>[<<<+>>>-] restore b4
            < go to B
            [ the home trip (where B is fuel and A is cargo instead)
              [<<<<<<<<<+>>>>>>>>>-]
              <[<<<<<<<<<+>>>>>>>>>-]
              <<<<<<<<-
            ] if B==0: we are home
            < go to A
            [>+<--------------------------------] B = A/32
            >-- B minus 2
            [<<<<+>>>>-] if B==1: add 1 to b2/RED

          go to b1
            [-]>[-]<<[-] you get it
            <<<<

          COMPILE FINDINGS:
            >>>>++++++++ A = 8
            <<< go back to b2
            [>>>-<<<-] A = A minus b2
            >>> go to A
            [<<<+>>>-] move A to b2
            <<< pointer back to b2

          b2/RED now stores the amount of live neighbors (and also where the pointer currently is)

        INITIALIZE: OPERATION FLIP SQUARE (b3)
          >[-]++>>[-]++>[-]+++>[-]++++ sanitize all blocks and set FLIP=2; A=2; B=3; C=4
          <<<<< back to b2
          [ loop until b2==0
            - b2 minus 1
            >>>- A minus 1
            >>>[-]>[-] sanitize XY
            <<<<[>>>+>+<<<<-]>>>[<<<+>>>-]+>[<->[-]]<[ IF A==0: (pointer is at X)
              <<<<<-- go back to b3/FLIP and subtract 2 (now at 0)
              >>>>>- go back to X and exit loop
            ]
            <<- B minus 1
            >>[-]>[-] sanitize XY
            <<<[>>+>+<<<-]>>[<<+>>-]+>[<->[-]]<[ IF B==0: (pointer is at X)
              <<<<<+ go back to b3/FLIP and add 1 (now at 1)
              >>>>>- exit loop
            ]
            <- C minus 1
            >[-]>[-] sanitize XY
            <<[>+>+<<-]>[<+>-]+>[<->[-]]<[ IF C==0: (pointer is at X)
              <<<<<+ go back to b3/FLIP and add 1 (now at 2)
              >>>>>- go back to X and subtract it
            ]
            <<<<<< go back to b2: exit loop if 0
          ]
          >>>[-]>[-]>[-] sanitize ABC
          <<<<< back to b2
        
          see THE SECOND ITERATION for display

      temp0<<<- go back to X and subtract it so the next clause wont activate
      >[-] clear Y
      ]
      move to X: it should still be 1 if the above clause was not triggered
      <[ if b1 == 0 (at X) -] do nothing and exit
    
    pointer is now at X of the previous cell
    >>>>>>>>>X of current cell>>>>>c4 aka b4 of next cell
    do it all over again baby!!!
  ]

  <<<< back to b9 of the final cell

  ================= SECOND ITERATION =================
  Update all the b4/BLUE blocks and print them simultaneously

  <<<<< return to b4
  [<<<<<<<<<] if b4 isnt 0 then go back another cell; this repeats until it's all the way back to the start
  >>>>>> go to c1; this should be the absolute first block of the program
  >>> go to c4 and initiate the loop

  repeat until final cell:
  [
    see FIRST ITERATION for how the ALMIGHTY IF CLAUSE works
    <<<<[-]<[-]
    >>[<<+>+>-]<<[>>+<<-]+
    >[ if b1 != 0 (pointer at a9/Y)
      INITIALIZE: OPERATION BLUE SQUARE (b4)
        >>> go to b3
        >>>>>[-]>[-] sanitize XY
        <<<<<<[>>>>>+>+<<<<<<-]>>>>>[<<<<<+>>>>>-]+>[ IF FLIP!=0: (pointer is at b9/Y)
          <<<<<[-] delete b4/BLUE
          < back to FLIP
          [>++++++++++++++++++++++++++++++++<-] b4 = b3*32
          >b4++++++++++++++++++++++++++++++++ add 32
          >>>>X->[-] clear XY
        ]<[ IF A==0: change nothing -] pointer now at X
        whichever clause，DISPLAY should now have been updated．print that and reset a8a9
        <<<<.
        <<<<<->[-]
    ]
    <[ if b1 == 0 (pointer at a8/X)

      >>>>. print b3 (there's a premade 32 there)
      <. print b2 (print the premade 10 if it exists，else do nothing)

    <<<-] go back to X and exit the loop

    >>>>>>>>>>>>>> go to c4 and start over
  ]
  <<<< back to b9 of the final cell
]
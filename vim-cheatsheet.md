# Visual mode

shift-v: visual line mode
ctrl-v: visual block mode

# General keystrokes

## Undo and redo

u: undo
ctrl-r: redo

## insert

i: insert content before the current character
a: insert content after the current character
A: insert content after All

o: open a new line
O: open a new line abOve

# Motion

h: left
j: down
k: up
l: right

w: next word
b: previous word
0: beginning of the line
\$: end of the line
%: matching bracket

<count>G: move to line <count>
G: move to the last line
1g or GG: move to the first line

# Operators

d: delete
c: change
y: yank (copy)

# Text operators

diw: Delete Inside Word
ciw: Change Inside Word
dip: Delete Inside Paragraph

# Buffers

:buffers: list all buffers
:bn move to the next buffer
:bp move to the previous buffer
:bf move to the first buffer
:bl move to the last buffer

# Windows

CTRL-W s: split screen horizontally
CTRL-W v: split screen vertically
CTRL-W n: split screen horizontally on new file

## moves

CTRL-W h/j/k/l move left/down/up/right

## resizes

CTRL-W =: resize all windows to the same size
CTRL-W -: decrease window's height
CTRL-W +: increase window's height
CTRL-W >: increase window's width
CTRL-W <: decrease window's width

## cursors

CTRL-o: move cursor to previous position
CTRL-i: move cursor to previous position

## changes list

g;: jump to the next INSERT position
g,: jump to the previous INSERT position

# Repeating keystrokes

.: repeat the last change
@:: repeat the last executed command

## Complex repeat: macros

q<lower-case letter>: start a macro, records everything
q: stop the macro
@<lowercase letter>: execute the macro

# command line window

q:: open the command line window
q/ and q?: open search history

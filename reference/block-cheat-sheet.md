# Block cheat sheet

Blocks are grouped by the colour of their palette button on the left of the
Scratch editor. Find the colour first, then find the block in that colour's
table below.

## Events (yellow)

| Block | What it means |
|---|---|
| `when green flag clicked` | Starts this script when you click the green flag. |
| `when [key] key pressed` | Starts this script the moment you press that key. |
| `when I receive [message]` | Starts this script when any sprite shouts that message. |
| `broadcast [message]` | Shouts a message to every sprite and the stage at once. |

## Control (amber)

| Block | What it means |
|---|---|
| `forever` | Repeats the blocks inside it for as long as the game runs. |
| `repeat until <>` | Repeats the blocks inside it until the condition becomes true. |
| `if <> then` | Runs the blocks inside it only when the condition is true. |
| `wait () seconds` | Pauses this script for that many seconds. |
| `create clone of [myself]` | Makes a brand-new copy of this sprite. |
| `when I start as a clone` | Starts this script for a clone the moment it's created. |
| `delete this clone` | Removes this clone for good — a clone script must always end with one. |
| `stop [all]` | Stops every script in the whole project. |

## Motion (blue)

| Block | What it means |
|---|---|
| `go to x: () y: ()` | Jumps straight to that exact spot on the stage. |
| `go to [sprite]` | Jumps straight to wherever another sprite currently is. |
| `change x by ()` | Moves sideways by that many steps (right if positive, left if negative). |
| `change y by ()` | Moves up/down by that many steps (up if positive, down if negative). |
| `set x to ()` | Jumps sideways to that exact x position, ignoring where it was. |
| `set y to ()` | Jumps up/down to that exact y position, ignoring where it was. |
| `x position` | Reports how far left/right this sprite currently is. |
| `y position` | Reports how far up/down this sprite currently is. |

## Looks (purple)

| Block | What it means |
|---|---|
| `show` | Makes this sprite visible on the stage. |
| `hide` | Makes this sprite invisible on the stage. |
| `switch backdrop to [backdrop]` | Changes the stage's background to the one you pick. |

## Sound (pink)

| Block | What it means |
|---|---|
| `start sound [sound]` | Plays that sound once and keeps running the rest of the script. |

## Sensing (pale blue)

| Block | What it means |
|---|---|
| `key [key] pressed?` | True while that key is held down, false otherwise. |
| `touching [sprite]?` | True while this sprite is overlapping that sprite, false otherwise. |

## Operators (green)

| Block | What it means |
|---|---|
| `pick random () to ()` | Picks a random number between the two numbers, every time it runs. |
| `() > ()` | True if the first number is bigger than the second. |
| `() < ()` | True if the first number is smaller than the second. |
| `() = ()` | True if the two values are equal. |
| `() * ()` | Multiplies the two numbers together. |

## Variables (orange)

| Block | What it means |
|---|---|
| `set [variable] to ()` | Sets the variable to exactly that value, wiping whatever it was before. |
| `change [variable] by ()` | Adds that amount to the variable's current value (use a negative number to subtract). |
| `(score)`, `(lives)`, `(level)`, `(spawn gap)` — the small orange ovals | Each variable you make gets one of these, with its name on it. It stands for whatever that variable's number is right now. Blocks shaped like this are called **reporter blocks**: you drop one *into a slot* on another block (like `() > ()` or a `wait` block's number slot), instead of snapping it underneath one. Motion's `x position` and `y position` are reporter blocks too — same shape, same idea, different colour. |

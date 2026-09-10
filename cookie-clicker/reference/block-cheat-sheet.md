# Block cheat sheet

Blocks are grouped by the colour of their palette button on the left of the
Scratch editor. Find the colour first, then find the block in that colour's
table below.

## Events (yellow)

| Block | What it means |
|---|---|
| `when green flag clicked` | Starts this script when you click the green flag. |
| `when this sprite clicked` | Starts this script when you click this sprite. |
| `broadcast [message]` | Shouts a message to every sprite and the stage at once. |
| `when I receive [message]` | Starts this script when any sprite shouts that message. |

## Control (amber)

| Block | What it means |
|---|---|
| `wait () seconds` | Pauses this script for that many seconds. |
| `wait until <>` | Pauses this script until the condition becomes true, then carries on. |
| `forever` | Repeats the blocks inside it for as long as the game runs. |
| `if <> then` | Runs the blocks inside it only when the condition is true. |
| `create clone of [myself]` | Makes a brand-new copy of this sprite. |
| `when I start as a clone` | Starts this script for a clone the moment it's created. |
| `delete this clone` | Removes this clone for good — a clone script must always end with one. |

## Motion (blue)

| Block | What it means |
|---|---|
| `go to x: () y: ()` | Jumps straight to that exact spot on the stage. |

## Looks (purple)

| Block | What it means |
|---|---|
| `hide` | Makes this sprite invisible on the stage. |
| `show` | Makes this sprite visible on the stage. |
| `set size to () %` | Sets the sprite's size to exactly that percentage — it does not add to whatever size it already was, so running it twice in a row does not make the sprite bigger twice. |
| `say [] for () seconds` | Shows a speech bubble with that text for that many seconds, then carries on. |
| `switch backdrop to [backdrop]` | Changes the stage's background to the one you pick. |

## Sound (pink)

| Block | What it means |
|---|---|
| `start sound [sound]` | Plays that sound once and keeps running the rest of the script straight away. |

## Sensing (pale blue)

| Block | What it means |
|---|---|
| `touching [mouse-pointer]?` | True while the mouse pointer is over this sprite, false otherwise. Only needed if a golden cookie turns out not to respond to being clicked. |
| `mouse down?` | True while the mouse button is held down, false otherwise. Only needed if a golden cookie turns out not to respond to being clicked. |

## Operators (green)

| Block | What it means |
|---|---|
| `() < ()` | True if the first number is smaller than the second. |
| `() > ()` | True if the first number is bigger than the second. |
| `() - ()` | Subtracts the second number from the first. |
| `() * ()` | Multiplies the two numbers together. |
| `not <>` | Flips true to false and false to true. |
| `and <>` | True only when both conditions inside it are true. Only needed if a golden cookie turns out not to respond to being clicked. |
| `pick random () to ()` | Picks a random number between the two numbers, every time it runs. |

## Variables (orange)

| Block | What it means |
|---|---|
| `set [variable] to ()` | Sets the variable to exactly that value, wiping whatever it was before. |
| `change [variable] by ()` | Adds that amount to the variable's current value (use a negative number to subtract). |
| `(cookies)`, `(per second)`, `(grandma cost)`, `(baker cost)`, `(bonus)` — the small orange ovals | Each variable you make gets one of these, with its name on it. It stands for whatever that variable's number is right now. Blocks shaped like this are called **reporter blocks**: you drop one *into a slot* on another block (like `() < ()` or a `wait` block's number slot), instead of snapping it underneath one. |

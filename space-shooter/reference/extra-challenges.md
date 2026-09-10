# Extra challenges

Finished a milestone early and waiting for everyone else to catch up? Pick a
challenge below.

**Every challenge here is optional.** None of them are needed to finish the
course or to keep up next week — the game you build from the step cards is
the whole game. These are extra: a chance to go *wider* with what you already
know, not a race to get ahead. Do one, do all of them, or do none — it's your
game.

Nobody is telling you exactly which blocks to snap together. Each challenge
gives you a job to do and a hint about which blocks might help — the rest is
for you to work out. That's the fun part.

**Difficulty:**
- ★ — quick, you'll probably have it in a couple of minutes
- ★★ — takes a bit of thinking
- ★★★ — a proper challenge, give yourself some time

## Lesson 1 — Fly the ship

### ★★ Keep the ship on screen

Stop `Ship` from sliding right up to (or past) the edge of the stage, so it
always stays fully in view.

**Hint:** Inside the same *amber* Control `forever` loop that holds your
four movement `if`s, add four more `if` checks — one per edge. Use *blue*
Motion's `x position` and `y position` blocks together with *green*
Operators' `>` and `<` blocks to test where `Ship` is, and Motion's
`set x to ()` and `set y to ()` blocks to pull it back. One check looks
like this: `if <(x position) > (220)> then set x to (220)` — you need
three more like it, for the left, top and bottom edges.

### ★ Add a thruster sound

Play an engine-type sound while `Ship` is moving.

**Hint:** On the Sounds tab, open the sound library and search for
something like "thruster" or "engine" — the exact name in your library
might be different, so check the list and pick whichever sounds right. Then
drop a *pink* Sound block inside one of your `if key pressed` checks.

Watch out for this one: your `if` lives inside a `forever` loop, which comes
round about thirty times a second, and `start sound` *restarts* the sound
every single time. Held down, that isn't an engine — it's a buzz. Sound's
`play sound () until done` block waits for the sound to finish before the
loop moves on, which sounds much more like a real thruster. Try both and
listen to the difference — then notice what `play sound () until done` does
to how quickly your ship reacts to the key, and decide which trade you
prefer. There isn't a single right answer here.

### ★ Give the ship a second costume

Make `Ship` look different some of the time — for example, a costume that
shows while it's turning.

**Hint:** On the Costumes tab, duplicate `Ship`'s costume and change the
copy (recolour it, or use the flip tool). Then use a *purple* Looks
`switch costume to ()` or `next costume` block inside your movement script
to change how `Ship` looks when a key is pressed.

## Lesson 2 — Shoot and survive

### ★★ Fix the fire rate

Make `Laser` fire at a steady rate instead of the rattle you get from
holding space down.

**Hint:** Swap out the *yellow* Events `when space key pressed` hat
block — it's why holding space rattles instead of firing steadily. Rebuild
the firing script using the same kind of pattern `Ship`'s movement script
already uses: Control's `forever` and `if`, with *pale blue* Sensing's
`key space pressed?` block as the condition. Your existing
`create clone of myself` block still does the actual firing — a Control
`wait () seconds` block is what slows the rate back down. Where you put it
is up to you.

**One thing to remember:** next week's step cards assume `Laser` still has
its `when space key pressed` block, because most people's will. If you do
this challenge, yours won't. That's fine — Lesson 3's cards have a note for
you at two places (just above Milestone 2's step 27, and just above
Milestone 4's step 43) telling you what to do instead. Look for it rather
than following the step as written.

### ★ Laser colour and speed

Change how `Laser` looks and how fast it flies.

**Hint:** For colour, open the Costumes tab and recolour `Laser` with the
paint bucket tool. For speed, open `Laser`'s `when I start as a clone`
script and change the number in the `change y by ()` block — a bigger
number makes it fly faster.

### ★ Asteroid spawn rate and fall speed

Change how often asteroids appear, and how fast they fall once they do.

**Hint:** On `Asteroid`'s `when green flag clicked` script, change the two
numbers in the `pick random () to ()` block inside `wait () seconds` to
change how often a new one spawns. On the `when I start as a clone` script,
change the number in `change y by ()` to change fall speed — keep it
negative, or asteroids will fall upward.

### ★★ Random asteroid costume

Give `Asteroid` a second look, and have new clones pick one of the two at
random.

**Hint:** On the Costumes tab, duplicate `Asteroid`'s costume and change the
copy — resize or recolour it so it's clearly different. Then look at
Looks' `switch costume to ()` block and Operators' `pick random () to ()`
block — between the two of them, they can make a fresh clone choose one of
the two costumes when it's created.

## Lesson 3 — Enemies and polish

### ★★★ Title screen

Show a "press space to start" screen before the action begins, and hold the
game there until space is pressed.

**Hint:** Make a new backdrop (or duplicate an existing one) and paint your
title text on it. On the Stage, switch to that backdrop on green flag, then
use a Control `wait until <>` block with Sensing's `key space pressed?`
block inside it to pause everything there. Once it moves past the
`wait until`, use an Events `broadcast` block with a new message —
something like `start game` — for `Ship`, `Asteroid` and `Enemy` to listen
for with `when I receive` before they start moving or spawning.

### ★★★ Boss asteroid

Give `Asteroid` a version that needs three hits from `Laser` to destroy,
instead of one.

**Hint:** Each clone needs to keep count of its own hits, so head to the
*orange* Variables category and make a new variable — set it "for this
sprite only" on `Asteroid` (not "for all sprites" like `score`), so every
clone gets its own copy instead of sharing one number. Where the script
currently checks `touching [Laser v]?`, add `change [your variable v] by
(1)` instead of deleting the clone straight away, and only run
`delete this clone` once that variable reaches `3` (an Operators `=` or `>`
block can check that). Make it look tougher too — a bigger size or a
different costume helps sell it as a boss.

### ★★ High-score variable

Remember the best score anyone's gotten, even after the game restarts.

**Hint:** You'll need a new variable — call it something like `high score`,
"for all sprites" (Variables' "Make a Variable" button). An Operators `>`
block will let you compare it to `score`, and `set [high score v] to
(score)` is how you'd update it. Think carefully about where you reset
variables to `0` on green flag — `high score` needs different treatment
from `score` and `lives` if it's going to survive from one play to the
next.

### ★★ Ship explosion animation

Make something dramatic happen to `Ship` the moment `lives` hits `0`,
before the game-over screen appears.

**Hint:** Just before the `broadcast [game over v]` block runs, add a few
Looks blocks to `Ship`'s script — `change size by ()`, or a couple of
`switch costume to ()` blocks in a row with short `wait () seconds` blocks
between them, so it plays out like a little animation. A Sound
`start sound` block helps too — search the sound library for something like
"explosion" or "zap" and check the exact name once you're browsing.

### ★★★ Power-ups

Add something that falls from the top and gives `Ship` a bonus — an extra
life, or a speed boost — when it touches it.

**Hint:** Add a new sprite (search the sprite library for something like a
star or a heart, and check the exact name once you're browsing it — it
might be called something else). Build it the same way you built
`Asteroid`: a spawner script that makes clones on a timer, and a clone
life-story that falls down the screen and deletes itself at the bottom.
Inside the clone's `repeat until`, add an `if <touching [Ship v]?>` check,
and inside that put whatever bonus you choose — for example
`change [lives v] by (1)` — before `delete this clone`.

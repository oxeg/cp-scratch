# Lesson 3 - Enemies and polish: instructor plan

**New idea this week:** broadcasts.
**Milestones (everyone must reach all four):** an enemy ship, the enemy
shoots back, getting harder, sound and a proper game over. This is the last
lesson of the course - Milestone 4 delivers the finished game.
**Stretch goals:** a title screen, a boss asteroid that takes three hits, a
high-score variable, a ship explosion animation, power-ups.

## Timing

| Time | Activity |
|---|---|
| 0:00-0:10 | Recap, demo the finished game, open the repair window |
| 0:10-0:20 | Repair window - anyone still finishing Lesson 2 milestone 4 |
| 0:20-0:40 | Enemy ship + `broadcast enemy fire` |
| 0:40-0:50 | Difficulty ramp |
| 0:50-1:05 | Sound + game-over screen |
| 1:05-1:20 | Build time - make it yours / extra challenges |
| 1:20-1:30 | Showcase, save, celebrate |

## What to demo

- Quick recap: click the green flag on last week's project. Fly around,
  shoot a few asteroids, take a hit, and point out that it still stops dead
  rather than showing a proper game over - "we said we'd fix that."
- Today's milestone: demo the finished game (yours, or a pre-built copy) -
  an enemy ship gliding across the top and firing back, the game getting
  harder the longer you survive, sound effects, and a real GAME OVER screen
  that resets cleanly when you play again. This is what they're building
  today, and it's the last new content of the course.

## Blocks introduced today

- *Yellow* Events: `broadcast [message]`, `when I receive [message]`
- *Pink* Sound: `start sound [sound]`
- *Purple* Looks: `switch backdrop to [backdrop]`
- *Green* Operators: `() * ()`

Everything else today - `forever`, `if <> then`, `repeat until <>`,
`create clone of [myself]`, `when I start as a clone`, `delete this clone`,
`touching [sprite]?`, `pick random () to ()`, making and setting variables -
is reused from Lesson 2. Say so out loud: today is mostly the same tools,
aimed at new problems, plus one genuinely new idea.

## Repair window (0:10-0:20)

Some kids will arrive at Milestone 3 (score) but not Milestone 4 (lives and
game over) from Lesson 2. Check your notes from last week's instructor plan
for who that was, and go straight to them rather than doing a blanket recap.

Priority order for the ten minutes, cheapest fix first:

1. If `score` isn't going up when a laser hits an asteroid - almost always
   the `score` variable was made "for this sprite only" instead of "for all
   sprites". Delete and remake it.
2. If Milestone 4 (`lives` and the `if <(lives) = (0)> then stop [all v]`
   block) is missing entirely - get it in place, even roughly. It doesn't
   need to be polished; Lesson 3's Milestone 4 is going to find and change
   that exact block in an hour anyway, so it just needs to exist.
3. Anyone still stuck earlier than that (laser or asteroid clones not
   working) needs the volunteer at their elbow, not a race to catch up -
   let them keep going during the build-time slot at the end instead of
   rushing them now.

Don't let repair work eat into 0:20 - stop at the ten-minute mark even if a
kid isn't finished, and flag them for extra attention during build time.

## Design decision: the enemy is a single sprite, not clones

**Read this before teaching, and expect a volunteer to try to "fix" it -
that's the whole reason it needs its own section.** Every other moving
enemy in this course (`Laser`, `Asteroid`) is built from clones, so it feels
natural to build `Enemy` the same way. Don't. It's a single sprite that
glides across the top and jumps back to the left edge when it's shot,
instead of a spawner making a fresh clone each time.

The reason is not simplicity - it's a bug that a beginner cannot debug.
`EnemyLaser`'s clone script uses `go to [Enemy v]` to position the bolt when
it's fired. `go to [sprite]` always jumps to the position of the **original**
sprite, never to a clone's position - that's just how the block works, clone
or no clone. If `Enemy` were spawning clones of itself, `go to [Enemy v]`
would still only ever jump to wherever the one original, un-cloned `Enemy`
happens to be - not to whichever clone actually fired. Bolts would appear to
fire from the wrong enemy, or from an enemy that already left the screen. To
a 12-year-old, that looks like the whole enemy system is broken, and there is
no beginner-reachable fix for it - the real fix (tracking each clone's
position separately) is well beyond this course.

One enemy, respawning in place when destroyed, sidesteps the bug entirely
and looks just as good on screen. If a kid or a volunteer suggests "let's
make lots of enemies with clones like the asteroids" - and someone will -
explain the `go to [sprite]` behaviour above, don't just say "no."

## Teaching broadcast

Introduce it with one sentence, and use the same words every time it comes
up for the rest of the day:

> A broadcast is **shouting something across the whole project** - one
> sprite shouts a message, and any sprite (or the Stage) that's listening
> for it can react, no matter where it is or what it's doing.

Contrast it explicitly with clones, which they already know: a clone is
*one sprite making a copy of itself*. A broadcast is *one sprite talking to
everyone else*. Today uses broadcast twice - `Enemy` shouting `enemy fire`
so `EnemyLaser` knows when to fire, and `Ship` shouting `game over` so the
Stage knows when to end the game.

## Milestone scripts (verbatim from the design spec)

### Milestone 1 - An enemy ship (0:20-0:40, first half)

```
when green flag clicked
show
forever
  go to x: (-230) y: (pick random (90) to (150))
  repeat until <(x position) > (230)>
    change x by (4)
    if <touching [Laser v]?> then
      change [score v] by (5)
      start sound [pop v]
      go to x: (-230) y: (pick random (90) to (150))
```

### Milestone 2 - The enemy shoots back (0:20-0:40, second half)

On `Enemy`:

```
when green flag clicked
forever
  wait (pick random (1) to (2.5)) seconds
  broadcast [enemy fire v]
```

On `EnemyLaser` (duplicate the `Laser` sprite, recolour it):

```
when green flag clicked
hide

when I receive [enemy fire v]
create clone of [myself v]

when I start as a clone
go to [Enemy v]
show
repeat until <(y position) < (-175)>
  change y by (-8)
  if <touching [Ship v]?> then
    change [lives v] by (-1)
    delete this clone
delete this clone
```

### Milestone 3 - Getting harder (0:40-0:50)

On `Ship`'s green-flag script, add `set [level v] to (1)` and
`set [spawn gap v] to (1.5)`. Then add a separate watcher script:

```
when green flag clicked
forever
  if <(score) > ((level) * (10))> then
    change [level v] by (1)
    change [spawn gap v] by (-0.2)
    if <(spawn gap) < (0.4)> then
      set [spawn gap v] to (0.4)
```

Then change the asteroid spawner's `wait () seconds` block to:

```
  wait (pick random (0.3) to (spawn gap)) seconds
```

### Milestone 4 - Sound and a proper game over (0:50-1:05)

Sound is cheap and high-joy - add `start sound` when the laser fires, when
an asteroid is destroyed, and when the ship is hit.

Game-over screen: duplicate the space backdrop, paint `GAME OVER` on it,
name it `game-over`. On `Ship`, find last week's

```
  if <(lives) = (0)> then
    stop [all v]
```

and change it - don't add a second block next to it - to:

```
  if <(lives) = (0)> then
    broadcast [game over v]
```

On the Stage:

```
when I receive [game over v]
switch backdrop to [game-over v]
stop [all v]
```

**Order matters inside that script**: the backdrop has to switch *before*
`stop [all v]` runs, because `stop [all v]` halts every script in the
project immediately, including the one doing the switching. Swap the two
blocks and the screen will freeze on whatever backdrop was showing when the
game ended, not on GAME OVER.

Also add a green-flag script to the Stage:

```
when green flag clicked
switch backdrop to [your space backdrop v]
```

(`[your space backdrop v]` here means whichever space backdrop the kid
picked in Lesson 1 - nobody renamed it, so its label in the dropdown will be
whatever the library happened to call it. There are only two backdrops on
the Stage by this point, so "pick the one that isn't game-over" works
regardless of its exact name.)

## Discussion prompts

Both of these are worth putting to the group rather than just explaining -
let them guess first.

- **The 0.4 floor.** *"What happens if `spawn gap` keeps going down every
  time you level up, and nothing stops it?"* Walk it forward with them:
  eventually `pick random (0.3) to (spawn gap)` would be asked for a random
  number between 0.3 and something smaller than 0.3, which breaks the
  block, or at best asteroids would spawn faster than a human can react to.
  The `if <(spawn gap) < (0.4)> then set [spawn gap v] to (0.4)` line is
  what stops the ramp before it gets there - it's a floor, not a bug fix.
- **The second play-through bug.** Once a kid has a working game-over
  screen, ask them to click the green flag again *without* explaining what
  will happen. If the Stage's green-flag script (`switch backdrop to
  [your space backdrop v]`) is missing, the second play starts sitting on
  the GAME OVER backdrop even though the game is actually running - a
  genuinely confusing bug to hit blind. Let them notice it, then connect it
  back to the same lesson as Lesson 1's `Ship` starting position: **every**
  green flag click should reset everything the game depends on, backdrops
  included.

## Sticking points and fixes

- **A volunteer tries to turn `Enemy` into clones.** See the single-sprite
  section above - explain the `go to [sprite]` behaviour, don't just
  overrule them.
- **`broadcast [enemy fire v]` dropdown is empty or shows the wrong
  message.** The message has to be *created* once (via "New message" on
  whichever sprite builds the `broadcast` block first) before it will show
  up in `when I receive`'s dropdown on the other sprite - it's shared across
  the whole project once created, so this only needs doing once.
- **`EnemyLaser`'s bolts fire from the middle of the screen, not from the
  enemy.** The duplicated `Laser` sprite's `go to [Ship v]` block wasn't
  changed to `go to [Enemy v]`.
- **Nothing happens when `spawn gap` should be dropping.** The watcher
  script needs its own `when green flag clicked` hat block, separate from
  `Ship`'s movement script - check it wasn't accidentally nested inside the
  existing `forever` loop instead of being its own script.
- **The floor doesn't hold - `spawn gap` keeps dropping below 0.4.** The
  inner `if <(spawn gap) < (0.4)> then` has to be *inside* the outer `if`,
  underneath `change [spawn gap v] by (-0.2)`, not a separate script.
- **The game stops but the screen doesn't change**, or the screen changes
  but a half-second later than it should. Check block order on the Stage's
  `when I receive [game over v]` script - `switch backdrop to [game-over v]`
  has to be above `stop [all v]`, not below it.
- **The GAME OVER screen is still showing the next time someone clicks the
  green flag.** Missing green-flag `switch backdrop to
  [your space backdrop v]` script on the Stage - see the discussion prompt
  above.
- **A sound doesn't play, or the dropdown shows "recording1" or nothing at
  all.** The sprite needs a sound added on its Sounds tab before the
  `start sound` block has anything to choose - if a kid built the block
  first, send them to the Sounds tab, add a sound, then come back and pick
  it from the dropdown.

## Stretch goals

Purely cosmetic and tuning - optional, and never something a kid needs to
reach the finished game:

- A title screen with "press space to start".
- A boss asteroid that takes three hits to destroy instead of one.
- A high-score variable that remembers the best score across plays.
- A ship explosion animation when lives hits 0.
- Power-ups.

## "Make it yours" prompts to read out

- "How fast should the enemy move, and how often should it fire? Try
  different numbers in `Enemy`'s two scripts."
- "What sounds fit your game? Try different sounds from the sound library
  for the laser, the pop, and the crash."
- "What should your GAME OVER screen look like? Go wild in the paint
  editor."
- Once those are done, point kids at `reference/extra-challenges.md` for
  more ideas to fill the rest of the build-time slot.

## Wrap-up (1:20-1:30)

This is the last session, so let it feel like one: have kids play each
other's games rather than just their own, and make sure everyone actually
clicks **File → Save** (or the equivalent in their editor) before they log
off - a finished game that isn't saved doesn't survive the week.

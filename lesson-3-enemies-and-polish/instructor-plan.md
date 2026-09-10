# Lesson 3 - Enemies and polish: instructor plan

**New idea this week:** broadcasts.
**Floor (everyone must reach):** Milestones 1 and 2 - an enemy ship that
glides across the top of the stage and shoots back. That is visibly a better
game than the one they took home from Lesson 2, and it is what today is for.
**Further targets (for anyone who gets there):** Milestone 3 (the difficulty
ramp) and Milestone 4 (a proper game-over screen, then sound). They are
independent of each other. Kids reach them inside the same build slot; most
kids will not, and that is the expected outcome, not a failure.
**Stretch goals (cosmetic/tuning, optional):** a title screen, a boss
asteroid that takes three hits, a high-score variable, a ship explosion
animation, power-ups.

**Do not promise the finished game to the room.** Read the "What to demo"
section below before 0:05 - it is easy to open this lesson by describing
everything on these pages and leave two thirds of the room feeling like they
failed at the last session of the course.

## Timing

| Time | Activity |
|---|---|
| 0:00-0:10 | Recap, demo, and set today's expectations |
| 0:10-0:20 | Repair window - anyone still finishing Lesson 2 |
| 0:20-0:48 | Milestone 1 - an enemy ship (floor, part 1) |
| 0:48-1:15 | Milestone 2 - the enemy shoots back (floor, part 2), then Milestones 3 and 4 for anyone who gets there |
| 1:15-1:22 | Make it yours |
| 1:22-1:30 | Showcase, save, celebrate |

**Where those numbers come from.** The step cards have 60 numbered steps in
Milestone 1 and 57 in Milestone 2, and the two optional milestones add 61
and 84 more. Budgeting roughly 28 seconds per step - slower than a
confident adult, faster than Lesson 1's beginners, because by week three the
editor is familiar - Milestone 1 is about 28 minutes and Milestone 2 about
27. That is the 55-minute build slot, and it is fully spent on the floor.
Milestone 3 is another ~28 minutes of work and Milestone 4 another ~39, so
only a kid who is genuinely quick will start one, and very few will finish
one. Plan the room around that.

**If you are running behind**, cut in this order:

1. The "make it yours" slot at 1:15 - shorten it to three minutes and give
   the time back to building.
2. Milestone 1's sprite-hunting. If a kid is still scrolling the library at
   0:25, pick a sprite for them and move on; which sprite it is does not
   matter to anything else today.
3. The repair window's third priority (kids stuck earlier than Lesson 2's
   Milestone 4). Let them keep building at their own pace during the build
   slot instead - they still finish today with a better game than they had.

Never cut the showcase at 1:22. It is the last thing that happens in the
course.

## What to demo

- Quick recap: click the green flag on last week's project. Fly around,
  shoot a few asteroids, take a hit, and point out that it still stops dead
  rather than showing a proper game over.
- Today's milestone: demo **the enemy** - a ship gliding across the top,
  taking laser hits, and firing back at you. That is what everyone is
  building, and that is what you should describe as "today's game".
- Then, separately and briefly, show the rest: the difficulty ramp, the
  GAME OVER screen, the sounds. Say plainly whose they are: *"these two are
  extra. If you finish the enemy and there's still time, the cards keep
  going. If you don't get to them, your game is still finished - the enemy
  is the finish line."*
- Say the same thing again when you hand out the cards. Kids read ahead.

## Blocks introduced today

- *Yellow* Events: `broadcast [message]`, `when I receive [message]`
- *Purple* Looks: `switch backdrop to [backdrop]` (Milestone 4)
- *Pink* Sound: `start sound [sound]` (Milestone 4)
- *Green* Operators: `() * ()` (Milestone 3)

Only the two Events blocks are guaranteed to come up for everyone - the
other three live in the optional milestones. Teach `broadcast` properly to
the whole room; introduce the rest to whoever reaches them.

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
   block) is missing entirely - get it in place, even roughly. `lives` in
   particular is not optional: today's Milestone 2 has `EnemyLaser` taking a
   life off the ship, so a kid without `lives` cannot finish the floor.
3. Anyone still stuck earlier than that (laser or asteroid clones not
   working) needs the volunteer at their elbow, not a race to catch up -
   let them keep going during the build slot instead of rushing them now.

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
so `EnemyLaser` knows when to fire (everyone builds this), and `Ship`
shouting `game over` so the Stage knows when to end the game (Milestone 4,
for kids who get there).

## Milestone scripts (from the design spec)

### Milestone 1 - An enemy ship (0:20-0:48, floor)

```
when green flag clicked
show
forever
  go to x: (-230) y: (pick random (90) to (150))
  repeat until <(x position) > (230)>
    change x by (4)
    if <touching [Laser v]?> then
      change [score v] by (5)
      go to x: (-230) y: (pick random (90) to (150))
```

The design spec also has a `start sound [pop v]` block inside that `if`.
It has been moved to Milestone 4, with the rest of the sound work, so the
floor doesn't spend ten minutes in the sound library. The end state is
identical for a kid who finishes Milestone 4; a kid who doesn't gets an
enemy that works, silently. **There is no Sounds-tab detour in the floor
this year** - if a volunteer remembers one from the spec, that's why.

Sprite choice: the cards tell kids to search `space` and pick anything that
reads as an enemy, going by the picture rather than a name. Scratch's
library changes between versions and there is no dependable spaceship-enemy
name to give them, so don't let a kid burn five minutes hunting for a
specific one - any creature or vehicle works, and the cards say so.

### Milestone 2 - The enemy shoots back (0:48-1:15, floor)

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

**This is the finish line.** When a kid gets here, say so out loud, make
them save, and get them to show it to the kid next to them before they touch
Milestone 3.

### Milestone 3 - Getting harder (optional, in the build slot)

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

Kids who did last week's "make it yours" have their own numbers in that
block rather than `0.5` and `1.5`. The cards tell them to replace whatever
is there; from this point `spawn gap` owns the spawn rate.

### Milestone 4 - A proper game over, then sound (optional, in the build slot)

**Order inside this milestone matters, and the cards enforce it.** The Stage
gets its `when I receive [game over v]` script built *first*, while `Ship`
still has the working `stop [all v]` from Lesson 2. Only then does `Ship`'s
block get swapped. In between, the Stage is listening for a message nobody
sends - harmless - and the game can still end at 0 lives the whole time. Do
not let a kid (or a volunteer reading ahead) delete `stop [all v]` from
`Ship` first: it leaves the project with no way to end at all, and if the
clock runs out mid-milestone that is the game they take home.

Also note the `game over` message is created on the **Stage**, in the
`when I receive` dropdown - not on `Ship`. `Ship`'s `broadcast` block just
picks it from the list afterwards.

Game-over screen: duplicate the space backdrop, paint `GAME OVER` on it,
name it `game-over`. On the Stage:

```
when I receive [game over v]
switch backdrop to [game-over v]
stop [all v]
```

```
when green flag clicked
switch backdrop to [your space backdrop v]
```

Then, on `Ship`, find last week's

```
  if <(lives) = (0)> then
    stop [all v]
```

and change it - don't add a second block next to it - to:

```
  if <(lives) = (0)> then
    broadcast [game over v]
```

**Order matters inside the Stage's receive script too**: the backdrop has to
switch *before* `stop [all v]` runs, because `stop [all v]` halts every
script in the project immediately, including the one doing the switching.
Swap the two blocks and the screen will freeze on whatever backdrop was
showing when the game ended, not on GAME OVER.

(`[your space backdrop v]` here means whichever space backdrop the kid
picked in Lesson 1 - nobody renamed it, so its label in the dropdown will be
whatever the library happened to call it. There are only two backdrops on
the Stage by this point, so "pick the one that isn't game-over" works
regardless of its exact name.)

Sound comes second, from step 35 of the milestone: `start sound` when the
laser fires, when an asteroid or the enemy is destroyed, and when the ship
is hit. This is the first and only Sounds-tab work in the lesson, so it is
also the first time you will be answering "the dropdown is empty" questions.
It is deliberately last: it is the highest-joy, lowest-stakes part of the
day, and it is the safest thing for the clock to eat.

## Discussion prompts

Both of these belong to the optional milestones, so put them to whoever
gets there rather than to the whole room - and let them guess first.

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

- **A kid did last week's fire-rate fix, so today's cards don't match their
  project.** Two to four kids in a room of twelve, and they are exactly the
  kids who get furthest today. Their `Laser` has no
  `when [space v] key pressed` block - it's a `forever` /
  `if <key [space v] pressed?>` loop under `when green flag clicked`
  instead. It matters twice: at Milestone 2 step 27, where `EnemyLaser`
  (a duplicate of `Laser`) still carries that loop, and at Milestone 4 step
  43, where the laser sound goes in. The cards carry a note at both points -
  point at the note rather than improvising. If the loop is left on
  `EnemyLaser`, the enemy fires a bolt every time the *player* presses
  space, which is a genuinely baffling symptom.
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
- **`Enemy` is huge and hoovers up lasers.** Its size field was left at the
  library default. Set it to about 50, like `Ship` and `Asteroid`.
- **Nothing happens when `spawn gap` should be dropping.** The watcher
  script needs its own `when green flag clicked` hat block, separate from
  `Ship`'s movement script - check it wasn't accidentally nested inside the
  existing `forever` loop instead of being its own script.
- **The floor doesn't hold - `spawn gap` keeps dropping below 0.4.** The
  inner `if <(spawn gap) < (0.4)> then` has to be *inside* the outer `if`,
  underneath `change [spawn gap v] by (-0.2)`, not a separate script.
- **The game never ends, and `lives` runs off into negative numbers.**
  `if <(lives) = (0)>` only fires if a script happens to look at `lives` on
  the exact tick it equals 0. With an asteroid *and* an `EnemyLaser` clone
  both able to take a life in the same frame, `lives` can go 1 → 0 → -1
  inside one tick and never be seen at 0. Fix: change the `=` block to a
  `<` block and the `0` to a `1`, giving `if <(lives) < (1)> then`. This is
  worth knowing even for kids who never reach Milestone 4 - it can bite from
  Milestone 2 onward, the moment `EnemyLaser` exists.
- **The game stops but the screen doesn't change**, or the screen changes
  but a half-second later than it should. Check block order on the Stage's
  `when I receive [game over v]` script - `switch backdrop to [game-over v]`
  has to be above `stop [all v]`, not below it.
- **The GAME OVER screen is still showing the next time someone clicks the
  green flag.** Missing green-flag `switch backdrop to
  [your space backdrop v]` script on the Stage - see the discussion prompt
  above.
- **A sound doesn't play, or the dropdown shows "recording1" or nothing at
  all.** Sounds belong to a single sprite, not to the project. The sprite
  needs a sound added on its own Sounds tab before the `start sound` block
  has anything to choose - if a kid built the block first, send them to the
  Sounds tab, add a sound, then come back and pick it from the dropdown.

## Stretch goals

Purely cosmetic and tuning - optional, and never something a kid needs to
reach today's finish line:

- A title screen with "press space to start".
- A boss asteroid that takes three hits to destroy instead of one.
- A high-score variable that remembers the best score across plays.
- A ship explosion animation when lives hits 0.
- Power-ups.

## "Make it yours" prompts to read out

- "How fast should the enemy move, and how often should it fire? Try
  different numbers in `Enemy`'s two scripts."
- "What should your enemy look like? Recolour it, resize it, or give it a
  second costume in the Costumes tab."
- For anyone who reached Milestone 4: "What sounds fit your game?" and
  "What should your GAME OVER screen look like? Go wild in the paint
  editor."
- Once those are done, point kids at `reference/extra-challenges.md` for
  more ideas to fill the rest of the build slot.

## Wrap-up (1:22-1:30)

This is the last session, so let it feel like one: have kids play each
other's games rather than just their own.

Then, before anyone logs off, **walk the room and confirm every single
project actually saved.** The cards end with a numbered save step (**File →
Save now**), but a kid mid-milestone at 1:22 is the one most likely to skip
it, and a "saved" that silently failed because the login expired looks
exactly like a saved project. Look at each screen yourself. A finished game
that isn't saved doesn't survive the week - and this week there is no next
week to fix it in.

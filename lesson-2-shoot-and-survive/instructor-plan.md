# Lesson 2 - Shoot and survive: instructor plan

**New idea this week:** clones.
**Floor (everyone must reach):** Milestone 3 - shooting an asteroid increases
`score`. The game is a real shooter at this point.
**Second target (everyone should reach):** Milestone 4 - `lives` and game over.
**Stretch goals (cosmetic/tuning, optional):** the fire-rate fix, laser
colour and speed, asteroid spawn rate and fall speed, a second asteroid
costume.

This is the heavy lesson. It's built as four stacked milestones, and the game
is playable after every single one - so whatever the clock does, nobody goes
home with something broken.

## Timing

| Time | Activity |
|---|---|
| 0:00-0:10 | Recap, demo today's game |
| 0:10-0:17 | Draw the `Laser` sprite |
| 0:17-0:35 | Milestone 1 - laser clones |
| 0:35-0:55 | Milestone 2 - asteroid clones |
| 0:55-1:05 | Milestone 3 - score |
| 1:05-1:15 | Milestone 4 - lives and game over |
| 1:15-1:22 | Make it yours |
| 1:22-1:30 | Play each other's games, save |

## What to demo

- Quick recap: click the green flag on last week's project and fly the ship
  around for a few seconds.
- Today's milestone: demo the finished game (yours, or a pre-built copy) -
  shooting, dodging asteroids, score climbing, losing lives, game over. This
  is what "playable after every milestone" builds toward, so let it show.

## The four milestones - and why each one is a full, playable game

| # | Milestone | The game becomes |
|---|---|---|
| 1 | Laser clones | You can shoot into space |
| 2 | Asteroid clones falling | A dodging game |
| 3 | Laser hits asteroid -> `score` | **A shooter - this is the floor** |
| 4 | Asteroid hits ship -> `lives`, game over | A game with stakes |

State this explicitly, to the kids and to yourself: **Milestone 3 is the
floor everyone must reach** - after it, the game is a real shooter with a
score, and nobody has anything broken. **Milestone 4 is the second target
everyone should reach** - it adds lives and a game over, and unlike the
Stretch goals below it is not optional cosmetic tuning: Lesson 3 upgrades
this exact mechanic, so it's worth the extra push. Because the game is playable
after every single milestone, nobody goes home with something broken,
whatever the clock does. **Lesson 3 opens with a 10-minute repair window for
anyone who didn't reach Milestone 4**, so don't panic-rush a kid through it
near the end - let them stop wherever they've got to.

## Blocks introduced today

- *Amber* Control: `create clone of [myself]`, `when I start as a clone`,
  `delete this clone`, `repeat until <>`, `wait () seconds`, `stop [all]`
- *Pale blue* Sensing: `touching [sprite]?`
- *Green* Operators: `pick random () to ()`, `() > ()`, `() < ()`, `() = ()`
- *Orange* Variables: making a variable, `set [variable] to ()`,
  `change [variable] by ()`
- *Blue* Motion: `go to [sprite]`, `y position`
- *Purple* Looks: `hide`, `show`

`hide` and `show` look like throwaways and are not: together they are the
mechanism that makes the clone pattern work at all - the original sprite
hides itself on green flag and every clone shows itself as it is born. They
are also sticking point #2 below. Say what they are for out loud when the
laser is built, not just what to drag.

## Teaching clones

Say it out loud, the same way, both times it comes up - the laser in
Milestone 1, the asteroid in Milestone 2:

> Every cloned sprite needs **two** scripts: a **spawner** that says *make a
> copy now*, and the clone's own **life story** - where it appears, what it
> does, and when it disappears.

```
create clone of [myself v]              <- the spawner

when I start as a clone                 <- the life story
  ...go somewhere, show, move...
delete this clone
```

**`delete this clone` is not optional.** Without it, clones pile up invisibly
and the project slows to a crawl. State this as a rule once, and enforce it
again when the asteroid arrives in Milestone 2.

## Drawing the Laser (0:10-0:17)

Two gotchas to watch for while kids are in the paint editor:

- **Keep it small** - a few pixels wide, about 15 tall. A laser that's too
  big will visually touch asteroids it hasn't really reached, which becomes a
  confusing "that's not fair" bug two milestones from now.
- **Centre it on the crosshair** - the little + mark in the middle of the
  canvas. An off-centre costume makes the laser fly out at an angle instead
  of straight up, and it is baffling for a kid to debug because the scripts
  themselves look completely correct.

## Milestone scripts (verbatim from the design spec)

### Milestone 1 - Laser (0:17-0:35)

```
when green flag clicked
hide

when [space v] key pressed
create clone of [myself v]

when I start as a clone
go to [Ship v]
show
repeat until <(y position) > (170)>
  change y by (12)
delete this clone
```

### Milestone 2 - Asteroid (0:35-0:55)

```
when green flag clicked
hide
forever
  wait (pick random (0.5) to (1.5)) seconds
  create clone of [myself v]

when I start as a clone
go to x: (pick random (-220) to (220)) y: (180)
show
repeat until <(y position) < (-175)>
  change y by (-6)
delete this clone
```

### Milestone 3 - Score (0:55-1:05)

On `Ship`, initialise:

```
when green flag clicked
set [score v] to (0)
...
```

Add inside the asteroid clone's `repeat until`:

```
  if <touching [Laser v]?> then
    change [score v] by (1)
    delete this clone
```

### Milestone 4 - Lives and game over (1:05-1:15)

Make the variable `lives`, `set [lives v] to (3)` on `Ship`. Add inside the
asteroid clone's `repeat until`:

```
  if <touching [Ship v]?> then
    change [lives v] by (-1)
    delete this clone
```

And at the bottom of the `Ship`'s `forever` loop:

```
  if <(lives) = (0)> then
    stop [all v]
```

This is crude on purpose - **say so out loud**: *"next week you'll get the
chance to make this nicer."* Lesson 3 replaces it with a broadcast and a
proper game-over screen. Word it as a chance, not a guarantee: in Lesson 3
that work is Milestone 4, which is an optional target reached by the kids
who get there, not something the whole room is promised.

## Sticking points and fixes

- **`delete this clone` forgotten** - clones pile up invisibly and the
  project grinds to a slow crawl. Comes up with both the laser (Milestone 1)
  and the asteroid (Milestone 2) - watch for it both times.
- **`hide` forgotten on the original sprite** - a stray laser or asteroid
  sits stuck on screen from the moment the green flag is clicked, because the
  original (un-cloned) sprite is still visible wherever the sprite editor
  left it.
- **The `when [space] key pressed` key-repeat delay** - holding space fires
  one shot, pauses, then rattles off several quickly. This is an OS quirk,
  not a mistake - reassure kids it's expected. **This is the stretch fix**
  (see Stretch goals below).
- **A laser drawn too large** - it visually touches asteroids it hasn't
  really reached, which shows up as "unfair" scoring once Milestone 3 is
  built. Fix: redraw it smaller in the Costumes tab.
- **A variable created "for this sprite only" instead of "for all sprites"**
  - `score` or `lives` won't update the way the scripts expect. Comes up with
  both `score` (Milestone 3) and `lives` (Milestone 4) - watch for it both
  times. Fix: right-click the variable in the palette, delete it, and make it
  again with "For all sprites" selected.
- **The game never ends, and `lives` runs off into negative numbers.**
  `if <(lives) = (0)>` only fires if a script happens to look at `lives` on
  the exact tick it equals 0. Two asteroid clones can each take a life in
  the same frame, taking `lives` 1 → 0 → -1 before the `=` block ever sees
  0, and then the game runs forever. Fix: change the `=` block to a `<`
  block and the `0` to a `1`, giving `if <(lives) < (1)> then`. This is on
  the README's pre-teaching checklist for a reason - it gets worse in Lesson
  3, where an asteroid and an `EnemyLaser` bolt can also land together.

## Stretch goals

- **Fire-rate fix** - replace the laser's `when [space] key pressed` hat
  block with:

```
when green flag clicked
hide
forever
  if <key [space v] pressed?> then
    create clone of [myself v]
    wait (0.2) seconds
```

- Laser colour and speed.
- Asteroid spawn rate and fall speed.
- A second asteroid costume, picked at random.

## "Make it yours" prompts to read out

- "What colour and size should your laser be? Try redrawing it in the
  Costumes tab."
- "How fast should your laser fire? If you want a steadier rate instead of
  the key-repeat rattle, try the fire-rate fix above."
- "How often should asteroids appear? Try different numbers in the
  `pick random () to ()` block inside `Asteroid`'s `wait () seconds` block."
- "How fast should asteroids fall? Try a different number in the
  `change y by ()` block on the asteroid's clone script."
- "Can you give `Asteroid` a second costume, and make new clones pick one at
  random?"

## Wrap-up (1:22-1:30)

The step cards end with a numbered save step (**File → Save now**). Don't
assume it happened: **walk the room and confirm every single project
actually saved before anyone logs off.** Look at each screen yourself.
Lesson 3's step cards open by asking the kid to open `Space Shooter` again,
and a kid whose project didn't save has nothing to open and cannot follow
next week's cards at all. Watch for the two quiet failures - a kid who never
reached the last card, and a "save" that failed because the login had
expired, which looks identical to a successful one from across the room.

## Notes for next week

Note down who didn't reach Milestone 4, so Lesson 3's 10-minute repair window
can be targeted at exactly the right kids instead of a blanket recap. Lesson
3 needs: `Laser` (it gets duplicated and recoloured into `EnemyLaser`),
`Asteroid` still present and working, and `score`/`lives` both created "for
all sprites" - if either variable was made "for this sprite only" on the
wrong sprite, fix it before next week rather than in front of the group.

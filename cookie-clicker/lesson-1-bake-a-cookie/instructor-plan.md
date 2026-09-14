# Lesson 1 - Bake a cookie: instructor plan

**New idea this week:** variables, and `when this sprite clicked`.
**Floor (everyone must reach):** end of Milestone 3 - a hand-painted
cookie that counts every click, resets to 0 on the green flag, and pops and
squashes when you hit it.
**Bonus round (if they get there):** a `Special Cookie`, shrunk and parked in
a corner, worth 10 a click.
**Stretch (cosmetic tuning, optional):** what the cookie looks like, which
click sound it makes, how hard it squashes, what the `Special Cookie` is
worth, and where the `cookies` readout sits on the stage.

## Timing

| Time | Activity |
|---|---|
| 0:00-0:10 | Welcome, demo today's game, quick peek at the finished Lesson 3 game to sell the course |
| 0:10-0:25 | Setup: log in, Create, name it `Cookie Clicker`, delete the cat, any backdrop (this genuinely takes 15 min - see below) |
| 0:25-0:42 | **M1** Paint the cookie, make the `cookies` variable, click script |
| 0:42-0:54 | **M2** The green flag resets it - *the deliberate detour, do not cut* |
| 0:54-1:07 | **M3** Make it feel good - sound and squash |
| 1:07-1:15 | **M4** The `Special Cookie` *(bonus round, if you get there)* |
| 1:15-1:21 | Make it yours |
| 1:21-1:25 | Play each other's games |
| 1:25-1:30 | Save, confirm every project saved, wrap up |

Where those minutes come from. The step cards hold 76 numbered steps, and
Lesson 1 of the other course measures out at about 42 seconds a step with
week-one beginners:

- Milestone 1, 35 steps. The first 8 are setup and login, which do not run
  at 42 seconds a step - they run at whatever the slowest password takes,
  so they get their own 15-minute slot. The other 27 are painting and
  block-building: 27 x 42s = 19 min at the nominal rate, **budgeted at 17**.
  Thirteen of those 27 are paint-editor steps, and how long those take is
  set by when you give the "that's good enough" cue below, not by the step
  count - so this is the one row in the table you control directly. If the
  painting still overruns, Milestone 4 is the cut, not this row.
- Milestone 2, 10 steps, but only 7 of them build blocks: 7 x 42s = 5 min,
  plus ~7 min for the detour in steps 1-3, which is discussion time, not
  step time. 12 min.
- Milestone 3, 19 steps: 19 x 42s = 13 min.
- Milestone 4, 12 steps: 12 x 42s = 8 min.
- The tail, 15 min across three rows rather than one. Saving gets 5, and
  that 5 is a floor rather than a target: the save check below is a walk
  round every screen in the room, one at a time, and it will eat a combined
  "play and save" slot whole - leaving the playing to happen and the saving
  not to. Playing each other's games gets 4. "Make it yours" gets **6,
  trimmed from 7**, because it is the only slot in the lesson with no fixed
  content to get through - a kid who runs out of ideas at minute 4 is
  finished, and one who doesn't can carry on tinkering while the room plays
  each other's games. Nobody can tell it was ever 7.

Those two trims - 2 minutes off Milestone 1's build row and 1 off "make it
yours" - are the 3 minutes that let the tail be three rows instead of one.
Both are deliberate, and neither is a step-count number, which is why they
are argued here rather than just written into the table.

Row by row, that is the whole 90: 10 welcome + 15 setup + 17 M1 + 12 M2 +
13 M3 + 8 M4 + 6 make it yours + 4 playing + 5 saving.

If you add or remove steps in the cards, redo this arithmetic and redo the
table - nothing checks it for you.

## What to demo

- A quick peek at the finished Lesson 3 game, to sell the course - golden
  cookies, a shop, numbers climbing on their own. This is where they're
  headed over the three weeks.
- Today's milestone: a cookie that counts clicks. Click it fast, let them
  hear the sound and see the squash, then press the green flag and show the
  score dropping to 0.

Do **not** demo the un-resetting counter from Milestone 2. They need to
meet that themselves.

## Setup, login and the paint editor (0:10-0:25)

Log in to scratch.mit.edu, Create a new project, name it `Cookie Clicker`,
delete the cat, pick any backdrop at all. No backdrop is named anywhere in
this course, so "whichever one you like" is the whole instruction.

**This genuinely takes 15 minutes with beginners.** Logins eat most of it:
forgotten passwords, mistyped usernames, accounts made last term and never
used since. If you can, get accounts created and tested *before* the
session rather than in it. If you are still doing logins at 0:25, do not
hold the room - start the kids who are in on the painting and work the
stragglers at their elbow. The step cards are self-serve from here, which
is exactly what they are for.

**Then there is the paint editor, which is this lesson's real time sink.**
Some kids will happily spend twenty minutes drawing one cookie. A brown
circle with five darker blobs is genuinely enough to carry the whole
lesson. Walk the room during the painting and say, to each kid, some
version of:

> "That's good enough - it counts clicks either way. You get time at the
> end in Make It Yours to make it beautiful."

**Give that cue early**, around 0:32, not at 0:38 when they are already
behind. A kid told at 0:32 shrugs and moves on; a kid told at 0:38 feels
their drawing was taken away from them.

One thing in the painting is load-bearing, and it is card steps 15 and 16:
**they draw the cookie big in the paint editor and leave the sprite's Size
field at 100.** If a kid instead draws it small and sets Size to 150, Milestone
3's squash - `set size to (110) %` - will *shrink* the cookie on every
click instead of growing it. If you see a Size field that isn't 100, fix it
back to 100 there and then and have them redraw bigger.

## Blocks introduced today

- *Yellow* Events: `when green flag clicked`, `when this sprite clicked`
- *Orange* Variables: `set [variable] to ()`, `change [variable] by ()`,
  and the `(cookies)` oval that appears on the stage
- *Pink* Sound: `start sound [sound]`
- *Purple* Looks: `set size to () %`
- *Amber* Control: `wait () seconds`

## The deliberate detour (0:42-0:54)

This is the pedagogical point of the week, and a volunteer who doesn't
understand it will skip it by "helping" a kid past the interesting part too
fast.

By the end of Milestone 1 the cookie counts clicks. The cards then tell the
kid to click up a score they're proud of and press the green flag - and
**the number doesn't reset.** It just sits there at 47. That is not a bug in
their project; it is what a variable does. It holds whatever it was last
told to hold, forever, until something tells it otherwise, and nothing has
ever told it otherwise.

**Let them notice, and let them sit in it.** Ask "what did you expect the
green flag to do?" and "who told the cookie to go back to 0?" before
explaining anything. Kids who play games can feel that something is wrong
here even when they can't name it. The discomfort is what makes
`set [cookies v] to (0)` land as an *idea* - initialise where the game
starts - rather than as one more block someone told them to drag.

Only then do the cards build the two-block green-flag script. Say out loud
that this is the pattern the whole rest of the course sits on: every
variable added in weeks two and three gets set to its starting value in
this same green-flag script.

**Do not cut this slot**, even if the room is behind. It is the one piece of
the lesson that cannot be recovered later - Lessons 2 and 3 both assume the
kid already knows why a variable needs setting.

## Why the blocks are the ones they are

Two choices in Milestone 3 look arbitrary and are not. Both are bugs if
reversed, and kids who wander off-card will find both.

- **`start sound`, not `play sound until done`.** `play sound until done`
  makes the script sit and wait for the sound to finish before it does
  anything else. A kid clicking fast - which is the entire game - would see
  the counter stall and lag behind their clicking. `start sound` fires the
  sound and carries straight on. **Swapping the wrong block out is not one
  drag**, and this is the one to watch: by the time the symptom shows, the
  three squash blocks are chained below the sound block, and dragging a
  block takes everything below it along. A kid who drags the wrong block
  straight onto the palette loses the squash in the same motion and gets no
  warning at all - the sound is fixed, the squash is silently gone. The
  card's procedure is three moves: drag `set size to (110) %` and the two
  blocks under it out to an empty spot first, *then* swap the sound block,
  *then* snap the squash blocks back under it.
- **`set size to`, not `change size by`.** Clicking the cookie again
  restarts the click script from the top, wherever it had got to. With
  `change size by (10)` and `change size by (-10)`, a fast second click
  restarts the script before the `(-10)` ever runs, and the cookie is left
  permanently inflated - a bit bigger with every click. `set size to (110)
  %` followed by `set size to (100) %` says an exact size both times, so a
  restart can't accumulate anything.

That same absoluteness is why Milestone 4 deletes the squash blocks from
`Special Cookie`: it's a sprite shrunk to 50, and `set size to (110) %`
would blow it up to 110 on the first click.

## Sticking points and fixes

- Clicking the sprite's thumbnail in the sprite list instead of the cookie
  on the stage, then reporting that the counter is broken. Very common in
  the Milestone 1 check.
- No number visible on the stage - the tick box next to `cookies` in the
  Variables palette got unticked, usually by accident.
- Blocks dropped *near* a script rather than snapped into it. Look for the
  white drop-shadow line when dragging a block close to another; if there's
  no shadow, it isn't attached and won't run.
- The `set` or `change` block still pointing at `my variable` because the
  dropdown was never changed. The block looks right at a glance and does
  nothing visible.
- A Size field that isn't 100 (see the setup section above) - catch this
  during painting, not after the squash misbehaves.
- In Milestone 4, edits made on the wrong sprite. `Cookie` and
  `Special Cookie` have near-identical code areas. Have them click the
  sprite in the sprite list first, every time, and check the name in the
  sprite info panel before touching a block.
- In Milestone 4, the copied green-flag script left behind on
  `Special Cookie`. This one has **no visible symptom** - two blocks setting
  the same variable to 0 on the same green flag look exactly like one - so
  no kid will report it and no play-test will surface it. The card makes it
  a deliberate check instead, and it is worth your eyes too: click
  `Special Cookie` and count the scripts, expecting exactly one. A project
  that goes home with the stray script is what Lesson 2 opens on.
- Also in Milestone 4: dragging a block takes everything below it with it.
  The cards use this deliberately, twice, to remove a whole script in one
  gesture, and the `start sound` block and the three below it in another. A
  kid who grabs the wrong block loses more than they meant to - undo is
  Ctrl+Z, or just rebuild the block from the palette.

## If the room is behind

Cut in this order:

1. **Milestone 4**, the `Special Cookie`. It sits above the floor by design
   and Lesson 3 opens by offering it to anyone who hasn't got one.
2. **"Make it yours" at 1:15** - shorten it to three or four minutes.
3. **The quick peek at the finished Lesson 3 game**, if you haven't given it
   yet.

**Do not cut the deliberate detour at 0:42-0:54.** See above.

## "Make it yours" prompts to read out

- "What does your cookie actually look like? Redraw it - a different shape,
  different chips, a bite taken out of it."
- "What should it sound like when you click it? Try another sound from the
  library."
- "How hard should it squash? Try a different number in
  `set size to (110) %` - `130` is a big squash, `104` is a tiny one."
- "What's your `Special Cookie` worth? 10 was only a suggestion."
- "Where do you want the score to sit on the stage? Drag the readout
  wherever you like."

## Kids who finish early

Point them at `reference/extra-challenges.md` the moment their **Check it
works** passes while others are still building - not at the end of the
lesson. A kid with twenty spare minutes and nothing in front of them is the
one who starts poking at somebody else's keyboard.

**Match the tier to the clock.** The three-star challenge is a fifteen to
twenty-five minute build. Started at 1:10 it will not finish, and a kid who
leaves part-way through is worse off than one who never started. Big things
early in their spare time; the one-star tweaks near the end.

**On work you have not prepared.** The three-star challenges, and everything
in `reference/bonus-ideas.md`, are things nobody has built - including
whoever wrote them. When one does not work, the answer is "show me what you
tried", not you debugging something you have never seen. That is the honest
position at one volunteer per six kids, and saying it out loud costs you
nothing.

## Wrap-up and saving (1:25-1:30)

The step cards end with a numbered save step (**File -> Save now**). Don't
assume it happened: **walk the room and confirm every single project
actually saved before anyone logs off.** Look at each screen yourself. Next
week's step cards open by asking the kid to open `Cookie Clicker` again,
and a kid whose project didn't save has nothing to open and cannot follow
the cards at all. Two things go wrong quietly - a kid who never reached the
last card, and a "save" that failed because the login had expired, which
looks identical to a successful one from across the room.

## Notes for next week

Lesson 2 opens on exactly what today leaves behind, so don't let anyone
finish the session with a variant of it:

- the sprite named exactly `Cookie`, at Size 100;
- the variable named exactly `cookies`, lower-case, **For all sprites**;
- a green-flag script on `Cookie` that sets `cookies` to 0 - Lesson 2 adds
  three more `set` blocks to that same script, so it has to exist;
- if they built the bonus round, a sprite named exactly `Special Cookie`,
  carrying exactly one script - the two-block one - and no copy of the
  green-flag script.

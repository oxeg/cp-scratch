# Lesson 3 - Enemies and polish

By the end of today your game will have an enemy ship that glides across the
top of the screen and shoots back at you. That's Milestones 1 and 2, and
that's what today is really about - everyone gets that far.

Milestones 3 and 4 are extra targets for anyone who finishes Milestone 2
with time to spare: making the game get harder the longer you survive, and a
real GAME OVER screen with sound effects. Get to them if you get to them.
Nobody is behind if they don't - the game you take home today is a better
game than the one you took home last week either way.

**Words used in these cards**

- **Palette** - the panel of coloured block categories down the left, the
  one you drag blocks *out of*.
- **Code area** - the big middle panel, the one you drop blocks *into* to
  build a script.
- **Reporter block** - a small oval block with a name on it, like `score` or
  `x position`. It stands for a number. You drop a reporter *into a slot* on
  another block, instead of snapping it underneath one.

## Milestone 1: An enemy ship

1. Go to scratch.mit.edu.
2. Log in.
3. Click your `Space Shooter` project from last week to open it.
4. Click **See inside** to open the editor.
5. Click the add-sprite button in the sprite list panel to open the sprite
   library.
6. Click the search box at the top of the library.
7. Type `space`.
8. Look through the results for something that would work as an enemy -
   another spaceship, a flying saucer, or an alien creature. Library names
   change from version to version, so go by the pictures rather than hunting
   for one exact name, and click whichever one looks like it could shoot at
   you.
9. Click the sprite's name box in the sprite info panel.
10. Type `Enemy` to rename it.
11. Change the size field in the sprite info panel to about `50`, so the
    enemy is about the same size as your ship.
12. Click the Code tab.
13. Click the *yellow* Events category in the palette.
14. Drag a `when green flag clicked` block into the code area.
15. Click the *purple* Looks category in the palette.
16. Drag a `show` block and snap it underneath `when green flag clicked`.
17. Click the *amber* Control category in the palette.
18. Drag a `forever` block and snap it underneath `show`.
19. Click the *blue* Motion category in the palette.
20. Drag a `go to x: () y: ()` block so it sits inside the `forever` block.
21. Click the x field on that block.
22. Type `-230`.
23. Click the *green* Operators category in the palette.
24. Drag a `pick random () to ()` block into the y number slot on the
    `go to x: () y: ()` block.
25. Click the first field of that `pick random` block.
26. Type `90`.
27. Click the second field of that `pick random` block.
28. Type `150`.
29. Click the Control category in the palette.
30. Drag a `repeat until <>` block so it sits inside the `forever` block,
    underneath `go to x: (-230) y: (pick random (90) to (150))`.
31. Click the Operators category in the palette.
32. Drag an `() > ()` block into the hexagon slot on the `repeat until`
    block.
33. Click the Motion category in the palette.
34. Drag an `x position` block into the left slot of the `>` block.
35. Click the right field of the `>` block.
36. Type `230`.
37. Click the Motion category in the palette.
38. Drag a `change x by ()` block so it sits inside the `repeat until`
    block.
39. Type `4` into its number field.
40. Click the Control category in the palette.
41. Drag an `if <> then` block so it sits inside the `repeat until` block,
    underneath `change x by (4)`.
42. Click the *pale blue* Sensing category in the palette.
43. Drag a `touching [sprite]?` block into the hexagon slot on the new `if`
    block.
44. Click its sprite dropdown.
45. Choose **Laser**.
46. Click the *orange* Variables category in the palette.
47. Drag a `change [variable v] by ()` block so it sits inside the `if`
    block.
48. Click its variable dropdown.
49. Choose **score**.
50. Type `5` into its number field.
51. Click the Motion category in the palette.
52. Drag a `go to x: () y: ()` block so it sits inside the `if` block,
    underneath `change [score v] by (5)`.
53. Click the x field on that block.
54. Type `-230`.
55. Click the Operators category in the palette.
56. Drag a `pick random () to ()` block into the y number slot on that new
    `go to x: () y: ()` block.
57. Click the first field of that `pick random` block.
58. Type `90`.
59. Click the second field of that `pick random` block.
60. Type `150`.

Your script should now look like this:

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

**Check it works**
Click the green flag. The enemy should appear on the left and glide across
the top of the stage. Shoot it with your laser - `score` should go up by 5,
and the enemy should jump straight back to the left edge and start gliding
across again.

**Stuck?**
- Nothing turns up when you search `space` - clear the search box and try
  `alien`, then `rocket`, then `monster`. If none of those help, scroll
  through the whole library and pick any creature or vehicle you like the
  look of. It does not have to be a spaceship: rename it `Enemy` and every
  script below works exactly the same.
- Nothing appears when you click the green flag - check `show` is snapped
  directly under `when green flag clicked`, and `forever` is snapped under
  `show`.
- The enemy appears but never moves - check `go to x: () y: ()` and
  `repeat until <>` are both inside the `forever` block, not sitting below
  it.
- Shooting the enemy doesn't do anything - check the `touching [Laser v]?`
  block's dropdown really says Laser, and that your laser is actually
  reaching that high up the screen.
- The enemy is enormous next to your ship - check the size field in the
  sprite info panel says about 50.

## Milestone 2: The enemy shoots back

1. Click the `Enemy` sprite in the sprite list, if it isn't already
   selected.
2. Click the Events category in the palette.
3. Drag a `when green flag clicked` block into an empty spot in the code
   area - this starts a brand new, second script.
4. Click the Control category in the palette.
5. Drag a `forever` block and snap it underneath the new
   `when green flag clicked` block.
6. Drag a `wait () seconds` block so it sits inside that `forever` block.
7. Click the Operators category in the palette.
8. Drag a `pick random () to ()` block into the `wait` block's number slot.
9. Click the first field of that `pick random` block.
10. Type `1`.
11. Click the second field of that `pick random` block.
12. Type `2.5`.
13. Click the Events category in the palette.
14. Drag a `broadcast [message v]` block so it sits inside the `forever`
    block, underneath `wait`.
15. Click the broadcast block's dropdown.
16. Click **New message**.
17. Type `enemy fire`.
18. Click **OK**.

`Enemy` should now have two separate scripts. The new one should look like
this:

```
when green flag clicked
forever
  wait (pick random (1) to (2.5)) seconds
  broadcast [enemy fire v]
```

19. Right-click the `Laser` sprite's thumbnail in the sprite list and
    choose **duplicate**.
20. Click the duplicate sprite's name box in the sprite info panel.
21. Type `EnemyLaser` to rename it.
22. Click the Costumes tab.
23. Click the fill (paint bucket) tool in the paint editor's toolbar.
24. Click a different colour swatch to pick a new colour.
25. Click on the bolt shape in the canvas to recolour it.
26. Click the Code tab.

    **Did you do the fire-rate fix last week?** Then `EnemyLaser` has no
    `when [space v] key pressed` block at all - your firing script is a
    `forever` loop hanging under `when green flag clicked` instead. Do steps
    27 and 28 like this instead: drag `create clone of [myself v]` out of
    the loop to an empty spot in the code area, then grab the `forever`
    block itself and drag it onto the palette to delete it. That leaves
    `when green flag clicked` / `hide`, which is exactly what everyone else
    has. If you skip this, `EnemyLaser` will fire from the enemy every time
    *you* press the space bar.

27. Drag the `create clone of [myself v]` block away from underneath
    `when [space v] key pressed`, to an empty spot in the code area, so it's
    on its own.
28. Drag the `when [space v] key pressed` block onto the palette to delete
    it.
29. Click the Events category in the palette.
30. Drag a `when I receive [message v]` block into an empty spot in the
    code area.
31. Click its dropdown.
32. Choose **enemy fire**.
33. Drag the `create clone of [myself v]` block (the one you detached in
    step 27) and snap it underneath `when I receive [enemy fire v]`.

`EnemyLaser` should now have these two scripts:

```
when green flag clicked
hide
```

```
when I receive [enemy fire v]
create clone of [myself v]
```

34. In the `when I start as a clone` script, click the sprite dropdown on
    the `go to [Ship v]` block.
35. Choose **Enemy**.
36. Drag the `y position` block out of the left slot of the `() > ()` block
    inside `repeat until <>`, to an empty spot in the code area, so it's on
    its own.
37. Drag the `() > ()` block out of the `repeat until` block's hexagon slot
    and drop it onto the palette to delete it.
38. Click the Operators category in the palette.
39. Drag an `() < ()` block into the `repeat until` block's now-empty
    hexagon slot.
40. Drag the `y position` block (the one you detached in step 36) into the
    left slot of the `<` block.
41. Click the right field of the `<` block.
42. Type `-175`.
43. Click the number field on the `change y by ()` block inside
    `repeat until`.
44. Type `-8` to replace `12`.
45. Click the Control category in the palette.
46. Drag an `if <> then` block so it sits inside `repeat until`, underneath
    `change y by (-8)`.
47. Click the Sensing category in the palette.
48. Drag a `touching [sprite]?` block into the hexagon slot on the new `if`
    block.
49. Click its sprite dropdown.
50. Choose **Ship**.
51. Click the Variables category in the palette.
52. Drag a `change [variable v] by ()` block so it sits inside the new `if`
    block.
53. Click its variable dropdown.
54. Choose **lives**.
55. Type `-1` into its number field.
56. Click the Control category in the palette.
57. Drag a `delete this clone` block so it sits inside the new `if` block,
    underneath `change [lives v] by (-1)`.

`EnemyLaser`'s clone script should now look like this:

```
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

**Check it works**
Click the green flag. Every couple of seconds the enemy should fire a bolt
downward from wherever it currently is. If a bolt hits your ship, `lives`
should go down by 1. This is the game you take home today: fly, shoot,
dodge, and now duel an enemy that shoots back.

**Stuck?**
- **enemy fire** doesn't appear in the `when I receive` dropdown - the
  message only exists once you've built the `broadcast [enemy fire v]`
  block on `Enemy` (Milestone 2, steps 13-18). Build that first, then come
  back to `EnemyLaser`.
- `EnemyLaser` fires a bolt every time *you* press the space bar - you've
  still got last week's fire-rate `forever` loop sitting on `EnemyLaser`.
  See the note just above step 27 and delete that loop.
- Bolts appear in the middle of the stage instead of coming from the
  enemy - check the `go to [sprite]` block in the clone script says Enemy,
  not Ship.
- Bolts fly upward off the top of the screen instead of falling - check the
  comparison block inside `repeat until` is `() < ()`, not `() > ()`, and
  that `change y by ()` says `-8`, not `12`.
- `lives` doesn't go down when a bolt hits you - check the `touching
  [sprite]?` block inside the new `if` says Ship, and that `lives` was made
  "for all sprites" back in Lesson 2 (this is the same fix as Lesson 2's
  Milestone 4).

---

**You've reached today's finish line.** Milestone 2 is where everyone is
aiming, and your game is complete and playable right now. Save it (there are
steps at the bottom of these cards) and go and show somebody.

**Still got time?** Milestones 3 and 4 below are the extra targets. They are
independent - you can do either one without the other. If you only have time
for one, do **Milestone 4**: that's the proper GAME OVER screen you were
promised last week.

## Milestone 3: Getting harder

1. Click the `Ship` sprite in the sprite list.
2. Click the Variables category in the palette.
3. Click **Make a Variable**.
4. Click the name field in the dialog box.
5. Type `level`.
6. Click **For all sprites**, if it isn't already selected.
7. Click **OK**.
8. Click **Make a Variable** again.
9. Type `spawn gap`.
10. Click **For all sprites**.
11. Click **OK**.
12. Drag a `set [variable v] to ()` block and snap it underneath
    `set [lives v] to (3)`, so it sits between `set lives to 3` and
    `go to x: (0) y: (-120)`.
13. Click its variable dropdown.
14. Choose **level**.
15. Type `1` into its number field.
16. Drag another `set [variable v] to ()` block and snap it underneath
    `set [level v] to (1)`.
17. Click its variable dropdown.
18. Choose **spawn gap**.
19. Type `1.5` into its number field.

The start of `Ship`'s green-flag script should now look like this:

```
when green flag clicked
set [score v] to (0)
set [lives v] to (3)
set [level v] to (1)
set [spawn gap v] to (1.5)
go to x: (0) y: (-120)
...
```

20. Click the Events category in the palette.
21. Drag a `when green flag clicked` block into an empty spot in the code
    area - a brand new, separate script.
22. Click the Control category in the palette.
23. Drag a `forever` block and snap it underneath the new
    `when green flag clicked` block.
24. Drag an `if <> then` block so it sits inside that `forever` block.
25. Click the Operators category in the palette.
26. Drag an `() > ()` block into the hexagon slot on the `if` block.
27. Click the Variables category in the palette.
28. Drag a `score` reporter block into the left slot of the `>` block.
29. Click the Operators category in the palette.
30. Drag an `() * ()` block into the right slot of the `>` block.
31. Click the Variables category in the palette.
32. Drag a `level` reporter block into the left slot of the `*` block.
33. Click the right field of the `*` block.
34. Type `10`.
35. Click the Variables category in the palette.
36. Drag a `change [variable v] by ()` block so it sits inside the `if`
    block.
37. Click its variable dropdown.
38. Choose **level**.
39. Type `1` into its number field.
40. Drag another `change [variable v] by ()` block so it sits inside the
    `if` block, underneath `change [level v] by (1)`.
41. Click its variable dropdown.
42. Choose **spawn gap**.
43. Type `-0.2` into its number field.
44. Click the Control category in the palette.
45. Drag an `if <> then` block so it sits inside the *outer* `if` block,
    underneath `change [spawn gap v] by (-0.2)`.
46. Click the Operators category in the palette.
47. Drag an `() < ()` block into the hexagon slot on the new, inner `if`
    block.
48. Click the Variables category in the palette.
49. Drag a `spawn gap` reporter block into the left slot of the `<` block.
50. Click the right field of the `<` block.
51. Type `0.4`.
52. Click the Variables category in the palette.
53. Drag a `set [variable v] to ()` block so it sits inside the inner `if`
    block.
54. Click its variable dropdown.
55. Choose **spawn gap**.
56. Type `0.4` into its number field.

This new script on `Ship` should now look like this:

```
when green flag clicked
forever
  if <(score) > ((level) * (10))> then
    change [level v] by (1)
    change [spawn gap v] by (-0.2)
    if <(spawn gap) < (0.4)> then
      set [spawn gap v] to (0.4)
```

Now hand the asteroid's timing over to `spawn gap`. If you changed those two
numbers yourself in last week's "make it yours", yours will say something
other than `0.5` and `1.5` - that's fine, just replace whatever numbers are
in there. From here on `spawn gap` is what decides how fast asteroids come.

57. Click the `Asteroid` sprite in the sprite list.
58. Click the first field of the `pick random () to ()` block inside the
    `wait () seconds` block on `Asteroid`'s spawner script.
59. Type `0.3` to replace whatever number is there.
60. Click the Variables category in the palette.
61. Drag a `spawn gap` reporter block into the second field of that
    `pick random () to ()` block, replacing the number that's there.

`Asteroid`'s spawner script should now look like this:

```
when green flag clicked
hide
forever
  wait (pick random (0.3) to (spawn gap)) seconds
  create clone of [myself v]
```

**Check it works**
Click the green flag and play for a while, keeping an eye on the `level` and
`spawn gap` watchers on the stage. Once `score` goes past 10, `level` should
tick up to 2 and asteroids should start appearing a little faster. Keep
playing and it should keep happening - but `spawn gap` should never drop
below 0.4, however high your score gets.

**Stuck?**
- `level` never goes up - check this script has its own
  `when green flag clicked` hat block, separate from `Ship`'s movement
  script, and check the `>` block compares `score` to `(level) * (10)`, not
  the other way round.
- Asteroids don't speed up even though `level` is going up - check the
  `spawn gap` reporter block is really plugged into `Asteroid`'s
  `wait () seconds` block, not a typed-in number that only looks similar.
- `spawn gap` keeps dropping past 0.4 - check the inner `if` block sits
  *inside* the outer `if`, underneath `change [spawn gap v] by (-0.2)`, not
  as a separate script of its own.
- The game becomes unplayable at a high score - almost always means the 0.4
  floor isn't actually connected right; see the fix above.

## Milestone 4: A proper game over, and sound

First the GAME OVER screen - the thing you were promised last week. Sound
comes after it, from step 35 on.

1. Click the Stage thumbnail, below the stage to the right of the sprite
   list, to select it.
2. Click the Backdrops tab.
3. Right-click the space backdrop's thumbnail in the backdrop list and
   choose **duplicate**.
4. Click the duplicate backdrop's name box.
5. Type `game-over` to rename it.
6. Click the text tool (a "T" icon) in the paint editor's toolbar.
7. Click on the canvas where you want the words to start.
8. Type `GAME OVER`.
9. Click somewhere else on the canvas to finish the text.
10. Click the Code tab.
11. Click the Events category in the palette.
12. Drag a `when I receive [message v]` block into the code area.
13. Click its dropdown.
14. Click **New message**.
15. Type `game over`.
16. Click **OK**.
17. Click the Looks category in the palette.
18. Drag a `switch backdrop to [backdrop v]` block and snap it underneath
    `when I receive [game over v]`.
19. Click its backdrop dropdown.
20. Choose **game-over**.
21. Click the Control category in the palette.
22. Drag a `stop [all v]` block and snap it underneath
    `switch backdrop to [game-over v]`.

This script must have the backdrop switch above `stop [all v]`, in this
order - `stop [all v]` halts every script the instant it runs, including
the one switching the backdrop, so if the order is swapped the screen never
changes:

```
when I receive [game over v]
switch backdrop to [game-over v]
stop [all v]
```

23. Click the Events category in the palette.
24. Drag a `when green flag clicked` block into an empty spot in the code
    area - a new script on the Stage.
25. Click the Looks category in the palette.
26. Drag a `switch backdrop to [backdrop v]` block and snap it underneath
    the new `when green flag clicked` block.
27. Click its backdrop dropdown.
28. Choose your original space backdrop - the one you added back in Lesson
    1. There are only two backdrops in the list by now, so just pick
    whichever one isn't `game-over`.

The Stage's second script should now look like this:

```
when green flag clicked
switch backdrop to [your space backdrop v]
```

Nothing shouts `game over` yet, so nothing has changed when you play - the
Stage is listening for a message nobody sends. That's on purpose. Now go and
make `Ship` send it.

29. Click the `Ship` sprite in the sprite list.
30. Find the `if <(lives) = (0)> then` block at the bottom of `Ship`'s
    `forever` loop - the one you built in Lesson 2 - and drag the
    `stop [all v]` block out of it and onto the palette, to delete it.
31. Click the Events category in the palette.
32. Drag a `broadcast [message v]` block so it sits inside the same
    `if <(lives) = (0)> then` block, where `stop [all v]` used to be.
33. Click its dropdown.
34. Choose **game over**.

`Ship`'s `if` block at the bottom of `forever` should now look like this:

```
  if <(lives) = (0)> then
    broadcast [game over v]
```

Notice the order you did that in: you built the Stage's listener *first*,
and only then swapped `Ship`'s block over. That way your game never spent a
single minute unable to end. It's a good habit - build the new thing before
you take the old thing out.

Now for sound.

35. Click the `Laser` sprite in the sprite list.
36. Click the Sounds tab.
37. Click the add-sound button (a speaker icon) at the bottom of the sound
    list - check the exact spot in your editor, since it can look a little
    different depending on the version.
38. Click the search box at the top of the sound library.
39. Type `laser`.
40. Look through the results for a short "pew" or zap sound - it might not
    be called exactly `laser`, so check the names in the library and click
    the one that sounds right.
41. Click the Code tab.
42. Click the *pink* Sound category in the palette.

    **Did you do the fire-rate fix last week?** Then `Laser` has no
    `when [space v] key pressed` script. In step 43, drop the
    `start sound` block underneath `create clone of [myself v]` inside your
    `forever` loop's `if` instead - same place in the story, different
    script.

43. Drag a `start sound [sound v]` block so it sits underneath
    `create clone of [myself v]`, inside `Laser`'s
    `when [space v] key pressed` script.
44. Click its sound dropdown.
45. Choose the sound you just added.
46. Click the `Asteroid` sprite in the sprite list.
47. Click the Sounds tab.
48. Click the add-sound button at the bottom of the sound list.
49. Click the search box at the top of the sound library.
50. Type `pop`.
51. Look through the results for a short "something got hit" sound - it
    might not be called exactly `pop`, so check the names in the library
    and click the one that sounds right.
52. Click the Code tab.
53. Drag a `start sound [sound v]` block so it sits inside the
    `if <touching [Laser v]?> then` block, underneath
    `change [score v] by (1)` (above `delete this clone`).
54. Click its sound dropdown.
55. Choose the sound you just added.
56. Click the Sounds tab.
57. Click the add-sound button at the bottom of the sound list.
58. Click the search box at the top of the sound library.
59. Type `crash`.
60. Look through the results for a short impact or crash sound - it might
    not be called exactly `crash`, so check the names in the library and
    click the one that sounds right.
61. Click the Code tab.
62. Drag a `start sound [sound v]` block so it sits inside the
    `if <touching [Ship v]?> then` block, underneath
    `change [lives v] by (-1)` (above `delete this clone`).
63. Click its sound dropdown.
64. Choose the sound you just added.
65. Click the `Enemy` sprite in the sprite list.
66. Click the Sounds tab.
67. Click the add-sound button at the bottom of the sound list.
68. Click the search box at the top of the sound library.
69. Type `pop`.
70. Look through the results for the same short "something got hit" sound
    you picked for `Asteroid` a moment ago, and click it.
71. Click the Code tab.
72. Drag a `start sound [sound v]` block so it sits inside the
    `if <touching [Laser v]?> then` block on `Enemy`, underneath
    `change [score v] by (5)`.
73. Click its sound dropdown.
74. Choose the sound you just added.
75. Click the `EnemyLaser` sprite in the sprite list.
76. Click the Sounds tab.
77. Click the add-sound button at the bottom of the sound list.
78. Click the search box at the top of the sound library.
79. Type `crash`.
80. Look through the results for the same crash or impact sound you picked
    for `Asteroid`, and click it.
81. Click the Code tab.
82. Drag a `start sound [sound v]` block so it sits inside the
    `if <touching [Ship v]?> then` block, underneath
    `change [lives v] by (-1)` (above `delete this clone`).
83. Click its sound dropdown.
84. Choose the sound you just added.

**Check it works**
Click the green flag and play. When `lives` reaches 0, the backdrop should
switch to your GAME OVER screen and everything should stop. Click the green
flag again to play a second time - the game should start back on your space
backdrop, not on GAME OVER. You should also hear a sound when you fire, when
an asteroid or the enemy is destroyed, and when your ship gets hit.

**Stuck?**
- No GAME OVER screen appears, but the game does stop - check `stop [all v]`
  isn't sitting *above* `switch backdrop to [game-over v]` on the Stage's
  `when I receive [game over v]` script; it needs to be below it.
- The game doesn't stop at all at 0 lives - first check `Ship` really has
  `broadcast [game over v]` inside the `if <(lives) = (0)> then` block, and
  that its dropdown says `game over`.
- The game still doesn't stop, and you can see the `lives` number shooting
  straight past 0 into -1, -2, -3 - two things hit you in the same instant,
  so `lives` was never sitting exactly on 0 for the `=` block to catch. Fix
  it on `Ship`: drag the `() = ()` block out of the `if` onto the palette to
  delete it, drop an Operators `() < ()` block into the empty hexagon,
  put the `lives` reporter in its left slot, and type `1` in its right slot.
  `if <(lives) < (1)> then` catches 0 *and* anything below it.
- The second play-through starts on the GAME OVER screen even though the
  game is running underneath it - the Stage is missing its own
  `when green flag clicked` / `switch backdrop to [your space backdrop v]`
  script.
- A sound doesn't play, or the dropdown is empty - check that sprite has a
  sound added on its own Sounds tab (each sprite has its own list), and that
  the `start sound` block's dropdown is actually set to it, not left on a
  default.

## Make it yours

- How fast should the enemy move, and how often should it fire? Try
  different numbers in `Enemy`'s two scripts.
- What sounds fit your game? Try different sounds from the sound library for
  the laser, the pop, and the crash.
- What should your GAME OVER screen look like? Go wild in the paint editor -
  colours, extra drawings, a different font from the text tool's options.
- Once you've tried those, check out `reference/extra-challenges.md` for
  more ideas to fill the rest of today's build time.

## Before you log off

Do this every week, and do it now even if you're mid-milestone. A project
that isn't saved doesn't survive the week.

1. Click **File** at the top of the editor.
2. Click **Save now** (in some versions it just says **Save**).
3. Look at the top of the screen for the message saying your project was
   saved.

Didn't see that message, or does it say you're not logged in? Put your hand
up before you close the tab - don't just try again and hope.

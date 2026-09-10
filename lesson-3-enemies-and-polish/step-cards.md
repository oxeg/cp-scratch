# Lesson 3 - Enemies and polish

By the end of today your game will have an enemy ship that shoots back,
will get harder the longer you survive, will have sound effects, and will
show a real GAME OVER screen when you run out of lives. This is the last
lesson - you'll finish with the whole game.

## Milestone 1: An enemy ship

1. Click the add-sprite button in the sprite list panel to open the sprite
   library.
2. Click the search box at the top of the library.
3. Type `alien`.
4. Look through the results for a sprite that looks like an enemy
   spaceship - it might be called something like `Cyclops` or `Ghost`, so
   check the names and pictures in the library and pick one that looks like
   it could shoot at you.
5. Click the sprite's name box in the sprite info panel.
6. Type `Enemy` to rename it.
7. Click the Code tab.
8. Click the *yellow* Events category in the palette.
9. Drag a `when green flag clicked` block into the code area.
10. Click the *purple* Looks category in the palette.
11. Drag a `show` block and snap it underneath `when green flag clicked`.
12. Click the *amber* Control category in the palette.
13. Drag a `forever` block and snap it underneath `show`.
14. Click the *blue* Motion category in the palette.
15. Drag a `go to x: () y: ()` block so it sits inside the `forever` block.
16. Click the x field on that block.
17. Type `-230`.
18. Click the *green* Operators category in the palette.
19. Drag a `pick random () to ()` block into the y number slot on the
    `go to x: () y: ()` block.
20. Click the first field of that `pick random` block.
21. Type `90`.
22. Click the second field of that `pick random` block.
23. Type `150`.
24. Click the Control category in the palette.
25. Drag a `repeat until <>` block so it sits inside the `forever` block,
    underneath `go to x: (-230) y: (pick random (90) to (150))`.
26. Click the Operators category in the palette.
27. Drag an `() > ()` block into the hexagon slot on the `repeat until`
    block.
28. Click the Motion category in the palette.
29. Drag an `x position` block into the left slot of the `>` block.
30. Click the right field of the `>` block.
31. Type `230`.
32. Click the Motion category in the palette.
33. Drag a `change x by ()` block so it sits inside the `repeat until`
    block.
34. Type `4` into its number field.
35. Click the Control category in the palette.
36. Drag an `if <> then` block so it sits inside the `repeat until` block,
    underneath `change x by (4)`.
37. Click the *pale blue* Sensing category in the palette.
38. Drag a `touching [sprite]?` block into the hexagon slot on the new `if`
    block.
39. Click its sprite dropdown.
40. Choose **Laser**.
41. Click the *orange* Variables category in the palette.
42. Drag a `change [variable v] by ()` block so it sits inside the `if`
    block.
43. Click its variable dropdown.
44. Choose **score**.
45. Type `5` into its number field.
46. Click the Sounds tab.
47. Click the add-sound button (a speaker icon) at the bottom of the sound
    list - check the exact spot in your editor, since it can look a little
    different depending on the version.
48. Click the search box at the top of the sound library.
49. Type `pop`.
50. Look through the results for a short "something got hit" sound - it
    might not be called exactly `pop`, so check the names in the library
    and click the one that sounds right.
51. Click the Code tab.
52. Click the *pink* Sound category in the palette.
53. Drag a `start sound [sound v]` block so it sits inside the `if` block,
    underneath `change [score v] by (5)`.
54. Click its sound dropdown.
55. Choose the sound you just added.
56. Right-click the `go to x: (-230) y: (pick random (90) to (150))` block
    (the one snapped underneath `show`) and choose **duplicate**.
57. Drag the duplicate so it sits inside the `if` block, underneath
    `start sound`.

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
      start sound [pop v]
      go to x: (-230) y: (pick random (90) to (150))
```

**Check it works**
Click the green flag. The enemy should appear on the left and glide across
the top of the stage. Shoot it with your laser - it should play a sound,
`score` should go up by 5, and the enemy should jump straight back to the
left edge and start gliding across again.

**Stuck?**
- Nothing appears when you click the green flag - check `show` is snapped
  directly under `when green flag clicked`, and `forever` is snapped under
  `show`.
- The enemy appears but never moves - check `go to x: () y: ()` and
  `repeat until <>` are both inside the `forever` block, not sitting below
  it.
- Shooting the enemy doesn't do anything - check the `touching [Laser v]?`
  block's dropdown really says Laser, and that your laser is actually
  reaching that high up the screen.
- No sound plays when you hit it - go to the Sounds tab and check you have
  a sound added there, then check the `start sound` block's dropdown is set
  to it.

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
should go down by 1.

**Stuck?**
- **enemy fire** doesn't appear in the `when I receive` dropdown - the
  message only exists once you've built the `broadcast [enemy fire v]`
  block on `Enemy` (Milestone 2, steps 13-18). Build that first, then come
  back to `EnemyLaser`.
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

57. Click the `Asteroid` sprite in the sprite list.
58. Click the first field of the `pick random () to ()` block inside the
    `wait () seconds` block on `Asteroid`'s spawner script.
59. Type `0.3` to replace `0.5`.
60. Click the Variables category in the palette.
61. Drag a `spawn gap` reporter block into the second field of that
    `pick random () to ()` block, replacing `1.5`.

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

## Milestone 4: Sound and a proper game over

1. Click the `Laser` sprite in the sprite list.
2. Click the Sounds tab.
3. Click the add-sound button at the bottom of the sound list.
4. Click the search box at the top of the sound library.
5. Type `laser`.
6. Look through the results for a short "pew" or zap sound - it might not
   be called exactly `laser`, so check the names in the library and click
   the one that sounds right.
7. Click the Code tab.
8. Click the Sound category in the palette.
9. Drag a `start sound [sound v]` block so it sits underneath
   `create clone of [myself v]`, inside `Laser`'s
   `when [space v] key pressed` script.
10. Click its sound dropdown.
11. Choose the sound you just added.
12. Click the `Asteroid` sprite in the sprite list.
13. Click the Sounds tab.
14. Click the add-sound button at the bottom of the sound list.
15. Click the search box at the top of the sound library.
16. Type `pop`.
17. Look through the results for the same kind of short "something got hit"
    sound you picked for `Enemy` back in Milestone 1, and click it.
18. Click the Code tab.
19. Drag a `start sound [sound v]` block so it sits inside the
    `if <touching [Laser v]?> then` block, underneath
    `change [score v] by (1)` (above `delete this clone`).
20. Click its sound dropdown.
21. Choose the sound you just added.
22. Click the Sounds tab.
23. Click the add-sound button at the bottom of the sound list.
24. Click the search box at the top of the sound library.
25. Type `crash`.
26. Look through the results for a short impact or crash sound - it might
    not be called exactly `crash`, so check the names in the library and
    click the one that sounds right.
27. Click the Code tab.
28. Drag a `start sound [sound v]` block so it sits inside the
    `if <touching [Ship v]?> then` block, underneath
    `change [lives v] by (-1)` (above `delete this clone`).
29. Click its sound dropdown.
30. Choose the sound you just added.

31. Click the Stage thumbnail, below the stage to the right of the sprite
    list, to select it.
32. Click the Backdrops tab.
33. Right-click the space backdrop's thumbnail in the backdrop list and
    choose **duplicate**.
34. Click the duplicate backdrop's name box.
35. Type `game-over` to rename it.
36. Click the text tool (a "T" icon) in the paint editor's toolbar.
37. Click on the canvas where you want the words to start.
38. Type `GAME OVER`.
39. Click somewhere else on the canvas to finish the text.

40. Click the `Ship` sprite in the sprite list.
41. Find the `if <(lives) = (0)> then` block at the bottom of `Ship`'s
    `forever` loop - the one you built in Lesson 2 - and drag the
    `stop [all v]` block out of it and onto the palette, to delete it.
42. Click the Events category in the palette.
43. Drag a `broadcast [message v]` block so it sits inside the same
    `if <(lives) = (0)> then` block, where `stop [all v]` used to be.
44. Click the broadcast block's dropdown.
45. Click **New message**.
46. Type `game over`.
47. Click **OK**.

`Ship`'s `if` block at the bottom of `forever` should now look like this:

```
  if <(lives) = (0)> then
    broadcast [game over v]
```

48. Click the Stage thumbnail to select it.
49. Click the Code tab.
50. Click the Events category in the palette.
51. Drag a `when I receive [message v]` block into the code area.
52. Click its dropdown.
53. Choose **game over**.
54. Click the Looks category in the palette.
55. Drag a `switch backdrop to [backdrop v]` block and snap it underneath
    `when I receive [game over v]`.
56. Click its backdrop dropdown.
57. Choose **game-over**.
58. Click the Control category in the palette.
59. Drag a `stop [all v]` block and snap it underneath
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

60. Click the Events category in the palette.
61. Drag a `when green flag clicked` block into an empty spot in the code
    area - a new script on the Stage.
62. Click the Looks category in the palette.
63. Drag a `switch backdrop to [backdrop v]` block and snap it underneath
    the new `when green flag clicked` block.
64. Click its backdrop dropdown.
65. Choose your original space backdrop - the one you added back in Lesson
    1. There are only two backdrops in the list by now, so just pick
    whichever one isn't `game-over`.

The Stage's second script should now look like this:

```
when green flag clicked
switch backdrop to [your space backdrop v]
```

**Check it works**
Click the green flag and play. You should hear a sound when you fire, when
an asteroid is destroyed, and when your ship gets hit. When `lives` reaches
0, the backdrop should switch to your GAME OVER screen and everything
should stop. Click the green flag again to play a second time - the game
should start back on your space backdrop, not on GAME OVER.

**Stuck?**
- No GAME OVER screen appears, but the game does stop - check `stop [all v]`
  isn't sitting *above* `switch backdrop to [game-over v]` on the Stage's
  `when I receive [game over v]` script; it needs to be below it.
- The game doesn't stop at all at 0 lives - check you replaced
  `stop [all v]` on `Ship` with `broadcast [game over v]` inside the
  existing `if <(lives) = (0)> then` block, rather than leaving the old
  block in place alongside a new one.
- The second play-through starts on the GAME OVER screen even though the
  game is running underneath it - the Stage is missing its own
  `when green flag clicked` / `switch backdrop to [your space backdrop v]`
  script.
- A sound doesn't play - check the sprite has a sound added on its Sounds
  tab, and that the `start sound` block's dropdown is actually set to it,
  not left on a default.

## Make it yours

- How fast should the enemy move, and how often should it fire? Try
  different numbers in `Enemy`'s two scripts.
- What sounds fit your game? Try different sounds from the sound library for
  the laser, the pop, and the crash.
- What should your GAME OVER screen look like? Go wild in the paint editor -
  colours, extra drawings, a different font from the text tool's options.
- Once you've tried those, check out `reference/extra-challenges.md` for
  more ideas to fill the rest of today's build time.

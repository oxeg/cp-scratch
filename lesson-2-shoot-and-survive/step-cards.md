# Lesson 2 - Shoot and survive

By the end of today you'll be shooting lasers, dodging falling asteroids,
racking up a score, and losing lives when you get hit - with a game over
when you run out.

**Words used in these cards**

- **Palette** - the panel of coloured block categories down the left, the
  one you drag blocks *out of*.
- **Code area** - the big middle panel, the one you drop blocks *into* to
  build a script.
- **Reporter block** - a small oval block with a name on it, like `lives` or
  `y position`. It stands for a number. You drop a reporter *into a slot* on
  another block, instead of snapping it underneath one.

## Milestone 1: Shoot lasers

First you'll open last week's project and draw your own laser bolt, then
build the scripts that let you fire it.

1. Go to scratch.mit.edu.
2. Log in.
3. Click your `Space Shooter` project from last week to open it.
4. Click **See inside** to open the editor.
5. Click the paint-new-sprite button (a paintbrush icon) at the bottom of
   the sprite list, next to the sprite-library button - check the exact spot
   in your editor, since it can look a little different depending on the
   version.
6. Click the new sprite's name box in the sprite info panel.
7. Type `Laser` to rename it.
8. In the paint editor, click a bright colour swatch to pick a colour for
   your laser.
9. Click the rectangle tool in the paint editor's toolbar.
10. Draw a small, thin rectangle right on top of the crosshair (the little +
    mark in the middle of the canvas) - just a few pixels wide and about 15
    tall. Keep it small and centred on the crosshair: a laser that's too big
    or off to one side causes problems later.
11. Click the Code tab.
12. Click the *yellow* Events category in the palette.
13. Drag a `when green flag clicked` block into the code area.
14. Click the *purple* Looks category in the palette.
15. Drag a `hide` block and snap it underneath `when green flag clicked`.
16. Click the Events category in the palette.
17. Drag a `when [key] key pressed` block into an empty spot in the code
    area.
18. Click its key dropdown.
19. Choose **space**.
20. Click the *amber* Control category in the palette.
21. Drag a `create clone of [myself v]` block and snap it underneath
    `when [space v] key pressed`.
22. Drag a `when I start as a clone` block into an empty spot in the code
    area.
23. Click the *blue* Motion category in the palette.
24. Drag a `go to [sprite]` block and snap it underneath
    `when I start as a clone`.
25. Click its sprite dropdown.
26. Choose **Ship**.
27. Click the Looks category in the palette.
28. Drag a `show` block and snap it underneath `go to [Ship v]`.
29. Click the Control category in the palette.
30. Drag a `repeat until <>` block and snap it underneath `show`.
31. Click the *green* Operators category in the palette.
32. Drag a `() > ()` block into the hexagon slot on the `repeat until` block.
33. Click the Motion category in the palette.
34. Drag a `y position` block into the left slot of the `>` block.
35. Click the right field of the `>` block.
36. Type `170`.
37. Click the Motion category in the palette.
38. Drag a `change y by ()` block so it sits inside the `repeat until` block.
39. Type `12` into its number field.
40. Click the Control category in the palette.
41. Drag a `delete this clone` block and snap it underneath the
    `repeat until` block itself (below it, not inside it).

Your three scripts should now look like this:

```
when green flag clicked
hide
```

```
when [space v] key pressed
create clone of [myself v]
```

```
when I start as a clone
go to [Ship v]
show
repeat until <(y position) > (170)>
  change y by (12)
delete this clone
```

**Check it works**
Click the green flag, then press the space bar. A small bolt should shoot up
from the ship and disappear once it reaches the top of the stage. Press
space a few more times - each press fires a new bolt. Your game is playable
right now: you can fly around and shoot into space, even though there's
nothing to hit yet.

**Stuck?**
- Nothing happens when you press space - check the
  `create clone of [myself v]` block is snapped underneath
  `when [space v] key pressed`, and check `when I start as a clone` has its
  own three blocks snapped together underneath it.
- A laser-shaped shape sits stuck in the middle of the stage the moment you
  click the green flag - you forgot the `hide` block on the
  `when green flag clicked` script.
- The bolt flies up crooked - off at an angle, or drifting sideways instead
  of straight up. Your scripts are fine; it's the drawing. Go to the
  `Laser` sprite's Costumes tab and drag your rectangle so the little +
  crosshair sits right in the middle of it.
- Lasers keep firing forever and never disappear, and the game gets slower
  the longer you play - check `delete this clone` is snapped underneath
  `repeat until`, not missing or stuck somewhere else.
- Holding space down fires one shot, then pauses, then rattles off several
  quickly - that's normal for now, not a mistake. See Make it yours if you
  want to fix it.

## Milestone 2: Asteroids fall

Now add asteroids that fall from the top of the screen.

1. Click the add-sprite button in the sprite list panel to open the sprite
   library.
2. Click the search box at the top of the library.
3. Type `rock`.
4. Look through the results for a sprite that looks like a rock or an
   asteroid - it might be called something like `Rocks` or `Meteor`, so
   check the names in the library and click the one that looks right.
5. Click the sprite's name box in the sprite info panel.
6. Type `Asteroid` to rename it.
7. Change the size field in the sprite info panel to about `50`.
8. Click the Code tab.
9. Click the Events category in the palette.
10. Drag a `when green flag clicked` block into the code area.
11. Click the Looks category in the palette.
12. Drag a `hide` block and snap it underneath `when green flag clicked`.
13. Click the Control category in the palette.
14. Drag a `forever` block and snap it underneath `hide`.
15. Drag a `wait () seconds` block so it sits inside the `forever` block.
16. Click the Operators category in the palette.
17. Drag a `pick random () to ()` block into the `wait` block's number slot.
18. Click the first field of that `pick random` block.
19. Type `0.5`.
20. Click the second field of that `pick random` block.
21. Type `1.5`.
22. Click the Control category in the palette.
23. Drag a `create clone of [myself v]` block so it sits inside the
    `forever` block, underneath `wait`.
24. Drag a `when I start as a clone` block into an empty spot in the code
    area.
25. Click the Motion category in the palette.
26. Drag a `go to x: () y: ()` block and snap it underneath
    `when I start as a clone`.
27. Click the Operators category in the palette.
28. Drag a `pick random () to ()` block into the x number slot on the
    `go to x: () y: ()` block.
29. Click the first field of that `pick random` block.
30. Type `-220`.
31. Click the second field of that `pick random` block.
32. Type `220`.
33. Click the y number field on the `go to x: () y: ()` block.
34. Type `180`.
35. Click the Looks category in the palette.
36. Drag a `show` block and snap it underneath `go to x: () y: ()`.
37. Click the Control category in the palette.
38. Drag a `repeat until <>` block and snap it underneath `show`.
39. Click the Operators category in the palette.
40. Drag a `() < ()` block into the hexagon slot on the `repeat until` block.
41. Click the Motion category in the palette.
42. Drag a `y position` block into the left slot of the `<` block.
43. Click the right field of the `<` block.
44. Type `-175`.
45. Click the Motion category in the palette.
46. Drag a `change y by ()` block so it sits inside the `repeat until` block.
47. Type `-6` into its number field.
48. Click the Control category in the palette.
49. Drag a `delete this clone` block and snap it underneath the
    `repeat until` block itself (below it, not inside it).

Your two scripts should now look like this:

```
when green flag clicked
hide
forever
  wait (pick random (0.5) to (1.5)) seconds
  create clone of [myself v]
```

```
when I start as a clone
go to x: (pick random (-220) to (220)) y: (180)
show
repeat until <(y position) < (-175)>
  change y by (-6)
delete this clone
```

**Check it works**
Click the green flag. Asteroids should start appearing at random spots
across the whole width of the top of the stage, and fall off the bottom of
the screen. Your game is playable right now: you can fly around and dodge
falling asteroids, and shoot into space - even though shooting doesn't
destroy them yet.

**Stuck?**
- Nothing rock-like turns up in the search results - search for `ball`
  instead and click a plain round ball sprite (it might be called something
  like `Ball`, so check the names in the library and pick the round one).
  You'll recolour it to look like a rock in the Costumes tab using the fill
  tool.
- Nothing falls - check `create clone of [myself v]` is snapped inside the
  `forever` block on the spawner script, and check `when I start as a clone`
  has its own blocks snapped together underneath it.
- An asteroid sits stuck in the middle of the stage the moment you click the
  green flag - you forgot the `hide` block on the `when green flag clicked`
  script.
- Asteroids only ever appear in one spot instead of spreading across the top
  - check the `pick random` block's two fields say `-220` and `220`, not the
  same number or swapped.
- Asteroids keep falling forever, or the game gets slower and slower the
  longer you play - check `delete this clone` is snapped underneath
  `repeat until`, not missing.

## Milestone 3: Score points

Now make asteroids disappear when you shoot them, and keep score.

1. Click the `Ship` sprite in the sprite list to select it.
2. Click the *orange* Variables category in the palette.
3. Click the "Make a Variable" button.
4. Click the name field in the "New Variable" dialog box.
5. Type `score`.
6. Click "For all sprites" if it isn't already selected (it should be the
   default).
7. Click OK.
8. Drag a `set [variable v] to ()` block and snap it in between
   `when green flag clicked` and `go to x: (0) y: (-120)`, so it sits right
   under the hat block.
9. Click its variable dropdown.
10. Choose **score**.
11. Click its number field.
12. Type `0`.

`Ship`'s script should now start like this:

```
when green flag clicked
set [score v] to (0)
go to x: (0) y: (-120)
forever
  if <key [right arrow v] pressed?> then
    change x by (5)
  if <key [left arrow v] pressed?> then
    change x by (-5)
  if <key [up arrow v] pressed?> then
    change y by (5)
  if <key [down arrow v] pressed?> then
    change y by (-5)
```

13. Click the `Asteroid` sprite in the sprite list to select it.
14. Click the Control category in the palette.
15. Drag an `if <> then` block so it sits inside the `repeat until` block,
    underneath `change y by (-6)`.
16. Click the *pale blue* Sensing category in the palette.
17. Drag a `touching [sprite]?` block into the hexagon slot on the new `if`
    block.
18. Click its sprite dropdown.
19. Choose **Laser**.
20. Click the Variables category in the palette.
21. Drag a `change [variable v] by ()` block so it sits inside the new `if`
    block.
22. Click its variable dropdown.
23. Choose **score**.
24. Type `1` into its number field.
25. Click the Control category in the palette.
26. Drag a `delete this clone` block so it sits inside the new `if` block,
    underneath `change [score v] by (1)`.

`Asteroid`'s clone script should now look like this:

```
when I start as a clone
go to x: (pick random (-220) to (220)) y: (180)
show
repeat until <(y position) < (-175)>
  change y by (-6)
  if <touching [Laser v]?> then
    change [score v] by (1)
    delete this clone
delete this clone
```

**Check it works**
Click the green flag. Shoot a laser at a falling asteroid - the asteroid
should vanish, and the `score` number in the top-left corner of the stage
should go up by 1. Your game is playable right now, and this is the floor
everyone should reach today: fly, shoot, dodge, and watch your score climb.

**Stuck?**
- Score doesn't go up when you hit an asteroid - check `score` was made
  "For all sprites", not "For this sprite only". If it's wrong, right-click
  `score` in the palette, delete it, and make it again with the right option
  chosen.
- Shooting doesn't seem to destroy an asteroid even when the laser looks
  like it's touching it - go to the `Laser` sprite's Costumes tab and check
  the bolt isn't drawn too big or off to one side.
- Score doesn't start at 0, or resets oddly - check `set [score v] to (0)`
  is snapped directly under `when green flag clicked` on `Ship`, before
  `go to x: (0) y: (-120)`.

## Milestone 4: Lives and game over

Finally, give the ship lives, and end the game when they run out.

1. Click the `Ship` sprite in the sprite list to select it, if it isn't
   already selected.
2. Click the Variables category in the palette.
3. Click the "Make a Variable" button.
4. Click the name field in the "New Variable" dialog box.
5. Type `lives`.
6. Click "For all sprites" if it isn't already selected.
7. Click OK.
8. Drag a `set [variable v] to ()` block and snap it in between
   `set [score v] to (0)` and `go to x: (0) y: (-120)`, so it sits right
   under `set score to 0`.
9. Click its variable dropdown.
10. Choose **lives**.
11. Click its number field.
12. Type `3`.
13. Click the Control category in the palette.
14. Drag an `if <> then` block and snap it inside the `forever` block,
    underneath the fourth `if` block (the down-arrow one) - so it's the last
    block inside `forever`.
15. Click the Operators category in the palette.
16. Drag an `() = ()` block into the hexagon slot on the new `if` block.
17. Click the Variables category in the palette.
18. Drag a `lives` reporter block into the left slot of the `=` block.
19. Click the right field of the `=` block.
20. Type `0`.
21. Click the Control category in the palette.
22. Drag a `stop [all v]` block so it sits inside the new `if` block.

`Ship`'s script should now look like this:

```
when green flag clicked
set [score v] to (0)
set [lives v] to (3)
go to x: (0) y: (-120)
forever
  if <key [right arrow v] pressed?> then
    change x by (5)
  if <key [left arrow v] pressed?> then
    change x by (-5)
  if <key [up arrow v] pressed?> then
    change y by (5)
  if <key [down arrow v] pressed?> then
    change y by (-5)
  if <(lives) = (0)> then
    stop [all v]
```

23. Click the `Asteroid` sprite in the sprite list to select it.
24. Click the Control category in the palette.
25. Drag an `if <> then` block so it sits inside the `repeat until` block,
    underneath the `if <touching [Laser v]?> then` block - still inside
    `repeat until`, not inside that first `if`.
26. Click the Sensing category in the palette.
27. Drag a `touching [sprite]?` block into the hexagon slot on the new `if`
    block.
28. Click its sprite dropdown.
29. Choose **Ship**.
30. Click the Variables category in the palette.
31. Drag a `change [variable v] by ()` block so it sits inside the new `if`
    block.
32. Click its variable dropdown.
33. Choose **lives**.
34. Type `-1` into its number field.
35. Click the Control category in the palette.
36. Drag a `delete this clone` block so it sits inside the new `if` block,
    underneath `change [lives v] by (-1)`.

`Asteroid`'s clone script should now look like this:

```
when I start as a clone
go to x: (pick random (-220) to (220)) y: (180)
show
repeat until <(y position) < (-175)>
  change y by (-6)
  if <touching [Laser v]?> then
    change [score v] by (1)
    delete this clone
  if <touching [Ship v]?> then
    change [lives v] by (-1)
    delete this clone
delete this clone
```

**Check it works**
Click the green flag and play. Each time an asteroid touches your ship,
`lives` should drop by 1 - and the whole game should stop dead, ship,
scripts, everything, the moment `lives` reaches 0. Your game is playable
right now, and it's the full core game: fly, shoot, dodge, score, and
survive as long as you can. It just stops bluntly rather than showing a nice
game-over screen - that's on purpose, and next week you'll get the chance to
turn it into a real GAME OVER screen.

**Stuck?**
- `lives` doesn't go down when an asteroid hits you - check `lives` was made
  "For all sprites", the same fix as for `score` in Milestone 3.
- The game never stops even at 0 lives - check the
  `if <(lives) = (0)> then` / `stop [all v]` block is snapped inside the
  `forever` block on `Ship`, underneath the four arrow-key `if` blocks, not
  sitting below `forever` on its own.
- The game still never stops, and you can see the `lives` number shooting
  straight past 0 into -1, -2, -3 - two asteroids hit you in the same
  instant, so `lives` was never sitting exactly on 0 for the `=` block to
  catch. Change the `=` block to a `<` block and the `0` to a `1`:
  `if <(lives) < (1)> then` catches 0 *and* anything below it. Drag the
  `() = ()` block out onto the palette to delete it, drop an Operators
  `() < ()` block into the empty hexagon, put the `lives` reporter block in
  its left slot, and type `1` in its right slot.
- The game stops the moment you click the green flag - check
  `set [lives v] to (3)` really says `3`, and check the `=` block compares
  `lives` to `0`, not some other number.

## Make it yours

- What colour and size should your laser be? Try redrawing it in the
  Costumes tab.
- How fast should your laser fire? If you want a steadier rate instead of
  the key-repeat rattle, work through the **Fix the fire rate** challenge in
  `reference/extra-challenges.md` - it gives you the hint, you do the
  building.
- How often should asteroids appear? Try different numbers in the
  `pick random () to ()` block inside `Asteroid`'s `wait () seconds` block.
- How fast should asteroids fall? Try a different number in the
  `change y by ()` block on the asteroid's clone script.
- Can you give `Asteroid` a second costume in the Costumes tab, and make new
  clones pick one at random?

## Before you log off

Do this every week, and do it now even if you're mid-milestone. Next week's
cards start by opening this project again - a project that isn't saved
doesn't survive the week.

1. Click **File** at the top of the editor.
2. Click **Save now** (in some versions it just says **Save**).
3. Look at the top of the screen for the message saying your project was
   saved.

Didn't see that message, or does it say you're not logged in? Put your hand
up before you close the tab - don't just try again and hope.

# Lesson 3 - Golden cookies

By the end of today a golden cookie will pop up somewhere on your stage
every so often, sit there for five seconds and vanish. Click it in time and
everything you earn doubles for ten seconds - your clicks and the cookies
your shop bakes for you.

**Words used in these cards**

- **Palette** - the panel of coloured block categories down the left, the
  one you drag blocks *out of*.
- **Code area** - the big middle panel, the one you drop blocks *into* to
  build a script.
- **Oval** - a small rounded block with a variable's name on it, like
  `(cookies)`. You don't snap an oval under another block. You drop it
  *into a slot* on a block, like the empty holes in `() > ()`.
- **Mouth** - the C-shaped gap inside a block like `if <> then` or
  `forever`. Blocks put in the mouth are *inside* that block. With an
  `if <> then`, blocks snapped under the whole thing are outside it, and
  that is a different thing entirely. A `forever` works differently: look
  at its bottom edge and you'll see it has no bump, so **nothing can be
  attached under a `forever` at all.** It is always the last block in its
  script.
- **Undo** - Ctrl+Z (Cmd+Z on a Mac) takes back the last thing you did, in
  the code area and in the paint editor alike. The paint editor has an undo
  arrow above the canvas as well. Check the exact spot in your editor, since
  it can look a little different depending on the version.
- **Show and hide** - two buttons in the sprite info panel, the strip above
  the sprite list: an open eye, and an eye with a line through it. They do
  by hand what the `show` and `hide` blocks do while the game runs. You
  need them today because being hidden *sticks*: once a sprite has hidden
  itself it stays hidden, the green flag will not bring it back, and you
  can't click a sprite you can't see. If a sprite disappears off the stage
  and won't come back, click it in the sprite list and click the open eye.
  Check the exact spot in your editor, since it can look a little different
  depending on the version.
- **Clone** - a copy of a sprite that the game makes for itself while it's
  running, out of nothing, as many times as you ask. A clone is not a new
  sprite in the sprite list and you can't see it in the editor. It has its
  own position, its own size and its own scripts, and when it's finished
  with it deletes itself and it's gone. Every golden cookie you see today
  is a clone.

## Milestone 1: Golden cookies appear

1. Go to scratch.mit.edu.
2. Log in with the same account you used last week.
3. Click your username at the top right of the page.
4. Click **My Stuff** in the menu that drops down. Check the exact spot in
   your editor, since it can look a little different depending on the
   version.
5. Click **See inside** on your `Cookie Clicker` project.
6. Click the green flag above the stage.
7. Click your cookie on the stage five or six times and watch the number
   climb - that's last week's work, still working.

**Stop here and look at the sprite list under the stage.**

**Is one of the sprites in it called `Special Cookie`?**

- **Yes, it's there** - you built it two weeks ago. **Skip steps 8 to 17**
  and go straight to step 18.
- **No, it isn't** - **do steps 8 to 17 now.** They build one, and they
  take about two minutes. Then carry on at step 18 with everybody else.

8. Right-click the `Cookie` sprite's thumbnail in the sprite list.
9. Choose **Duplicate**. A copy called `Cookie2` appears, with copies of all
   of `Cookie`'s scripts already inside it.
10. Click `Cookie2` in the sprite list to select it.
11. Click the sprite's name box in the sprite info panel above the sprite
    list.
12. Type `Special Cookie` to rename it.
13. Click the **Size** field in the sprite info panel.
14. Type `50` into it.
15. Drag the copied `when green flag clicked` block that has
    `set [cookies v] to (0)` under it onto the palette to delete it.
    Dragging a block takes everything below it along too, so that whole
    script goes in one drag. You only want one sprite resetting the score.
16. Drag the other copied `when green flag clicked` block - the one with the
    `forever` under it - onto the palette. That script goes the same way,
    all in one drag. You only want one sprite baking cookies in the
    background.
17. Drag the copied `start sound` block onto the palette. The three blocks
    below it come along in the same drag, so all four go at once. The squash
    blocks *have* to go: `set size to (110) %` means "be exactly 110%", so
    on a cookie shrunk to 50 every click would blow it up to 110.

**Everybody, from here on.** Your `Special Cookie` has a click script in it,
and it looks like this:

```
when this sprite clicked
change [cookies v] by (10)
```

Yours might say a different number, and that's fine - Milestone 2 throws
this whole script away and builds a better one.

If you built this sprite two weeks ago, there might be a spare
`when green flag clicked` script sitting there as well, with
`set [cookies v] to (0)` under it. That one is harmless - leave it alone.

If you built this sprite just now, in steps 8 to 17, it is different: there
should be **no** green-flag script left at all. If you can still see one with
a `forever` in it, step 16 didn't take, and left there it will quietly bake
you double cookies all game. Drag its `when green flag clicked` block onto
the palette before you carry on.

First, let's make the cookie look worth chasing.

18. Click `Special Cookie` in the sprite list.
19. Click the **Costumes** tab at the top left of the editor.
20. Click the **Fill** tool in the toolbar down the left of the canvas - the
    one shaped like a tipping paint bucket. Check the exact spot in your
    editor, since it can look a little different depending on the version.
21. Click the **Fill** colour swatch above the canvas to open the colour
    sliders.
22. Drag the **Color** slider to the yellow part of the strip.
23. Drag the **Brightness** slider up until the swatch looks like gold.
24. Click a part of the big circle that hasn't got a chocolate chip on it.
    The whole circle turns gold.
25. Click the **Code** tab.

Now the two scripts. The first one is the one that hides the real sprite and
makes clones of it for ever.

26. Click the *yellow* Events category in the palette.
27. Drag a `when green flag clicked` block into an empty spot in the code
    area, well away from anything that's already in there.
28. Click the *purple* Looks category in the palette.
29. Drag a `hide` block and snap it underneath the new
    `when green flag clicked` block.
30. Click the *amber* Control category in the palette.
31. Drag a `forever` block and snap it underneath the `hide` block.
32. Drag a `wait () seconds` block into the mouth of the `forever` block.
33. Click the *green* Operators category in the palette.
34. Drag a `pick random () to ()` block into the number slot of the
    `wait` block.
35. Click the **left** slot of the `pick random` block.
36. Type `15` into it.
37. Click the **right** slot of the `pick random` block.
38. Type `30` into it.
39. Click the Control category in the palette.
40. Drag a `create clone of [ v]` block and snap it underneath the
    `wait (pick random (15) to (30)) seconds` block, still inside the mouth
    of the `forever`.
41. Look at the dropdown on that block. It should say **myself**.

That script should now look like this:

```
when green flag clicked
hide
forever
  wait (pick random (15) to (30)) seconds
  create clone of [myself v]
```

The real `Special Cookie` hides at the green flag and stays hidden for the
whole game. You never see it again. What you see is the clones it makes, and
a clone starts out exactly as hidden as the sprite it came from - so the
next script has to tell each clone where to go and to show itself.

**Try this before you go any further.** Press the green flag. The small gold
cookie should disappear from the stage the moment you do, and stay gone.
That's your `hide` block working, and it's the only part of this script you
can see from the outside - the clones are being made, but nothing has told
them to show themselves yet, so they arrive invisible. Your big cookie
should still be sitting there, exactly as it was. If the gold cookie is
still there after the green flag, or the big one has gone, read the first
two things in the `Stuck?` box at the end of this milestone before you build
the next script.

42. Drag a `when I start as a clone` block into another empty spot in the
    code area.
43. Click the *blue* Motion category in the palette.
44. Drag a `go to x: () y: ()` block and snap it underneath
    `when I start as a clone`.
45. Click the Operators category in the palette.
46. Drag a `pick random () to ()` block into the **x** slot of the
    `go to x: () y: ()` block.
47. Click the **left** slot of that `pick random` block.
48. Type `-200` into it.
49. Click the **right** slot of that `pick random` block.
50. Type `200` into it.
51. Drag another `pick random () to ()` block into the **y** slot of the
    `go to x: () y: ()` block.
52. Click the **left** slot of that new `pick random` block.
53. Type `-120` into it.
54. Click the **right** slot of that new `pick random` block.
55. Type `140` into it.
56. Click the Looks category in the palette.
57. Drag a `show` block and snap it underneath the `go to x: () y: ()`
    block.
58. Click the Control category in the palette.
59. Drag a `wait () seconds` block and snap it underneath the `show` block.
60. Click that block's number field.
61. Type `5` into it.
62. Drag a `delete this clone` block and snap it underneath the
    `wait (5) seconds` block.

Your second script should look like this:

```
when I start as a clone
go to x: (pick random (-200) to (200)) y: (pick random (-120) to (140))
show
wait (5) seconds
delete this clone
```

Every clone script ends with `delete this clone`. A clone that never deletes
itself hangs about on the stage for the rest of the game, and Scratch will
only let you have so many at once before it stops making new ones.

**Check it works**
Press the green flag and keep clicking the big cookie. Within half a minute
a golden cookie pops up somewhere on the stage, sits there, and disappears
about five seconds later. Half a minute is a long time to wait when you're
testing, so test it the quick way instead: click the `15` in the
`pick random` block and type `2`, click the `30` and type `4`, then press
the green flag. Golden cookies now come every few seconds. Put `15` and `30`
back when you've seen enough.

**Stuck?**
- A small gold cookie is sitting on the stage and won't go away - if you
  haven't pressed the green flag since you built the script, press it now.
  `hide` only runs when the green flag runs it. If it's still sitting there
  after the green flag, the `hide` block isn't in that script. It has to sit
  between `when green flag clicked` and the `forever`.
- The gold cookie is still sitting there after the green flag *and* your big
  cookie has vanished - the script went onto the wrong sprite. It's on
  `Cookie`, so `Cookie` is the one hiding itself, and the real
  `Special Cookie` was never told to hide at all. Click `Cookie` in the
  sprite list and find the script you built in steps 26 to 41, the one with
  `hide` and the `forever` in it. Drag its `when green flag clicked` block
  onto the palette - everything below it comes along in the same drag, so
  the whole script goes at once and the scripts `Cookie` already had are
  left alone. **Deleting the script does not bring your big cookie back.**
  The `hide` already happened, and a hidden sprite stays hidden - the green
  flag won't show it again, and while it's hidden you can't click it
  either, so the whole game is dead until you fix this. With `Cookie` still
  selected in the sprite list, click the **show** button in the sprite info
  panel - the open eye, next to the eye with a line through it - and your
  big cookie comes back on the stage. Check the exact spot in your editor,
  since it can look a little different depending on the version. Then click
  `Special Cookie` in the sprite list and do steps 26 to 41 again there.
- No golden cookie ever appears, however long you wait - three things to
  check, in this order. First, the `show` block: if it's missing from the
  `when I start as a clone` script, every clone is made invisible and stays
  invisible. Second, the two numbers in the `pick random` inside the `wait`:
  one extra digit turns 15 seconds into 150. Third, the dropdown on the
  `create clone of` block: if it says a sprite's name instead of **myself**,
  it's cloning the wrong thing.
- Golden cookies flood the whole stage the instant you press the green flag
  - the `wait` block isn't in the mouth of the `forever`. It can't be
  *below* the `forever` - nothing can be - so look between the `forever` and
  the `hide` above it. Up there it waits once and then the loop runs flat
  out for the rest of the game. Putting it right takes three drags, and they
  have to be in this order, because dragging a block always brings everything
  below it along. **One:** drag the `forever` block away to an empty spot -
  the `create clone of [myself v]` block travels inside its mouth, which is
  what you want. **Two:** drag the `wait` block - it's the bottom block of
  what's left, so nothing comes along with it - into the mouth of the
  `forever`, above the `create clone of [myself v]` block.
  **Three:** snap the `forever` back underneath the `hide` block.
- A golden cookie appears and then never leaves - the `delete this clone`
  block is missing from the bottom of the `when I start as a clone` script.
  Drag one on and snap it under the `wait (5) seconds` block.
- Golden cookies always turn up in exactly the same place, or always in the
  same up-and-down line - one of the two `pick random` blocks didn't make it
  into the `go to x: () y: ()` block. If there's a `pick random` lying loose
  in the code area, that's the one: it landed beside the slot instead of in
  it. Drag it right onto the slot and wait for the slot to light up before
  you let go.
- Nothing happened when you clicked the cookie on the canvas - the paint
  bucket isn't the tool that's selected. Click the **Fill** tool in the
  toolbar down the left of the canvas, then click the cookie again.
- One chocolate chip turned gold instead of the cookie - the paint bucket
  fills whichever shape you click on. Undo it, then click a part of the big
  circle with no chip on it.
- You did steps 8 to 17 and dragged the wrong script onto the palette -
  undo it and try again.
- You did steps 8 to 17 and your copy has only one `when green flag clicked`
  script in it, not two - that's fine. It means you didn't get as far as the
  `forever` loop last week. Do step 15 and skip step 16.
- **The `hide` sitting inside the `forever` instead of above it is one you
  can't spot by playing** - your game behaves exactly the same either way,
  because the golden cookie you see is a clone and the clone shows itself.
  So check it on purpose: `hide` should be lined up directly under
  `when green flag clicked`, not indented inside the `forever`'s mouth. If
  it's indented, it takes three drags to put right, in this order, because
  dragging a block always brings everything below it along. **One:** drag the
  `wait` block out of the `forever`'s mouth and drop it in an empty spot -
  the `create clone of [myself v]` block comes with it, which is fine.
  **Two:** drag the `hide` block, which is on its own in the mouth now, out
  and snap it in between `when green flag clicked` and the `forever`.
  **Three:** drag the loose `wait` block back into the mouth of the
  `forever`.

## Milestone 2: Click one for a sugar rush

A **broadcast** is a shout. One sprite shouts a message, and every sprite in
the project - and every clone - hears it at once. It's how one sprite makes
something happen in another sprite, which is exactly what you need here: the
golden cookie is clicked, and the big `Cookie` has to react.

1. Click `Special Cookie` in the sprite list.
2. Drag its `when this sprite clicked` block onto the palette to delete it.
   The `change [cookies v] by ()` block underneath comes along in the same
   drag, so the whole old script goes at once.
3. Click the Events category in the palette.
4. Drag a `when this sprite clicked` block into the space the old script
   left behind.
5. Drag a `broadcast [ v]` block and snap it underneath
   `when this sprite clicked`.
6. Click the dropdown on the `broadcast` block.
7. Choose **New message**.
8. Type `sugar rush` into the box - two words, all in small letters, with
   one space in the middle.
9. Click **OK**.
10. Click the Control category in the palette.
11. Drag a `delete this clone` block and snap it underneath the
    `broadcast [sugar rush v]` block.

`Special Cookie`'s only script should now look like this:

```
when this sprite clicked
broadcast [sugar rush v]
delete this clone
```

**Try this before you go any further.** Press the green flag, wait for a
golden cookie and click it. It should vanish the moment you click it. It
doesn't do anything else yet - nothing is listening to the shout - but it
should vanish. If it doesn't, read the first thing in the `Stuck?` box at
the end of this milestone and put your hand up, because everybody else will
have the same problem.

Now the sprite that listens. That's `Cookie`.

12. Click `Cookie` in the sprite list.
13. Click the *orange* Variables category in the palette.
14. Click **Make a Variable** at the top of the palette.
15. Type `bonus` into the box, all in small letters.
16. Click **OK**, leaving **For all sprites** chosen.
17. Find the green-flag script that sets `cookies` to 0 - not the one with
    the `forever` in it, and not the click script.
18. Drag a `set [ v] to (0)` block and snap it underneath the last `set`
    block in that script.
19. Click the dropdown on the new `set` block.
20. Choose **bonus**.
21. Click that block's number field.
22. Type `1` into it. **This one matters.** A `set` block arrives from the
    palette saying `0`. Left at `0`, nothing in your game counts at all when
    it starts - and it stays that way until the first golden cookie you
    click, which quietly puts it right. A bug that fixes itself while you're
    looking for it is a horrible one to hunt, so get this number right now.

That script should now look like this:

```
when green flag clicked
set [cookies v] to (0)
set [per second v] to (0)
set [grandma cost v] to (50)
set [bonus v] to (1)
```

If you built the Baker last week there'll be a
`set [baker cost v] to (500)` block in there too, just above the new one.
That's right - leave it alone. `bonus` starts at 1 because 1 is the number
that changes nothing: multiply anything by 1 and you get what you started
with. That's what "no rush happening" means.

23. Click the Events category in the palette.
24. Drag a `when I receive [ v]` block into an empty spot in the code area,
    well away from every script that's already there.
25. Click the dropdown on that block.
26. Choose **sugar rush**.
27. Click the Variables category in the palette.
28. Drag a `set [ v] to (0)` block and snap it underneath
    `when I receive [sugar rush v]`.
29. Click the dropdown on that `set` block.
30. Choose **bonus**.
31. Click that block's number field.
32. Type `2` into it.
33. Click the Control category in the palette.
34. Drag a `wait () seconds` block and snap it underneath the
    `set [bonus v] to (2)` block.
35. Click that block's number field.
36. Type `10` into it.
37. Click the Variables category in the palette.
38. Drag a `set [ v] to (0)` block and snap it underneath the
    `wait (10) seconds` block.
39. Click the dropdown on that `set` block.
40. Choose **bonus**.
41. Click that block's number field.
42. Type `1` into it. **This one matters.** A `set` block arrives from the
    palette saying `0`, and a `bonus` of 0 makes every cookie you click
    worth nothing at all.

Your new script should look like this:

```
when I receive [sugar rush v]
set [bonus v] to (2)
wait (10) seconds
set [bonus v] to (1)
```

`bonus` is now 2 for ten seconds after every golden cookie. Nothing reads it
yet, though - a variable is just a number written down until something goes
and looks at it. Two blocks make it real, and they're both blocks you built
in earlier weeks.

43. Find `Cookie`'s click script - the one that starts with
    `when this sprite clicked`.
44. Drag a `(bonus)` oval from the palette right on top of the `1` in the
    `change [cookies v] by (1)` block.

```
when this sprite clicked
change [cookies v] by (bonus)
...
```

The `...` is the rest of your click script - the sound and the squash. Leave
all of it exactly where it is.

45. Find `Cookie`'s other green-flag script - the one with the `forever` in
    it.
46. Drag the `(per second)` oval out of the
    `change [cookies v] by (per second)` block and drop it in an empty spot
    in the code area, clear of every script. You'll pick it up again in a
    moment.
47. Click the Operators category in the palette.
48. Drag a `() * ()` block into the empty number slot of the
    `change [cookies v] by ()` block.
49. Drag the loose `(per second)` oval into the **left** slot of the
    `() * ()` block.
50. Click the Variables category in the palette.
51. Drag a `(bonus)` oval into the **right** slot of the `() * ()` block.

```
when green flag clicked
forever
  wait (1) seconds
  change [cookies v] by ((per second) * (bonus))
```

**Check it works**
Buy a Grandma first, so `per second` isn't 0 - otherwise there's no
per-second income to double and half of this is invisible. Then wait for a
golden cookie and click it. `bonus` jumps to 2, every click of the big
cookie gives 2 cookies instead of 1, the counter climbs twice as fast on its
own, and ten seconds later `bonus` drops back to 1 and everything goes back
to normal. Use the same testing trick as last milestone if you don't want to
wait for a golden cookie: put `2` and `4` in the `pick random` block, and
put `15` and `30` back afterwards.

**Stuck?**
- **The golden cookie doesn't react at all when you click it - it just sits
  there for its five seconds and vanishes on its own.** Read this one first,
  and put your hand up straight away, because if it happens to you it will
  happen to everybody. A golden cookie is a *clone*, not the real sprite,
  and in some versions of Scratch a clone doesn't respond to
  `when this sprite clicked`. If yours doesn't, build this instead:

  ```
  when I start as a clone
  forever
    if <<touching (mouse-pointer v)?> and <mouse down?>> then
      broadcast [sugar rush v]
      delete this clone
  ```

  Build it in this order. Drag the `when this sprite clicked` script you
  just made onto the palette to throw it away. Drag a *second*
  `when I start as a clone` block into an empty spot - a sprite is allowed
  two of them and both run for every clone, so **leave your `go to` / `show`
  / `wait` / `delete this clone` script exactly where it is.** Snap a
  `forever` block under the new hat. Drop an `if <> then` block into the
  mouth of the `forever`. From the Operators category, drag an `and <>`
  block into the six-sided hole in the `if`. From the *pale blue* Sensing
  category, drag a `touching [mouse-pointer v]?` block into the left half of
  the `and`, and a `mouse down?` block into the right half. Then put the
  `broadcast [sugar rush v]` block into the mouth of the `if`, and a
  `delete this clone` block under it, still inside the mouth. Everything
  else in this milestone works exactly the same afterwards.
- Clicking a golden cookie makes it vanish, but `bonus` never changes - the
  `broadcast` block and the `when I receive` block are pointing at two
  different messages. Click both dropdowns and check both say `sugar rush`.
  If the list has two nearly-identical names in it, the message got made
  twice; pick the same one in both blocks.
- There's no `bonus` readout on the stage to watch - find `bonus` in the
  Variables palette and click the tick box next to its name so it's ticked.
- `bonus` goes up to 2 and then stays at 2 for the rest of the game - the
  second `set [bonus v] to (1)` is missing from the bottom of the
  `when I receive [sugar rush v]` script, or its dropdown is pointing at a
  different variable. It has to be the last block in that script and it has
  to say `bonus`.
- Nothing counts at all when the game starts - clicking the big cookie does
  nothing and the counter never moves - and then your first golden cookie
  makes everything start working normally. The `set [bonus v] to ()` block
  you added to the green-flag script in steps 18 to 22 still says `0`, so
  `bonus` is 0 from the green flag until a sugar rush sets it to 2 and then
  to 1, and after that the game is fine for the rest of the run. Click that
  block's number field and type `1`. (`0` is the number a `set` block arrives
  with, so this is an easy one to end up with.)
- Your game works perfectly until your first golden cookie, and then it stops
  counting altogether - clicks are worth nothing and the per-second income
  dries up too. **This one is the exact opposite of the one above**, so it's
  easy to tell them apart: that one is broken until your first golden cookie,
  this one is broken from your first golden cookie onwards. It's a different
  block, too: the *last* block in the `when I receive [sugar rush v]` script,
  which says `set [bonus v] to (0)`. Click its number field and type `1`.
- `bonus` never seems to move at all, even though the golden cookie vanishes
  when you click it - the `wait (10) seconds` block is missing, so the two
  `set` blocks run one straight after the other and `bonus` is back to 1
  before you can see it. Snap a `wait` block in between them and put `10` in
  it.
- A golden cookie gives you a rush, but `bonus` drops back to 1 the moment
  you click the big cookie - the `set [bonus v] to (1)` from step 18 landed
  in the click script instead of the green-flag script. It has almost
  certainly landed at the very bottom of the click script, under
  `set size to (100) %`, and if it has you can drag it straight out and snap
  it under the last `set` block in the script that sets `cookies` to 0. If it
  landed part way up the click script, don't drag it yet: dragging a block
  brings everything below it along, so first drag the block *underneath* it
  off to an empty spot, then take the `set [bonus v] to (1)` away, then snap
  that loose stack back onto the bottom of the click script.
- During a rush your clicks are still only worth 1 - the `(bonus)` oval
  didn't land in the slot on `change [cookies v] by (1)`. If there's an oval
  lying loose in the code area beside that block, that's the one. Drag it
  right onto the number and wait for the slot to light up before you let go.
- During a rush your clicks double, but the per-second income doesn't - the
  `() * ()` block went into the click script instead of the one with the
  `forever` in it, or it never went in at all. Both of those scripts have a
  `change [cookies v] by ()` block in them. The click script has to read
  `change [cookies v] by (bonus)`, and the one inside the `forever` has to
  read `change [cookies v] by ((per second) * (bonus))`.
- Your cookies stop baking themselves altogether, rush or no rush - one of
  the two slots in the `() * ()` block is empty. Scratch reads an empty slot
  as 0, and anything multiplied by 0 is 0. `(per second)` goes in the left
  slot, `(bonus)` in the right.

## Milestone 3: Make the rush obvious (further target)

Right now a sugar rush is a number changing in the corner of the stage. That
is not much of a party. This milestone gives it a sound and something you
can see from across the room.

1. Click `Cookie` in the sprite list.
2. Click the **Sounds** tab at the top left of the editor.
3. Hold your mouse over the add-sound button at the bottom left of the
   Sounds tab until a little row of extra buttons pops up above it. Check
   the exact spot in your editor, since it can look a little different
   depending on the version.
4. Click the **Choose a Sound** button (the magnifying glass) in that row.
   The sound library opens.
5. Pick any sound you like that isn't the one your cookie already makes when
   you click it, and click it.
6. Read the name of the sound you just picked - it's in the sound list down
   the left now, and you'll need that name in a moment.
7. Click the **Code** tab.
8. Find the `when I receive [sugar rush v]` script.
9. Click the *pink* Sound category in the palette.
10. Drag a `start sound [ v]` block and snap it underneath the
    `set [bonus v] to (2)` block.
11. Click the dropdown on the `start sound` block.
12. Choose the sound name you read in step 6.

**Now pick one of the two signals below - you only need one.** Steps 13 to
17 give you a speech bubble, and they're quick. Steps 18 to 30 change the
whole backdrop for the length of the rush, and they take longer but look
better. Do one of them. If you've still got time at the end of the lesson,
come back and try the other.

**Signal one - a speech bubble. Steps 13 to 17.**

13. Click the Looks category in the palette.
14. Drag a `say [] for () seconds` block and snap it underneath the
    `start sound` block.
15. Click the text field on that block - the one that arrives with `Hello!`
    already in it.
16. Type `SUGAR RUSH!` into it.
17. Look at that block's number field. It should say `2`.

Your script should now look like this:

```
when I receive [sugar rush v]
set [bonus v] to (2)
start sound [the sound you picked v]
say [SUGAR RUSH!] for (2) seconds
wait (10) seconds
set [bonus v] to (1)
```

A `say [] for () seconds` block holds up the script it's in for the whole
two seconds, so your rush now lasts about twelve seconds instead of ten.
That's fine - nobody is counting. What matters is that the `say` block sits
*under* `set [bonus v] to (2)`, so the doubling starts straight away and the
bubble is just the announcement.

**Signal two - a second backdrop. Steps 18 to 30.**

18. Click the **Stage** panel to the right of the sprite list.
19. Hold your mouse over the add-backdrop button at the bottom of that panel
    until a little row of extra buttons pops up above it. Check the exact
    spot in your editor, since it can look a little different depending on
    the version.
20. Click the **Choose a Backdrop** button (the magnifying glass) in that
    row. The backdrop library opens.
21. Pick any backdrop you like that looks nothing like the one you already
    have, and click it.
22. Read the names of both your backdrops in the Backdrops tab down the
    left - the one you started with and the new one. You'll need both.
23. Click `Cookie` in the sprite list to get back to its code.
24. Click the Looks category in the palette.
25. Drag a `switch backdrop to [ v]` block and snap it underneath the
    `start sound` block.
26. Click the dropdown on that block.
27. Choose the name of your new backdrop.
28. Drag another `switch backdrop to [ v]` block and snap it underneath the
    `set [bonus v] to (1)` block at the bottom of the script.
29. Click the dropdown on that block.
30. Choose the name of the backdrop you started with.

Your script should now look like this:

```
when I receive [sugar rush v]
set [bonus v] to (2)
start sound [the sound you picked v]
switch backdrop to [your rush backdrop v]
wait (10) seconds
set [bonus v] to (1)
switch backdrop to [your normal backdrop v]
```

**Check it works**
Click a golden cookie. The sound plays, and either a speech bubble appears
or the whole stage changes, so you know a rush has started without looking
at the numbers. Ten seconds later everything goes back to how it was.

**Stuck?**
- No sound at all when a golden cookie is clicked - the sound went onto the
  wrong sprite. The `start sound` dropdown on `Cookie` only lists sounds
  that are in `Cookie`'s own Sounds tab. Click `Cookie` in the sprite list,
  open its Sounds tab, and check your new sound is in the list there. If it
  isn't, add it again from that tab.
- The bubble appears, but `bonus` doesn't jump to 2 until the bubble has
  gone - the `say` block ended up above `set [bonus v] to (2)` instead of
  below it. `say [] for () seconds` holds up everything underneath it for
  the whole two seconds, so the doubling was waiting its turn. You can't just
  drag the `say` block down, because dragging a block brings everything below
  it along and there are four blocks under it. Two drags instead. **One:**
  drag `set [bonus v] to (2)` - the rest of the script comes with it - and
  snap the whole lot in between `when I receive [sugar rush v]` and the `say`
  block. The `say` block is now the bottom block, on its own. **Two:** drag
  the `say` block and snap it under `start sound`.
- The bubble only turns up when the rush is already over - the `say` block
  is at the very bottom of the script, under `set [bonus v] to (1)`, so it
  waits out the whole ten seconds first. Drag it up under `start sound`.
- The backdrop changes for the rush and never changes back - the second
  `switch backdrop to` block is missing from the bottom of the script. Snap
  one under `set [bonus v] to (1)` and point its dropdown at the backdrop
  you started with.
- The stage is stuck on your rush backdrop and nothing brings it back - you
  pressed the green flag in the middle of a rush. The green flag stops every
  script exactly where it stands, so the `switch backdrop` at the bottom
  never got its turn. Click the **Stage** panel, open its Backdrops tab and
  click the backdrop you want; the next rush will behave normally.

## Milestone 4: Cookie Master (further target)

One more broadcast, to celebrate getting past a thousand cookies.

1. Click `Cookie` in the sprite list.
2. Click the Events category in the palette.
3. Drag a `when green flag clicked` block into an empty spot in the code
   area, well away from every script that's already there.
4. Click the Control category in the palette.
5. Drag a `wait until <>` block and snap it underneath the new
   `when green flag clicked` block.
6. Click the Operators category in the palette.
7. Drag a `() > ()` block into the six-sided hole in the `wait until` block.
8. Click the Variables category in the palette.
9. Drag a `(cookies)` oval into the **left** slot of the `() > ()` block.
10. Click the **right** slot of the `() > ()` block.
11. Type `999` into it.
12. Click the Events category in the palette.
13. Drag a `broadcast [ v]` block and snap it underneath the `wait until`
    block.
14. Click the dropdown on the `broadcast` block.
15. Choose **New message**.
16. Type `cookie master` into the box - two words, all in small letters,
    with one space in the middle.
17. Click **OK**.
18. Drag a `when I receive [ v]` block into another empty spot in the code
    area.
19. Click the dropdown on that block.
20. Choose **cookie master**.
21. Click the Looks category in the palette.
22. Drag a `say [] for () seconds` block and snap it underneath
    `when I receive [cookie master v]`.
23. Click the text field on that block.
24. Type `Cookie Master!` into it.
25. Click that block's number field.
26. Type `3` into it.

Your two new scripts should look like this:

```
when green flag clicked
wait until <(cookies) > (999)>
broadcast [cookie master v]
```

```
when I receive [cookie master v]
say [Cookie Master!] for (3) seconds
```

`wait until <>` does exactly what it says: it stops and waits, checking over
and over, and the moment the condition comes true it lets the script carry
on. The `broadcast` runs once, the script runs out of blocks, and that is
the end of it for the whole game - which is why nothing has to stop the
message coming back again and again. You get told you're a Cookie Master
once, and once is right.

**Check it works**
Press the green flag and get past 1000 cookies. The message appears once,
for three seconds, and then never again.

**Stuck?**
- The message never appears, however many cookies you get - two things to
  check. The number in the `() > ()` block might say `9999` instead of
  `999`; an extra 9 is very easy to type. Or the `() > ()` block is lying
  beside the `wait until` block's six-sided hole instead of inside it, which
  leaves the hole empty and the script waiting for ever - drag it right into
  the hole and wait for the hole to light up before you let go.
- "Cookie Master!" pops up every single time you click a golden cookie, and
  never at a thousand cookies - the `when I receive` dropdown is pointing at
  `sugar rush` instead of `cookie master`, so it's answering the wrong shout.
  Click the dropdown and choose `cookie master`.
- The message appears the instant you press the green flag - the two things
  in the `() > ()` block are the wrong way round. It has to read
  `(cookies) > (999)`, with the `(cookies)` oval on the left and the number
  `999` typed on the right. The other way round it reads "999 is bigger than
  my cookies", which is true from the moment the game starts.
- The `broadcast` block still says `sugar rush` - click its dropdown and
  choose `cookie master`. If `cookie master` isn't in the list at all, the
  message never got made: choose **New message** and type it in.
- Waiting for 1000 cookies is too slow to test - test it the quick way
  instead. Click the `999` in the `() > ()` block, type `9`, press the green
  flag and click your cookie ten times. Put `999` back afterwards.

## Make it yours

- How often should golden cookies come? Try different numbers in
  `pick random (15) to (30)`. `5` to `10` makes the game frantic; `60` to
  `120` makes a golden cookie a real event.
- How long should one linger before it vanishes? That's the `5` in the
  clone script's `wait (5) seconds`. Make it `2` if you want it to be hard
  to catch.
- How big should the rush be? `2` is only a suggestion. Try `3` in
  `set [bonus v] to (2)` - but leave the other one at `1`, because 1 is the
  number that means "no rush".
- How long should a rush last? Try a different number in
  `wait (10) seconds` inside the `when I receive [sugar rush v]` script.
- What announces a rush? A different sound, different words in the speech
  bubble, a different backdrop - or all three at once.
- What tells you a rush is *over*? Right now `bonus` just drops quietly back
  to 1 and nothing marks it. Give the end its own signal at the bottom of
  the `when I receive [sugar rush v]` script, under `set [bonus v] to (1)` -
  and make it different from whatever marks the start, so the two moments
  don't feel the same.
- What happens at an even bigger number? `Cookie Master!` fires once, just
  past 1000. Build a second script for a bigger number of your own: a
  `when green flag clicked` hat with a `wait until <>` under it, and a
  message name of your own - just don't call it `cookie master` again, or
  you'll be answering the wrong shout.
- What does a golden cookie look like? Open `Special Cookie`'s Costumes tab
  and draw on it: a star, a crown, a shine.

**Got through all of those?** There are more in
`reference/extra-challenges.md`, sorted by how hard they are. The three-star
one is a build of your own: you get a goal and a rule, and the rest is yours
to work out. If you finish those too, `reference/bonus-ideas.md` has
directions nobody has built yet - including whoever wrote them.

## Before you log off

Do this now, even if you're mid-milestone. This is the last lesson, so this
save is the one that keeps your game.

1. Click **File** at the top of the editor.
2. Click **Save now** (in some versions it just says **Save**).
3. Look at the top of the screen for the message saying your project was
   saved.

Didn't see that message, or does it say you're not logged in? Put your hand
up before you close the tab - don't just try again and hope.

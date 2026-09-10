# Lesson 1 - Bake a cookie

By the end of today you'll have a cookie you can click, that counts every
click and squashes and pops when you hit it.

**Words used in these cards**

- **Palette** - the panel of coloured block categories down the left, the
  one you drag blocks *out of*.
- **Code area** - the big middle panel, the one you drop blocks *into* to
  build a script.

## Milestone 1: Paint your cookie and make it count

1. Go to scratch.mit.edu.
2. Log in.
3. Click **Create** to start a new project.
4. Click the project name at the top of the screen.
5. Type `Cookie Clicker` to rename it.
6. Delete the cat sprite by clicking the trash can icon on its thumbnail in
   the sprite list.
7. Click the add-backdrop button to open the backdrop library. Look for it
   in the stage-selector panel to the right of the sprite list, below the
   stage - check the exact spot in your editor, since it can look a little
   different depending on the version.
8. Pick any backdrop you like. There's no right answer here - your cookie
   can sit in space or on a football pitch.
9. Hold your mouse over the add-sprite button at the bottom of the sprite
   list until a little row of extra buttons pops up above it.
10. Click the **Paint** button (the paintbrush) in that row. A new empty
    sprite opens in the paint editor.
11. Click the **Fill** colour swatch above the canvas to open the colour
    sliders.
12. Drag the **Color** slider to the orange part of the strip.
13. Drag the **Brightness** slider down until the swatch looks like biscuit
    brown.
14. Click the **Circle** tool in the toolbar down the left of the canvas.
15. Drag out a circle that fills most of the canvas. **Draw it big.** The
    size of your cookie comes from how big you draw it here, not from the
    Size field - a later milestone stops working if you change that field.
16. Look at the **Size** field in the sprite info panel above the sprite
    list. It should say `100`, and it must stay at `100`.
17. Click the **Fill** swatch again.
18. Drag the **Brightness** slider further down to a much darker brown.
19. Click the **Circle** tool again.
20. Drag out a small circle inside the big one to make a chocolate chip.
21. Draw four or five more small circles the same way, spread around your
    cookie.
22. Click the sprite's name box in the sprite info panel.
23. Type `Cookie` to rename it.
24. Drag the `Cookie` sprite on the stage into the middle.
25. Click the **Code** tab at the top left of the editor.
26. Click the *orange* Variables category in the palette.
27. Click **Make a Variable** at the top of the palette.
28. Type `cookies` into the box, all in small letters.
29. Click **OK**, leaving **For all sprites** chosen.
30. Click the *yellow* Events category in the palette.
31. Drag a `when this sprite clicked` block into the code area.
32. Click the Variables category in the palette.
33. Drag a `change [ v] by (1)` block - the one that starts with the word
    *change* - and snap it underneath `when this sprite clicked`.
34. Click the dropdown on that `change` block.
35. Choose **cookies**.

Your script should now look like this:

```
when this sprite clicked
change [cookies v] by (1)
```

**Check it works**
Click your cookie on the stage - the actual picture on the stage, not the
thumbnail in the sprite list. The number in the corner of the stage should
go up by one every single click.

**Stuck?**
- The number doesn't move when you click - check the script is on the
  `Cookie` sprite by clicking `Cookie` in the sprite list and looking at
  the code area, and check you're clicking the cookie *on the stage* rather
  than its thumbnail in the sprite list.
- There's no number on the stage at all - find `cookies` in the Variables
  palette and click the tick box next to it so it's ticked.
- Your cookie is a tiny dot on the stage - it was drawn small, so open its
  Costumes tab and draw it bigger there, because changing the Size field
  instead will break the squash you build in Milestone 3.

## Milestone 2: Make the green flag reset it

1. Click your cookie on the stage twenty or thirty times, until you have a
   score you're proud of.
2. Click the green flag above the stage.
3. Look at the number. It did **not** go back to 0 - that's not your
   mistake, and nothing is broken. The green flag doesn't know anything
   about your cookies yet, because you haven't told it anything. Every game
   that starts fresh has to be told to start fresh.
4. Click the Events category in the palette.
5. Drag a `when green flag clicked` block into an empty spot in the code
   area, well away from your click script.
6. Click the Variables category in the palette.
7. Drag a `set [ v] to (0)` block - the one that starts with the word
   *set* - and snap it underneath `when green flag clicked`.
8. Click the dropdown on that `set` block.
9. Choose **cookies**.
10. Look at the number field on the `set` block. It should say `0`.

You should now have two separate scripts:

```
when this sprite clicked
change [cookies v] by (1)
```

```
when green flag clicked
set [cookies v] to (0)
```

**Check it works**
Click up any score you like, then press the green flag. The number should
drop to 0. Click again and it counts up from 0.

**Stuck?**
- The number keeps resetting while you're clicking the cookie - the `set`
  block ended up in the click script. Drag it out by itself and snap it
  under `when green flag clicked` instead.
- Nothing happens when you press the green flag - the two blocks aren't
  snapped together. Drag the `set` block right up under
  `when green flag clicked` until you see the white drop-shadow line, then
  let go.
- The number field on the `set` block says something other than `0` - click
  it and type `0`.

## Milestone 3: Make it feel good

1. Click the **Sounds** tab at the top left of the editor.
2. Read the name of the sound already sitting in there - it's probably
   something like `pop`, but whatever the name says is the one you want in
   the steps below.
3. Click the **Code** tab.
4. Click the *pink* Sound category in the palette.
5. Drag a `start sound [ v]` block and snap it underneath
   `change [cookies v] by (1)`.
6. Click the dropdown on the `start sound` block.
7. Choose the sound name you read in the Sounds tab.
8. Click the *purple* Looks category in the palette.
9. Drag a `set size to () %` block and snap it underneath the
   `start sound` block.
10. Click that block's number field.
11. Type `110` into it.
12. Click the *amber* Control category in the palette.
13. Drag a `wait () seconds` block and snap it underneath
    `set size to (110) %`.
14. Click that block's number field.
15. Type `0.05` into it.
16. Click the Looks category in the palette.
17. Drag another `set size to () %` block and snap it underneath the
    `wait` block.
18. Click that block's number field.
19. Type `100` into it.

Your click script should now look like this:

```
when this sprite clicked
change [cookies v] by (1)
start sound [pop v]
set size to (110) %
wait (0.05) seconds
set size to (100) %
```

**Check it works**
Click the cookie. It should make a sound and give a quick squash, and the
number should still go up by one every click.

**Stuck?**
- The cookie is stuck big after you click it - the last block is missing or
  has the wrong number. Check the bottom of the script says
  `set size to (100) %`.
- The counter stalls or lags behind when you click fast - you've got a
  `play sound until done` block instead of `start sound`. That one makes
  the script sit and wait for the sound to finish. Drag it out onto the
  palette and put a `start sound` block in its place.
- The cookie jumps to a strange size on the very first click - the sprite's
  Size field isn't 100. Set that field back to `100`, and make your cookie
  bigger by drawing it bigger in the Costumes tab instead.
- No sound at all - the Sounds tab is empty. Click the add-sound button at
  the bottom left of the Sounds tab, pick any short sound you like from the
  library, then choose it in the `start sound` block's dropdown.

## Milestone 4: Bonus round (if you get there)

1. Right-click the `Cookie` sprite's thumbnail in the sprite list.
2. Choose **Duplicate**. A copy called `Cookie2` appears, with copies of
   both scripts already inside it.
3. Click `Cookie2` in the sprite list to select it.
4. Click the sprite's name box in the sprite info panel.
5. Type `Special Cookie` to rename it.
6. Click the **Size** field in the sprite info panel.
7. Type `50` into it.
8. Drag the `Special Cookie` on the stage into a corner, out of the way of
   the big one.
9. Drag the copied `when green flag clicked` block onto the palette to
   delete it. Dragging a block takes everything below it along too, so the
   `set [cookies v] to (0)` block underneath goes with it and that whole
   script disappears in one drag. You only want one sprite resetting the
   score.
10. Drag the `start sound` block onto the palette. The three blocks below it
    come along the same way, so one drag takes all four away. The squash
    blocks *have* to go: `set size to (110) %` means "be exactly 110%", so
    on a cookie shrunk to 50 every click would blow it up to 110.
11. Click the number field on `change [cookies v] by (1)`.
12. Type `10` into it.

`Special Cookie` should now have exactly one script, and it should look
like this:

```
when this sprite clicked
change [cookies v] by (10)
```

**Check it works**
Click the small cookie - the number jumps by 10. Click the big one - it
still goes up by 1, with its sound and squash. The small one stays small
however many times you click it.

**Stuck?**
- The small cookie grows when you click it - the `set size to` blocks are
  still there. Drag the `set size to (110) %` block onto the palette to
  take it and the blocks below it away.
- Pressing the green flag resets your score twice over, or the small cookie
  disappears - the copied green-flag script is still on `Special Cookie`.
  Select `Special Cookie`, then drag its `when green flag clicked` block
  onto the palette.
- The small cookie still only adds 1 - you changed the number on the wrong
  sprite. Click `Special Cookie` in the sprite list first, then change the
  number in the code area you see after that.

## Make it yours

- Redraw your cookie in the Costumes tab: a different shape, different
  chips, a bite taken out of it.
- Try a different click sound from the sound library.
- Change how hard the cookie squashes by trying a different number in
  `set size to (110) %` - try `130` for a big squash or `104` for a tiny
  one.
- Decide what your `Special Cookie` is worth: 10 is only a suggestion.
- Drag the `cookies` readout on the stage to wherever you want it to sit.

## Before you log off

Do this every week, and do it now even if you're mid-milestone. Next week's
cards start by opening this same project again - a project that isn't saved
doesn't survive the week.

1. Click **File** at the top of the editor.
2. Click **Save now** (in some versions it just says **Save**).
3. Look at the top of the screen for the message saying your project was
   saved.

Didn't see that message, or does it say you're not logged in? Put your hand
up before you close the tab - don't just try again and hope.

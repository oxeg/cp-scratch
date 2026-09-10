# Lesson 1 - Fly the ship

By the end of today you'll have a ship you can fly around space with the
arrow keys.

## Milestone 1: Set up your project

1. Go to scratch.mit.edu.
2. Log in.
3. Click **Create** to start a new project.
4. Click the project name at the top of the screen.
5. Type `Space Shooter` to rename it.
6. Click the add-backdrop button to open the backdrop library. Look for it
   in the stage-selector panel to the right of the sprite list, below the
   stage - check the exact spot in your editor, since it can look a little
   different depending on the version.
7. Choose a space-themed backdrop - it might be called something like
   *Stars* or *Galaxy*, so check the names in the library and pick one that
   looks like space.
8. Delete the cat sprite by clicking the trash can icon on its thumbnail in
   the sprite list.
9. Click the add-sprite button to open the sprite library. Look for it at
   the bottom of the sprite list, the panel under the stage - check the
   exact spot in your editor, since it can look a little different
   depending on the version.
10. Add the rocket sprite - it's called something like *Rocketship*, so
    check the names in the library and pick the one that looks like a
    rocket.
11. Click the sprite's name box in the sprite info panel.
12. Type `Ship` to rename it.
13. Change the size field in the sprite info panel to about `50`.
14. Drag the `Ship` sprite on the stage down to the bottom middle.
15. Click the rotation style icon in the sprite info panel.
16. Choose **don't rotate**.

**Check it works**
Look at the stage: it should show a space backdrop with a small ship sitting
near the bottom middle. The sprite list should show only `Ship` - no cat.

**Stuck?**
- Can't find the trash can on the cat sprite - hover your mouse directly
  over the cat's thumbnail in the sprite list; the trash can only shows up
  when your mouse is over it.
- Can't find a rocket in the sprite library - use the search box at the top
  of the library and type "rocket".
- Ship looks huge or tiny on the stage - check the size field in the sprite
  info panel says about 50.

## Milestone 2: Make the ship start in the right place

1. Click the `Ship` sprite in the sprite list to select it, if it isn't
   already selected.
2. Click the **Code** tab.
3. Click the *yellow* Events category in the palette.
4. Drag a `when green flag clicked` block into the code area.
5. Click the *blue* Motion category in the palette.
6. Drag a `go to x: () y: ()` block and snap it underneath
   `when green flag clicked`.
7. Click the x number field on that block.
8. Type `0` into it.
9. Click the y number field on that block.
10. Type `-120` into it.

Your script should now look like this:

```
when green flag clicked
go to x: (0) y: (-120)
```

**Check it works**
Drag your ship somewhere else on the stage, then click the green flag above
the stage. The ship should jump straight back to the bottom middle every
time you click it.

**Stuck?**
- Nothing happens when you click the green flag - check the
  `go to x: () y: ()` block is snapped underneath `when green flag clicked`,
  not sitting apart from it (look for the white drop-shadow line when you
  drag one block close to another).
- The ship jumps to the wrong spot - check you typed `0` in the x field and
  `-120` in the y field, not swapped.

## Milestone 3: Move the ship (first try)

1. Click the Events category in the palette.
2. Drag a `when [key] key pressed` block into the code area.
3. Click its key dropdown.
4. Choose **right arrow**.
5. Click the Motion category in the palette.
6. Drag a `change x by ()` block and snap it underneath the
   `when right arrow key pressed` block.
7. Type `5` into its number field.
8. Drag another `when [key] key pressed` block into an empty spot in the
   code area.
9. Click its key dropdown.
10. Choose **left arrow**.
11. Drag a `change x by ()` block and snap it underneath.
12. Type `-5` into its number field.
13. Drag another `when [key] key pressed` block into an empty spot in the
    code area.
14. Click its key dropdown.
15. Choose **up arrow**.
16. Drag a `change y by ()` block and snap it underneath.
17. Type `5` into its number field.
18. Drag another `when [key] key pressed` block into an empty spot in the
    code area.
19. Click its key dropdown.
20. Choose **down arrow**.
21. Drag a `change y by ()` block and snap it underneath.
22. Type `-5` into its number field.

You should now have four separate scripts:

```
when [right arrow v] key pressed
change x by (5)
```

```
when [left arrow v] key pressed
change x by (-5)
```

```
when [up arrow v] key pressed
change y by (5)
```

```
when [down arrow v] key pressed
change y by (-5)
```

**Check it works**
Click the green flag, then try the arrow keys. The ship should move - but it
will feel *bad*, and that's expected, not your mistake: there's a short
pause before it starts moving each time you press a key, and you can't move
diagonally (holding up and right together only does one of them). You'll fix
this in the next milestone.

**Stuck?**
- Nothing moves when you press a key - check you're pressing and holding the
  key, and check the `change x by` / `change y by` block is actually snapped
  underneath its matching `when key pressed` block.
- The ship moves the wrong way - check the number: positive numbers move
  right or up, negative numbers move left or down.
- Only one or two directions work - check you built all four scripts, and
  that each has its own `when [key] key pressed` block with the matching
  arrow key chosen.

## Milestone 4: Make it feel good

1. Drag the `when right arrow key pressed` script (grab it by its top block)
   onto the palette on the left to delete it.
2. Drag the `when left arrow key pressed` script onto the palette to delete
   it.
3. Drag the `when up arrow key pressed` script onto the palette to delete
   it.
4. Drag the `when down arrow key pressed` script onto the palette to delete
   it.
5. Click the *amber* Control category in the palette.
6. Drag a `forever` block and snap it underneath the
   `go to x: (0) y: (-120)` block from Milestone 2.
7. Drag an `if <> then` block so it sits inside the `forever` block.
8. Click the *pale blue* Sensing category in the palette.
9. Drag a `key [key] pressed?` block into the hexagonal slot on the `if`
   block.
10. Click its key dropdown.
11. Choose **right arrow**.
12. Click the Motion category in the palette.
13. Drag a `change x by ()` block so it sits inside the `if` block.
14. Type `5` into its number field.
15. Right-click this `if` block (the one you just built) and choose
    **Duplicate**.
16. Drag the duplicate so it snaps inside the `forever` block, underneath
    the first `if`.
17. Click the duplicate's key dropdown.
18. Choose **left arrow**.
19. Change the duplicate's number to `-5`.
20. Right-click the second `if` block - the one you just changed to left
    arrow - and choose **Duplicate**.
21. Drag this new duplicate so it snaps inside the `forever` block,
    underneath the second `if`.
22. Click its key dropdown.
23. Choose **up arrow**.
24. Drag its `change x by ()` block out onto the palette to delete it.
25. Drag a `change y by ()` block so it sits inside the `if` block instead.
26. Type `5` into its number field.
27. Right-click the third `if` block - the one you just changed to up
    arrow - and choose **Duplicate**.
28. Drag this new duplicate so it snaps inside the `forever` block,
    underneath the third `if`.
29. Click its key dropdown.
30. Choose **down arrow**.
31. Change the duplicate's number to `-5`.

Your script should now look like this:

```
when green flag clicked
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

**Check it works**
Click the green flag. Hold down an arrow key - the ship should start moving
right away, with no pause. Try holding two arrow keys at once (like up and
right) - the ship should move diagonally. This should feel much smoother
than Milestone 3.

**Stuck?**
- Nothing happens - check the whole group of four `if` blocks sits *inside*
  the `forever` block, not stacked below it, and that `forever` is snapped
  under `go to x: (0) y: (-120)`.
- One direction doesn't work - check that `if`'s `key [key] pressed?` block
  has the right key chosen, and its `change x by` / `change y by` block has
  the right number and sign.
- The ship only moves left and right, never up and down - check the up and
  down `if`s use `change y by`, not a leftover `change x by` block.
- You ended up with more than four `if` blocks - Duplicate copies the block
  you right-click *and* everything snapped in underneath it, so
  right-clicking the wrong `if` copies extra ones along with it. Drag the
  extra `if` blocks out onto the palette to delete them, so you're left
  with exactly four, one per arrow key.

## Make it yours

- Try a different speed number in the `change x by` and `change y by`
  blocks - bigger numbers move the ship faster.
- Give your ship a different colour - open its Costumes tab and use the
  paint tools, or try a colour effect from the *purple* Looks category.
- Make your ship bigger or smaller using the size field in the sprite info
  panel.

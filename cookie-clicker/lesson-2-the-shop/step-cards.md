# Lesson 2 - The shop

By the end of today you'll have a shop. Buy a Grandma with the cookies
you've clicked, and she bakes cookies for you while you sit there - and
every helper you buy costs more than the last one.

**Words used in these cards**

- **Palette** - the panel of coloured block categories down the left, the
  one you drag blocks *out of*.
- **Code area** - the big middle panel, the one you drop blocks *into* to
  build a script.
- **Oval** - a small rounded block with a variable's name on it, like
  `(cookies)`. You don't snap an oval under another block. You drop it
  *into a slot* on a block, like the empty holes in `() < ()`.
- **Mouth** - the C-shaped gap inside a block like `if <> then` or
  `forever`. Blocks put in the mouth are *inside* that block. With an
  `if <> then`, blocks snapped under the whole thing are outside it, and
  that is a different thing entirely. A `forever` works differently: look
  at its bottom edge and you'll see it has no bump, so **nothing can be
  attached under a `forever` at all.** It is always the last block in its
  script.

## Milestone 1: Open the shop

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
8. Hold your mouse over the add-sprite button at the bottom of the sprite
   list until a little row of extra buttons pops up above it. Look for that
   button at the bottom of the sprite list, the panel under the stage -
   check the exact spot in your editor, since it can look a little
   different depending on the version.
9. Click the **Choose a Sprite** button (the magnifying glass) in that row.
   The sprite library opens.
10. Pick any person sprite you like and click it. Any person at all will
    do - a dancer, a wizard, a footballer. Whoever you pick is your
    shopkeeper, and nobody else's has to match yours.
11. Click the new sprite's name box in the sprite info panel above the
    sprite list.
12. Type `Grandma` to rename it.
13. Drag `Grandma` on the stage over to one side, well clear of your
    cookie.
14. Click the *orange* Variables category in the palette.
15. Click **Make a Variable** at the top of the palette.
16. Type `per second` into the box - two words, all in small letters, with
    one space in the middle.
17. Click **OK**, leaving **For all sprites** chosen.
18. Click **Make a Variable** again.
19. Type `grandma cost` into the box - again two words, all in small
    letters, one space in the middle.
20. Click **OK**, leaving **For all sprites** chosen.
21. Click `Cookie` in the sprite list.
22. Find the script in the code area that starts with
    `when green flag clicked`. That's the one you're adding to - not the
    click script.
23. Drag a `set [ v] to (0)` block from the palette and snap it underneath
    `set [cookies v] to (0)`.
24. Click the dropdown on the new `set` block.
25. Choose **per second**.
26. Look at that block's number field. It should say `0`.
27. Drag another `set [ v] to (0)` block and snap it underneath
    `set [per second v] to (0)`.
28. Click the dropdown on that new block.
29. Choose **grandma cost**.
30. Click that block's number field.
31. Type `50` into it.

`Cookie`'s green-flag script should now look like this:

```
when green flag clicked
set [cookies v] to (0)
set [per second v] to (0)
set [grandma cost v] to (50)
```

Every new number in this game gets set here, in this one script, at the
moment the game starts. That's the same pattern you built last week, just
with more numbers in it.

**Check it works**
Press the green flag. On the stage, `cookies` and `per second` should both
show 0, `grandma cost` should show 50, and your Grandma should be standing
off to one side.

**Stuck?**
- Last week's project won't open, or you can't find it in **My Stuff** -
  check you're logged in as the same account you used last week; the top
  right of the page shows which username you're on. Put your hand up before
  you start a new project - a new one won't have your cookie in it.
- One of the new numbers doesn't appear on the stage at all - find it in
  the Variables palette and click the tick box next to its name so it's
  ticked.
- A number on the stage has the wrong name on it, like `persecond` or
  `per Second` - it was typed slightly differently. The names have to match
  these cards exactly, small letters and spaces included. Right-click the
  variable in the palette, choose **Rename**, and type it again.
- Your new sprite is still called something else - click it in the sprite
  list, click the name box in the sprite info panel, and type `Grandma`.
  Milestone 4 makes a copy of this sprite, and a copy of a wrongly-named
  sprite is wrongly named too.
- The two new `set` blocks ended up in the click script instead of the
  green-flag script. **You can't spot this one by playing** - both numbers
  already show the right values, so setting them again on every click looks
  like nothing at all. So check it on purpose: click `Cookie` in the sprite
  list and count blocks. The green-flag script should have four blocks
  (the hat and three `set` blocks) and the click script should still have
  exactly six. If the click script has grown, drag the extra `set` blocks
  out and snap them under the green flag instead.

## Milestone 2: Buy a Grandma

1. Click `Grandma` in the sprite list. Her code area is empty - everything
   in this milestone gets built there.
2. Click the *yellow* Events category in the palette.
3. Drag a `when this sprite clicked` block into the code area.
4. Click the *amber* Control category in the palette.
5. Drag an `if <> then` block and snap it underneath
   `when this sprite clicked`.
6. Click the *green* Operators category in the palette.
7. Drag a `not <>` block into the six-sided hole in the `if` block.
8. Drag a `() < ()` block into the six-sided hole inside the `not` block.
9. Click the Variables category in the palette.
10. Drag a `(cookies)` oval into the **left** slot of the `() < ()` block.
11. Drag a `(grandma cost)` oval into the **right** slot of the `() < ()`
    block.

That condition reads *not less than*, and it looks odd on purpose. What you
want to say is "if I have at least enough cookies" - but Scratch only gives
you *less than*, *equals* and *greater than*. There's no "greater than or
equal to" block anywhere in the palette, so you say the same thing the
other way round: **if it is not true that I have less than enough.**

Now for what happens when she's bought.

12. Drag a `set [ v] to (0)` block into the **mouth** of the `if` block -
    inside it, not underneath it.
13. Click the dropdown on that `set` block.
14. Choose **cookies**.
15. Click the Operators category in the palette.
16. Drag a `() - ()` block into the number slot of the
    `set [cookies v] to ()` block.
17. Click the Variables category in the palette.
18. Drag a `(cookies)` oval into the **left** slot of the `() - ()` block.
19. Drag a `(grandma cost)` oval into the **right** slot of the `() - ()`
    block.
20. Drag a `change [ v] by (1)` block and snap it underneath the
    `set [cookies v] to ...` block, still inside the mouth of the `if`.
21. Click the dropdown on that `change` block.
22. Choose **per second**.
23. Look at that block's number field. It should say `1`.
24. Drag a `set [ v] to (0)` block and snap it underneath the
    `change [per second v] by (1)` block, still inside the mouth of the
    `if`.
25. Click the dropdown on that `set` block.
26. Choose **grandma cost**.
27. Click the Operators category in the palette.
28. Drag a `() * ()` block into the number slot of the
    `set [grandma cost v] to ()` block.
29. Click the Variables category in the palette.
30. Drag a `(grandma cost)` oval into the **left** slot of the `() * ()`
    block.
31. Click the **right** slot of the `() * ()` block.
32. Type `2` into it.

`Grandma`'s script should now look like this:

```
when this sprite clicked
if <not <(cookies) < (grandma cost)>> then
  set [cookies v] to ((cookies) - (grandma cost))
  change [per second v] by (1)
  set [grandma cost v] to ((grandma cost) * (2))
```

**Check it works**
Press the green flag, then click Grandma straight away - you have 0 cookies
at that moment, so nothing at all happens, and that's right. Now click your
cookie up past 50 and click Grandma again: `cookies` drops by 50,
`per second` becomes 1, and `grandma cost` becomes 100.

**Stuck?**
- Clicking Grandma does nothing even when you've got plenty of cookies -
  either the `not <>` block is missing, so the script is checking the exact
  opposite of what you meant, or the two ovals inside `() < ()` are the
  wrong way round. It has to read `(cookies) < (grandma cost)`, cookies on
  the left.
- Your `cookies` number goes negative when you click her - the
  `set [cookies v] to ((cookies) - (grandma cost))` block is sitting
  *underneath* the whole `if` block instead of inside its mouth, so it runs
  whether you can afford her or not. Drag it into the mouth, above the
  other two.
- Clicking her sets `cookies` to a strange small or negative number even
  when you could afford her - the two ovals in the `() - ()` block are the
  wrong way round. `(cookies)` goes on the left, `(grandma cost)` on the
  right.
- She never gets more expensive, so you can buy her over and over at 50 -
  the `set [grandma cost v] to ((grandma cost) * (2))` block is missing.
  Build it and drop it in at the bottom, inside the mouth of the `if`.
- Her price runs away on its own, doubling and doubling until you can never
  afford her - that same `set [grandma cost v] to ((grandma cost) * (2))`
  block is sitting *underneath* the whole `if` block instead of inside its
  mouth, so it fires on every single click of her, including all the clicks
  that buy nothing. Drag it into the mouth, below the other two.
- Buying her costs you far more than 50 - the three blocks inside the mouth
  are in the wrong order, with the price-doubling block running before you
  pay. Top to bottom they must read: `set [cookies v] to ...`, then
  `change [per second v] by (1)`, then `set [grandma cost v] to ...`.
- A block you dragged is sitting loose in the code area with nothing
  attached to it - drag it onto the palette to throw it away, then take a
  fresh one from the palette.

## Milestone 3: Cookies bake themselves

A sprite is allowed more than one script that starts with
`when green flag clicked`. Press the flag and every one of them starts, and
they all run at the same time. You're about to give `Cookie` a second one.

1. Click `Cookie` in the sprite list.
2. Click the Events category in the palette.
3. Drag a `when green flag clicked` block into an empty spot in the code
   area, well away from both of the scripts already there.
4. Click the Control category in the palette.
5. Drag a `forever` block and snap it underneath the new
   `when green flag clicked` block.
6. Drag a `wait () seconds` block into the mouth of the `forever` block.
7. Look at that block's number field. It should say `1`.
8. Click the Variables category in the palette.
9. Drag a `change [ v] by (1)` block and snap it underneath the
   `wait (1) seconds` block, still inside the mouth of the `forever`.
10. Click the dropdown on that `change` block.
11. Choose **cookies**.
12. Drag a `(per second)` oval into the number slot of the
    `change [cookies v] by ()` block.

Your new script should look like this:

```
when green flag clicked
forever
  wait (1) seconds
  change [cookies v] by (per second)
```

**Check it works**
Press the green flag, click your cookie up past 50 and buy a Grandma, then
put your hands in your lap. The counter keeps going up on its own, one
every second.

**Stuck?**
- Nothing happens with your hands off - most likely you haven't bought a
  Grandma yet, so `per second` is still 0 and the script is faithfully
  adding zero cookies every second. Look at the `per second` readout on the
  stage: if it says 0, go and buy her first.
- Still nothing, and `per second` says 1 - look at the slot on the
  `change [cookies v] by ()` block. If that slot is empty, Scratch reads it
  as 0, so the script is faithfully adding nothing once a second. Drag a
  `(per second)` oval into it.
- The counter climbs by exactly one a second however many Grandmas you buy
  - the `(per second)` oval landed *beside* the slot instead of in it. It's
  lying loose in the code area and the block is still using its own number.
  Drag the oval right onto the slot and wait for the slot to light up
  before you let go.
- Cookies race up far too fast to read - the `wait (1) seconds` block isn't
  in the mouth of the `forever`. It can't be *below* the `forever` -
  nothing can - so there are two things it might be. If it's simply
  missing, drag a `wait (1) seconds` block into the mouth of the `forever`,
  above the `change` block, and type `1` into it. If instead it got snapped
  *above* the `forever`, in between it and `when green flag clicked`, then
  up there it waits one second once and the loop runs flat out for the rest
  of the game. You can't just drag it down into the mouth, because dragging
  a block brings everything below it along, and what's below it is the
  `forever` itself - a stack can never be dropped into the mouth of a
  `forever` it is carrying. Three drags, and they have to be in this order.
  **One:** drag the `forever` block away to an empty spot - the `change`
  block travels inside its mouth, which is what you want. **Two:** drag the
  `wait` block - it's the bottom block of what's left, so nothing comes
  along with it - into the mouth of the `forever`, above the `change`
  block. **Three:** snap the `forever` back underneath
  `when green flag clicked`.
- The counter climbs on its own, but your cookie stopped making its sound
  and stopped squashing - the `forever` block landed in the middle of the
  click script. Nothing can stay attached under a `forever`, so the four
  blocks that used to sit below that spot got knocked loose, and they're
  lying in the code area now as a separate little stack starting with
  `start sound`. There are two things to put right here. Drag the `forever`
  block out to an empty spot and snap it under a fresh
  `when green flag clicked` block. Then drag that loose stack back and snap
  it under `change [cookies v] by (1)` in the click script, which is where
  it came from.
- Your new blocks got snapped onto the bottom of last week's green-flag
  script instead of standing on their own. **You can't spot this one by
  playing** - the game behaves exactly the same either way - so check it on
  purpose: look at `Cookie`'s code area and count the scripts. There should
  be three: the click script, the short green-flag script that sets the
  numbers, and this new green-flag script with the `forever` in it. If you
  can only find two, drag the `forever` block away from the bottom of the
  setting-up script and snap it under a fresh `when green flag clicked`
  block.

## Milestone 4: Second shop item (everyone should reach)

1. Click `Cookie` in the sprite list.
2. Click the Variables category in the palette.
3. Click **Make a Variable**.
4. Type `baker cost` into the box - two words, all in small letters, one
   space in the middle.
5. Click **OK**, leaving **For all sprites** chosen.
6. Drag a `set [ v] to (0)` block and snap it underneath
   `set [grandma cost v] to (50)` in the green-flag script.
7. Click the dropdown on that `set` block.
8. Choose **baker cost**.
9. Click that block's number field.
10. Type `500` into it.
11. Right-click the `Grandma` sprite's thumbnail in the sprite list.
12. Choose **Duplicate**. A copy called `Grandma2` appears, with a copy of
    her whole script already inside it.
13. Click `Grandma2` in the sprite list to select it.
14. Click the sprite's name box in the sprite info panel.
15. Type `Baker` to rename it.
16. Drag the `Baker` on the stage to the other side, well clear of Grandma.
17. Click the dropdown on the `set [grandma cost v] to ...` block at the
    bottom of the `Baker`'s script.
18. Choose **baker cost**.

That was easy, because the name on a `set` block is a dropdown and a
dropdown can just be pointed somewhere else. The three orange ovals reading
`grandma cost` are not dropdowns - they're whole blocks with the name baked
in - so each one has to be dragged out and thrown away, and a `baker cost`
oval dragged into the hole it leaves behind. That's the next six steps: out,
in, three times.

19. Drag the `(grandma cost)` oval out of the right slot of the `() < ()`
    block and drop it on the palette to throw it away.
20. Drag a `(baker cost)` oval from the palette into the empty right slot
    of the `() < ()` block.
21. Drag the `(grandma cost)` oval out of the right slot of the `() - ()`
    block and drop it on the palette.
22. Drag a `(baker cost)` oval into the empty right slot of the `() - ()`
    block.
23. Drag the `(grandma cost)` oval out of the left slot of the `() * ()`
    block and drop it on the palette.
24. Drag a `(baker cost)` oval into the empty left slot of the `() * ()`
    block.
25. Click the number field on the `change [per second v] by (1)` block.
26. Type `10` into it.

The `Baker`'s script should now look like this, with no `grandma cost` left
anywhere in it:

```
when this sprite clicked
if <not <(cookies) < (baker cost)>> then
  set [cookies v] to ((cookies) - (baker cost))
  change [per second v] by (10)
  set [baker cost v] to ((baker cost) * (2))
```

**Check it works**
Press the green flag and get up to 500 cookies. Clicking the Baker takes
500 away, adds 10 to `per second`, and pushes `baker cost` to 1000. Grandma
still costs whatever she was up to. Clicking 500 times is hard on a finger,
so test it the quick way instead: on `Cookie`, click the `500` in the
`set [baker cost v] to (500)` block, type `20`, press the green flag, and
buy him with 20 cookies. Put the number back to `500` afterwards.

**Stuck?**
- Buying the Baker changes `grandma cost` instead of `baker cost` - one of
  the four places still says `grandma cost`. Go along his script left to
  right and check all four: the oval in the `<`, the oval in the `-`, the
  oval in the `*`, and the name in the `set` dropdown at the bottom.
- Right after you duplicate her, the copy is just a second Grandma that
  buys Grandmas. That's expected - it's a copy, so it does exactly what she
  does until you've made all four edits. Work through steps 17 to 24 in
  order and it turns into a Baker.
- The Baker buys with no cookies at all, or refuses to buy however many
  you've got - a `(baker cost)` oval landed in the wrong slot of the
  `() < ()` block. It has to read `(cookies) < (baker cost)`: cookies on
  the left, `baker cost` on the right.
- You dragged an oval out and now there's a stray oval lying loose in the
  code area - that's the old one. Drag it onto the palette to throw it
  away.
- The Baker works but Grandma has stopped working, or the other way round -
  the edits went onto the wrong sprite. `Grandma` and `Baker` have
  near-identical code areas. Click the sprite in the sprite list first,
  every time, and read the name in the sprite info panel before you touch a
  block.

## Make it yours

- Who is your shopkeeper? Swap Grandma for a different sprite from the
  library, or give her a different pose by picking another costume.
- What should she cost to start with? `50` is only a suggestion - try the
  number in `set [grandma cost v] to (50)`.
- How steeply should prices climb? Change the `2` in
  `set [grandma cost v] to ((grandma cost) * (2))`. Try `3` for a brutal
  shop, or `1.5` for a gentle one.
- What is your Baker worth? Try a different number in
  `change [per second v] by (10)`.
- What does Grandma do when you buy her? Right now she takes your cookies in
  total silence. Give her something to say with a `say [] for () seconds`
  block from the *purple* Looks category, dropped into the mouth of the `if`
  on her script.
- Who else could your shop sell? Add a third shopkeeper, built the same way
  the `Baker` was - a new sprite, a new cost variable, and the same script
  shape - and decide for yourself what he costs and what he earns.
- Where does your shop live? Drag Grandma and the Baker around the stage,
  and drag the number readouts wherever you want them to sit.

**Got through all of those?** There are more in
`reference/extra-challenges.md`, sorted by how hard they are. The three-star
one is a build of your own: you get a goal and a rule, and the rest is yours
to work out. If you finish those too, `reference/bonus-ideas.md` has
directions nobody has built yet - including whoever wrote them.

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

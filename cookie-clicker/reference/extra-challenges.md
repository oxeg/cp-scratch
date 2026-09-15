# Extra challenges

Finished a milestone early and waiting for everyone else to catch up? Pick a
challenge below.

**Every challenge here is optional.** None of them are needed to finish the
course or to keep up next week — the game you build from the step cards is
the whole game. These are extra: a chance to make your *game* wider, not a
race to get ahead. Some of them do reach for a block you haven't met yet,
and that's fine — meeting one early spoils nothing about the week it turns
up in. Do one, do all of them, or do none — it's your game.

Nobody is telling you exactly which blocks to snap together. Each challenge
gives you a job to do and a hint about which blocks might help — the rest is
for you to work out. That's the fun part.

**Three rules.** These are for the ideas you think up yourself; every
challenge on this page has already been checked.

1. **Build it on a new sprite of its own.** Not on `Cookie` — your own
   sprite, with its own scripts. It keeps your game tidy, and it means
   nothing you build here can break what you made from the cards.
2. **Don't change the blocks the cards told you to build.** Add whatever you
   like alongside them — just leave those scripts as they are. Next week's
   cards expect to find them exactly how you left them.
3. **Some things are for later.** If your idea is a shop, or a cookie that
   appears on its own and gives you a bonus — good instinct. That's what
   weeks 2 and 3 are. Pick something else for now and you'll build it with
   everyone else.

**Difficulty:**
- **★** — change a number or a picture. Minutes. No new thinking.
- **★★** — needs a block you haven't used this way before, or a small idea.
  Roughly ten minutes.
- **★★★** — a side feature you build yourself, on your own sprite, from a
  goal and a constraint rather than a hint. Fifteen to twenty-five minutes.
  This is hard mode.

## Lesson 1 — Bake a cookie

### ★ Redecorate your game

Make `Cookie` look like yours rather than the one from the step cards, and
put the `cookies` readout wherever suits your stage.

**Hint:** For the cookie, open the Costumes tab and use the paint tools. If
you want to experiment without losing what you've already got, right-click
the costume in the Costumes list and duplicate it — a costume duplicate
doesn't drag anything else along with it, so it's safe to try things on the
copy. For the readout, drag it anywhere on the stage you like; right-click
it there and you'll find a **large readout** option too, if you want it to
stand out more.

### ★ Pick your own sound

Give `Cookie` a click sound that's your choice, not whatever came with it.

**Hint:** Open the Sounds tab, add a new sound from the sound library —
whatever feels satisfying to click — and read its name once you've picked
it. Then point the *pink* Sound `start sound` block's dropdown at that name
instead of the old one.

**Checked for you:** this one does change a script the cards built. That's
fine here because somebody has checked it against the rest of the course —
it isn't something to do off your own bat.

### ★ Tune how it feels

Decide exactly how hard your cookie squashes when you click it, and what
your `Special Cookie` is worth.

**Hint:** The squash lives in `Cookie`'s click script, in the number on
`set size to (110) %` — further from 100 makes a bigger squash, closer to
100 a tinier one. What `Special Cookie` earns is the number on its own
`change [cookies v] by (10)` block; 10 was only ever a suggestion.

**Checked for you:** this one does change a script the cards built. That's
fine here because somebody has checked it against the rest of the course —
it isn't something to do off your own bat.

### ★★ Show your best score

Your score drops to 0 every time somebody presses the green flag, and the
best run of the afternoon vanishes with it. Keep a record that survives:
a number showing the highest `cookies` has ever been, which stays put
however many times the game starts again.

**Hint:** Make a variable called `best` — the **Make a Variable** button in
the *orange* Variables palette, **For all sprites** chosen, exactly how you
made `cookies`. Something has to keep an eye on `cookies` the whole time
the game is running, so the blocks in play are the *amber* Control ones
`forever` and `if <> then`, a *green* Operators `() > ()` to do the
comparing, and an orange `set` block to write a new record down. It needs a
*yellow* Events `when green flag clicked` on it as well: a stack with no hat
block never starts by itself, and you'd be left staring at blocks that do
nothing. Give it a sprite of its own to live on: draw a rosette or a
trophy, or find something prize-shaped in the sprite library and check what
it's actually called once you're browsing.

**Worth noticing:** go looking for the block that puts `best` back to 0.
There isn't one anywhere in your game — work out why that's the whole
trick.

### ★★ Your cookie has opinions

Give your game a character who watches the score and has something to say
about it — mild encouragement at 10 cookies, disbelief at 500, something
rude at 5000. The numbers are yours. What matters is that what it says
changes as the score climbs.

**Hint:** Any sprite from the library will do, or draw your own — if you
pick one from the library, read the name it turns out to have while you're
browsing, since it may not be called what you expect. The *purple* Looks
block `say [] for () seconds` is how it talks. Working out *when* it talks
is a *green* Operators `() > ()`, the `(cookies)` oval, and an *amber*
Control `if <> then` — and something has to keep that checking going all
game long, which is what `forever` is for. It wants a *yellow* Events
`when green flag clicked` on top, the same as every script that has to start
on its own.

**Watch out:** `say [] for () seconds` holds up its own script for the whole
time the bubble is showing, so the loop can't race ahead of it. What happens
instead is quieter and easier to miss: a character with nothing else to slow
it down starts the same sentence again the instant it finishes, so the
bubble never leaves the screen. An *amber* Control `wait () seconds` is the
block that fixes that. How long your character stays quiet between remarks
is your call.

### ★★★ How fast can you click?

Build a meter that shows how many cookies the last second earned you — a
number that leaps while you're hammering the cookie and sinks back to
nothing the moment you stop.

**Hint:** Two variables, both made the way you made `cookies`, both **For
all sprites**. `click speed` is the one you show off. `last count` is the
awkward one: it holds what `cookies` said a second ago. The blocks in play
are a *yellow* Events `when green flag clicked`, a *green* Operators
`() - ()`, orange `set` blocks, and the *amber* Control pair
`wait () seconds` and `forever`. Give the whole thing a sprite
of its own to sit on — a dial, a speedometer, a little sign beside the
readout.

**Why this is the week's hard one:** nothing in a computer remembers a
second ago unless something wrote it down. Your meter is the difference
between what `cookies` is now and what `cookies` was — which means
`last count` has to be brought up to date every single time round the loop,
or the meter is measuring the wrong gap and the number only ever climbs.
Keep `last count` ticked on the stage while you're testing so you can watch
it move; untick it once you trust it and leave just the meter showing.

**Once your shop exists:** helpers bake cookies too, so what this really
measures is everything the last second earned — your clicks and your
Grandmas together. Whether that's a bug or a feature is for you to decide.

## Lesson 2 — The shop

### ★ Dress up your shop

Choose what your shopkeeper looks like, and decide where everything on your
stage lives.

**Hint:** `Grandma` can wear a different look — open her Costumes tab and
either edit the costume she has or choose a new one from the costume
library. Once she looks the part, drag her, the `Baker`, and the number
readouts anywhere on the stage that suits your layout.

### ★ Tune the shop's economy

Decide how much `Grandma` costs to start with, how steeply prices climb
every time someone buys her or the `Baker`, and how much the `Baker` earns
you.

**Hint:** Her starting price is the number on `Cookie`'s
`set [grandma cost v] to (50)` block. How steeply prices climb is the `2`
inside `set [grandma cost v] to ((grandma cost) * (2))`, on her own
`when this sprite clicked` script — the `Baker` has a script shaped just
the same way, with its own number, and you can set the two differently if
you want one of them to get expensive faster than the other. What the
`Baker` earns is the number on his `change [per second v] by (10)` block.

**Checked for you:** this one does change a script the cards built. That's
fine here because somebody has checked it against the rest of the course —
it isn't something to do off your own bat.

### ★★ Make Grandma say thanks

Right now, buying `Grandma` or the `Baker` happens in total silence —
nothing on the stage marks it, beyond the numbers changing. Give one of
them something to say when they're bought.

**Hint:** The *purple* Looks category has a `say [] for () seconds` block.
It belongs somewhere inside the mouth of the `if` on the shopkeeper's
`when this sprite clicked` script — the same `if` that already takes their
payment and raises their price.

**Checked for you:** this one does change a script the cards built. That's
fine here because somebody has checked it against the rest of the course —
it isn't something to do off your own bat.

### ★★ A sign that lights up

Put a sign on your stage that shows itself only while you can actually
afford a Grandma, and takes itself away again the moment you can't. Nobody
clicks it and it buys nothing — its whole job is to tell you, from across
the room, that the shop is worth a look.

**Hint:** Draw your own sign sprite — "GRANDMA!", a big arrow, a light,
whatever you'd notice out of the corner of your eye. The condition you need
is the one you wrestled with in Milestone 2, unchanged:
`<not <(cookies) < (grandma cost)>>`, built from the *green* Operators
`not <>` and `() < ()` with the `(cookies)` and `(grandma cost)` ovals
dropped into it. That is what makes this challenge worth doing — the exact
test that decides whether a purchase goes through also decides whether a
sign is worth showing, and it has no idea it's doing a second job. The
*purple* Looks blocks `show` and `hide` do the appearing and disappearing, a
*yellow* Events `when green flag clicked` gets the whole thing running, an
*amber* Control `forever` keeps the sign paying attention, and two
`if <> then` blocks with opposite conditions are enough — there's no block
here that isn't on your cheat sheet.

**Watch out:** hiding *sticks*. A sprite that has hidden itself stays
hidden. The green flag does not undo it — only a `show` block that
actually runs, or the button below, puts a sprite back on the stage. If
you want your sign visible again while you're editing, click it in the
sprite list and use the open-eye **show** button in the sprite info panel,
the strip above the sprite list — check the exact spot in your editor,
since it can look a little different depending on the version.

### ★★★ A third shopkeeper

Add a third thing to buy in your shop — a new helper who bakes even more
cookies a second, at a price of their own.

**Hint:** You've already built this shape of script once, when the `Baker`
was made from a copy of `Grandma`, so the same trick works again: a new
sprite, a new cost variable made "for all sprites" (Grandma's `grandma
cost` and the Baker's `baker cost` are your models), and the same
`if <not <() < ()>> then` pattern with its `() - ()` and `() * ()` blocks
pointing at your new cost variable instead of either of theirs. Decide for
yourself what he costs to start, how steeply that price climbs, and how
many cookies a second he adds to `per second`.

## Lesson 3 — Golden cookies

### ★ Tune when golden cookies show up

Decide how often a golden cookie appears, and how long one sits there
before it vanishes.

**Hint:** How often is the two numbers inside `pick random (15) to (30)`,
in `Special Cookie`'s `when green flag clicked` script. How long one
lingers is the `5` in `wait (5) seconds`, in its `when I start as a clone`
script.

**Checked for you:** this one does change a script the cards built. That's
fine here because somebody has checked it against the rest of the course —
it isn't something to do off your own bat.

### ★ Tune the sugar rush

Decide how big a sugar rush should be, and how long one should last.

**Hint:** How big it is the `2` in `set [bonus v] to (2)`, inside `Cookie`'s
`when I receive [sugar rush v]` script — leave the other
`set [bonus v] to (1)` alone, since 1 is what "no rush" means. How long it
lasts is the `10` in that same script's `wait (10) seconds`.

**Checked for you:** this one does change a script the cards built. That's
fine here because somebody has checked it against the rest of the course —
it isn't something to do off your own bat.

### ★ Give your golden cookie a look of its own

Make `Special Cookie` look like something worth chasing across the stage —
a star, a crown, a shine, whatever says "grab me."

**Hint:** Open its Costumes tab and paint over the gold circle you already
made there.

### ★★ Give the rush a beginning and an end

Decide what tells a player a sugar rush has started — a sound, words in a
speech bubble, a change of backdrop, or all three at once — and give the
end of the rush a signal of its own too, since right now `bonus` just
quietly drops back to 1 with nothing marking it.

**Hint:** If you haven't built Milestone 3 yet, its pattern is the one to
copy for the start: a `start sound` block (Sound) and either a
`say [] for () seconds` or a `switch backdrop to []` block (Looks),
living inside `Cookie`'s `when I receive [sugar rush v]` script, near where
`bonus` is set to `2`. For the ending, the same kinds of blocks belong near
the bottom of that script, where `bonus` is set back to `1` — just make
them different from whatever marks the start, so the two moments don't feel
the same.

**Checked for you:** this one does change a script the cards built. That's
fine here because somebody has checked it against the rest of the course —
it isn't something to do off your own bat.

### ★★ A bigger milestone

`cookie master` fires once, just past 1000 cookies. Add a second message
for an even bigger number.

**Hint:** The pattern is the one you already built for `cookie master`: a
*yellow* Events `when green flag clicked` with a `wait until <>` block under
it, holding a *green* Operators `() > ()` block with the `(cookies)` oval
inside it, then a `broadcast` with a message of your own, and a
`when I receive` script somewhere that reacts to it — a
`say [] for () seconds` block works, or anything else you fancy. Pick your
own bigger number and your own message name — just don't call it
`cookie master` again, or you'll be answering the wrong shout.

**Checked for you:** this one lives on `Cookie` rather than a sprite of its
own. That's fine here because somebody has checked it against the rest of
the course — it isn't something to do off your own bat.

### ★★★ A second kind of golden cookie

Your golden cookie doubles everything for ten seconds. Add a second kind
alongside it — rarer, and looking nothing like your gold one — that does
something else entirely: an instant pile of cookies, the whole lot at once,
the moment somebody catches it.

**Two constraints, and they matter more than anything else on this page:**

- It hands out its own reward, from its own click script. It may **not**
  shout `sugar rush`. Two things shouting the same message means you can
  never tell which one a rush came from.
- It leaves `bonus` completely alone — doesn't set it, doesn't read it.
  Your click script and your per-second script both depend on `bonus`, and
  the `when I receive [sugar rush v]` script is the only thing in the game
  allowed to change it. A second sprite writing to it turns your sugar rush
  into something nobody can predict, including you.

**Hint:** Right-click `Special Cookie` in the sprite list, choose
**Duplicate**, and give the copy a name of your own. Duplicating a
*sprite* is the safe kind of duplicating — unlike duplicating a block, a
sprite copy brings along nothing you didn't ask for — and your copy arrives
with its own spawner, its own clone script and its own click script, none
of them joined to the original's in any way. Every number in the copy is
yours: the `pick random () to ()` numbers in its spawner decide how rare it
is, the `wait () seconds` in its clone script decides how long you get to
catch one, and its Costumes tab is where it stops being a gold circle. The
reward itself is one orange `change [cookies v] by ()` block. How big the
pile is, is your decision — and worth some thought, because it has to feel
*different* from a sugar rush, not just better than one.

**Watch out:** the copy's click script still shouts `sugar rush` today, and
that `broadcast` block has `delete this clone` sitting underneath it.
Dragging a block brings everything below it along, so work out what travels
with what before you pull anything anywhere. And keep your hands off the
real `Special Cookie` while you're in there — those are the scripts
Milestone 2 built, and until you've renamed and repainted the copy, the
sprite list is the only thing telling the two apart.

**If your golden cookie needed the other shape** — the
`when I start as a clone` version with `touching [mouse-pointer v]?` and
`mouse down?` in it, from the Milestone 2 `Stuck?` box — your copy has that
shape too, because a copy copies whatever was there. Both constraints
above apply to it in exactly the same way.

# Extra challenges

Finished a milestone early and waiting for everyone else to catch up? Pick a
challenge below.

**Every challenge here is optional.** None of them are needed to finish the
course or to keep up next week — the game you build from the step cards is
the whole game. These are extra: a chance to go *wider* with what you already
know, not a race to get ahead. Do one, do all of them, or do none — it's your
game.

Nobody is telling you exactly which blocks to snap together. Each challenge
gives you a job to do and a hint about which blocks might help — the rest is
for you to work out. That's the fun part.

**Difficulty:**
- ★ — quick, you'll probably have it in a couple of minutes
- ★★ — takes a bit of thinking
- ★★★ — a proper challenge, give yourself some time

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

### ★ Tune how it feels

Decide exactly how hard your cookie squashes when you click it, and what
your `Special Cookie` is worth.

**Hint:** The squash lives in `Cookie`'s click script, in the number on
`set size to (110) %` — further from 100 makes a bigger squash, closer to
100 a tinier one. What `Special Cookie` earns is the number on its own
`change [cookies v] by (10)` block; 10 was only ever a suggestion.

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

### ★★ Make Grandma say thanks

Right now, buying `Grandma` or the `Baker` happens in total silence —
nothing on the stage marks it, beyond the numbers changing. Give one of
them something to say when they're bought.

**Hint:** The *purple* Looks category has a `say [] for () seconds` block.
It belongs somewhere inside the mouth of the `if` on the shopkeeper's
`when this sprite clicked` script — the same `if` that already takes their
payment and raises their price.

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

### ★ Tune the sugar rush

Decide how big a sugar rush should be, and how long one should last.

**Hint:** How big it is the `2` in `set [bonus v] to (2)`, inside `Cookie`'s
`when I receive [sugar rush v]` script — leave the other
`set [bonus v] to (1)` alone, since 1 is what "no rush" means. How long it
lasts is the `10` in that same script's `wait (10) seconds`.

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

### ★★ A bigger milestone

`cookie master` fires once, just past 1000 cookies. Add a second message
for an even bigger number.

**Hint:** The pattern is the one you already built for `cookie master`: a
`wait until <>` block holding a *green* Operators `() > ()` block with the
`(cookies)` oval inside it, a `broadcast` with a message of your own, and a
`when I receive` script somewhere that reacts to it — a
`say [] for () seconds` block works, or anything else you fancy. Pick your
own bigger number and your own message name — just don't call it
`cookie master` again, or you'll be answering the wrong shout.

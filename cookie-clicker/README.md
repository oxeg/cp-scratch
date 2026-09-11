# Scratch Cookie Clicker — a 3-lesson course

A three-lesson course that teaches programming basics to total-beginner
~12-year-olds by building one Scratch project: an idle cookie-clicker game.
Click a cookie to bake cookies, buy helpers who bake for you while you sit
there, and catch golden cookies for a bonus. One cloud project, one
scratch.mit.edu account per kid, growing across three 90-minute sessions.
Every lesson ends with a playable game the kid can show a parent.

## Before you teach this

**This is the most important section in this README, which is why it is
first. Read it before you run a session, not after something breaks in front
of the kids.**

This material was written from knowledge of Scratch — **it has not been
verified by actually building the game in a real Scratch editor.** Nothing
below has been watched working. Work through the checklist yourself, ideally
by building the whole game once before the first session, before you teach
it to anyone.

**The first item is the one that matters most.** Lesson 3's floor — the
golden cookie, which is that whole lesson's game — rests on a clone
responding to `when this sprite clicked`. If it doesn't, there is a fallback
written out in full in Lesson 3's instructor plan and in the card's `Stuck?`
box, and it costs about four minutes of whole-room teaching. Five minutes in
the editor before the session tells you which world you are in.

**Behaviour to confirm in a real editor — do not tick these on anybody
else's behalf:**

- [ ] **A clone responds to `when this sprite clicked`.** Lesson 3's floor
      rests on this. Fallback if not: a `forever` loop testing
      `touching (mouse-pointer v)?` and `mouse down?`.
- [ ] A freshly painted sprite arrives with a sound in its Sounds tab, and
      what that sound is called (`pop` is the guess in the material).
- [ ] Rapid clicking does not leave the cookie permanently inflated, and
      does not stall the counter.
- [ ] The squash looks right on a `Cookie` whose Size field is 100, and
      `Special Cookie` at Size 50 does not jump to 110 when clicked.
- [ ] `not <(cookies) < (grandma cost)>` allows buying at *exactly* the
      price, not one cookie over.
- [ ] Doubling prices stay reachable in a 90-minute session — 50, 100, 200,
      400.
- [ ] Two green-flag scripts on `Cookie` both run.
- [ ] `delete this clone` in the clicked script does not kill
      `broadcast [sugar rush v]` before anything receives it.
- [ ] A second golden cookie clicked mid-rush extends the rush rather than
      ending it early, and pressing the green flag during a rush leaves
      `bonus` at 1.
- [ ] `wait until <(cookies) > (999)>` fires once and does not repeat.

**The asset-name checklist is nearly empty, and that is by design.** The
cookie is painted by the kid in the paint editor, the golden cookie is a
recoloured copy of it, and every other sprite and backdrop in the course is
"pick any you like" — no name in the material, and no two kids' games need
to match. The only library name this material guesses at anywhere in three
lessons is the click sound a freshly painted sprite arrives with, which the
Lesson 1 cards call `pop` and then tell the kid to read the real name off
their own Sounds tab. That is the second item above, and it is the whole
asset checklist. Where later lessons add a sound or a second backdrop, the
cards have the kid pick one and read its own name back — so nothing else
here can be wrong about a name, because nothing else here names anything.

**Timing:** the per-lesson timing tables are estimates, not measurements —
**they were derived by counting the numbered steps in each step-cards file
and multiplying by a seconds-per-step figure, not by running a real
session.** All three instructor plans show that arithmetic explicitly, in a
"where those minutes come from" list under the table, including which rows
are deliberately budgeted off the nominal rate and why. The rates are 42
seconds a step in week one, 35 in week two and 28 in week three. Note actual
times on your first run and adjust. The likeliest overruns are Lesson 1's
paint-the-cookie milestone and Lesson 2, milestone 2.

### Checking the shape by hand

There is no script for this. A reviewer confirms three things by hand:

- Each `step-cards.md` has exactly four `## Milestone` headings, each
  followed by a `**Check it works**` line and a `**Stuck?**` line.
- Each `instructor-plan.md`'s timing table is contiguous, starts at `0:00`,
  ends at `1:30`, and sums to 90 minutes.
- No `TODO`, `TBD`, `FIXME` or `XXX` anywhere.

Set `$F` to one of this course's documents — for example
`F=cookie-clicker/lesson-1-bake-a-cookie/step-cards.md` for a
`step-cards.md`, or
`F=cookie-clicker/lesson-1-bake-a-cookie/instructor-plan.md` for an
`instructor-plan.md` — and run:

```bash
# 1. Milestone scaffolding — all three must print 4
grep -c '^## Milestone' "$F"; grep -c '^\*\*Check it works' "$F"; grep -c '^\*\*Stuck?' "$F"

# 2. Placeholder scan — must print "clean"
grep -nE 'TODO|TBD|FIXME|XXX' "$F" || echo clean

# 3. Timing table — must print contiguous=True sum=90 start=0:00 end=1:30
grep -oE '^\| [0-9]:[0-9]{2}-[0-9]{1}:[0-9]{2}' "$F" | sed 's/^| //' | python3 -c '
import sys
def m(t):
    h, mm = t.split(":"); return int(h)*60 + int(mm)
rows = [l.strip() for l in sys.stdin if l.strip()]
tot = 0; prev = 0; ok = bool(rows)
for r in rows:
    a, b = r.split("-")
    if m(a) != prev: ok = False
    tot += m(b) - m(a); prev = m(b)
print(f"rows={len(rows)} sum={tot} contiguous={ok} start={rows[0].split(chr(45))[0]} end={rows[-1].split(chr(45))[1]}")
'

# 4. Steps per milestone — advisory, feeds the timing arithmetic
awk '/^## Milestone/{m=$0; c=0} /^[0-9]+\./{c++} /^\*\*Check it works/{print c" steps  "m}' "$F"
```

Commands 1, 2 and 4 want a `step-cards.md`; command 3 wants an
`instructor-plan.md`. **None of this says anything about whether the
material teaches well, is correct about Scratch, or fits in 90 minutes.**
Passing these checks is not a substitute for the checklist above.

## The three lessons

| | New idea | Take-home game |
|---|---|---|
| **Lesson 1 — Bake a cookie** | Variables + `when this sprite clicked` | A hand-painted cookie that counts every click, pops and squashes |
| **Lesson 2 — The shop** | `if` + Operators, and a variable fed back into itself | An idle game: buy a Grandma, watch prices double, watch cookies bake themselves |
| **Lesson 3 — Golden cookies** | Clones + broadcasts | Golden cookies that appear at random and double everything for ten seconds |

**What Lesson 3 actually delivers, so nobody over-promises at 0:05.**
Everyone gets the golden cookie: Milestones 1 and 2, a gold cookie that pops
up somewhere random every fifteen to thirty seconds, sits there for five
seconds, and gives a ten-second sugar rush when it's clicked. That is Lesson
3's floor and it is a visibly better game than the one they took home from
Lesson 2. Making the rush loud (Milestone 3) and the "Cookie Master!"
message at a thousand cookies (Milestone 4) share one 15-minute slot that
cannot hold both, and they are named *further targets* on the card and in
the plan for that reason — on the step counts, most of the room will not
finish Milestone 4. Describe the golden cookie as "today's game" and the
other two as extra, and say it before anybody opens their project. Lesson
3's instructor plan gives you the words; read it.

Each lesson has an `instructor-plan.md` (minute-by-minute timing, what to
demo, sticking points, "make it yours" prompts) and a `step-cards.md`
(numbered, one-action-per-step instructions to print and hand to each kid).

## Running a session

Every lesson follows the same 90-minute shape, on purpose — kids learn the
rhythm:

- **~8 to 10 min** — recap and demo of the game they'll have by the end of today
- **~65 min** — hands-on, working from their step cards, instructor(s) circulating
- **~5 to 6 min** — "make it yours" (a few pre-planned personalisation prompts, in each instructor plan)
- **~8 to 9 min** — play each other's games, save, wrap up

Lessons 1 and 2 each hold a short **deliberate detour** where the cards let
a kid meet a disappointment before they get the block that fixes it — the
counter that won't reset in Lesson 1, and the Grandma who is bought and then
does nothing in Lesson 2. Both are in the timing tables as their own rows,
and both instructor plans say not to cut them or to "help" a kid past them.
They are the two moments in the course where an idea lands rather than a
block gets dragged.

### Orientation, if you're new to teaching Scratch

The step cards refer to the **code area** (the middle panel where you drag
blocks to build a script) and the **palette** (the panel of coloured block
categories you drag blocks *from*, on the left of the code area). If a kid
asks "where's the code area?", that's the one they mean. Each step-cards
file opens with a short glossary of these words for the kid — Lessons 2 and
3 add *oval* and *mouth*, and Lesson 3 adds *undo* and *clone* — so you are
not the only copy of that information in the room.

### Saving, every week

The whole course is one cloud project growing across three weeks, so a kid
who closes the tab without saving loses the week and cannot follow the next
lesson's cards. Each step-cards file ends with a numbered **Before you log
off** save step, and all three instructor plans end with a volunteer
instruction to walk the room and confirm every project actually saved. Do
that — it is the single cheapest thing you can do to protect the next
session, and on the last day it is the save that decides whether the kid
keeps their game at all.

## What to print

- **Step cards** — one copy per kid, per lesson.
- **`reference/block-cheat-sheet.md`** — one copy per table. Every block
  used across all three lessons, grouped by palette colour, with a
  one-line plain-English meaning.

## What kids need

- Their own scratch.mit.edu account, logged in.
- **A mouse, or a trackpad. That is the whole list of input.** Once a kid is
  logged in, nothing in the finished game is triggered by a key — every
  cookie, shopkeeper and golden cookie is clicked. The course survives a
  room with flaky keyboards, and a kid on a touchscreen can still play what
  they built. They do still type while *building* — variable names, prices,
  and a couple of messages — but no key is ever a game control.
- Sound. Lesson 1's click sound is part of that lesson's floor, and Lesson
  3's optional Milestone 3 adds a second sound for the sugar rush.

## Staffing

Roughly **one volunteer per six kids** during hands-on time. The step cards
are written to be self-serve — each milestone has a "Check it works" box and
a "Stuck?" box covering the most likely failures, including several that
have no visible symptom and are written as deliberate count-the-scripts
checks — but fewer volunteers means those boxes carry more of the weight.

## Finished early?

Fast kids go *wider*, not *ahead* — point them at
`reference/extra-challenges.md`, which has per-lesson challenges ranked by
difficulty. Each one names the blocks that might help and never the order
they go in, so a kid who finishes one has worked something out rather than
followed another card.

# Scratch Space Shooter — a 3-lesson course

A three-lesson course that teaches programming basics to total-beginner
~12-year-olds by building one Scratch project: a top-down space shooter. One
cloud project, one scratch.mit.edu account per kid, growing across three
90-minute sessions. Every lesson ends with a playable game the kid can show a
parent.

## Before you teach this

**This is the most important section in this README, which is why it is
first. Read it before you run a session, not after something breaks in front
of the kids.**

This material was written from knowledge of Scratch — **it has not been
verified by actually building the game in a real Scratch editor.** Several
sprite, backdrop and sound names in the step cards and instructor plans are
best guesses, clearly flagged in the text as guesses with an instruction to
check the actual name in the library — but a guess is still a guess until
someone confirms it. Work through the checklist below yourself, ideally by
building the whole game once before the first session, before you teach it
to anyone.

**Asset names to confirm** (best guesses in this material — all need
confirming against the real Scratch library):

- [ ] The rocket sprite — exact name in the library
- [ ] A suitable round/rock sprite for `Asteroid` — exact name
- [ ] A suitable enemy sprite — exact name (the Lesson 3 cards deliberately
      tell kids to go by the picture rather than a name, because there isn't
      a dependable one; check there is *something* usable in your version)
- [ ] The space backdrop — exact name
- [ ] Sound names used (`pop`, laser and crash sounds) — exact names

**Scripts to build and run — confirm each behaves as described:**

- [ ] L1 movement: smooth, diagonals work, ship stays visible
- [ ] L2 laser clones fire, travel up, disappear at the top
- [ ] L2 asteroid clones spawn across the full stage width and disappear at the bottom
- [ ] L2 `touching Laser` reliably registers with the drawn laser size
- [ ] L2 game over triggers at exactly 0 lives (not skipped past into
      negatives). If it skips past, the remedy is `if <(lives) < (1)>`
      instead of `if <(lives) = (0)>` — it's in both instructor plans and
      both `Stuck?` boxes, but confirm it for yourself
- [ ] L3 enemy respawns correctly when shot
- [ ] L3 `EnemyLaser` appears at the enemy's actual position
- [ ] L3 spawn gap ramp stays playable at high scores
- [ ] L3 backdrop resets to space on a second play-through

**Timing:** the per-lesson timing tables are estimates, not measurements —
**they were derived by counting the numbered steps in each step-cards file
and multiplying by a seconds-per-step figure, not by running a real
session.** Lesson 3's instructor plan shows that arithmetic explicitly.
Note actual times on your first run and adjust. The likeliest overruns are
Lesson 2, milestone 2, and Lesson 1's setup block if logins are slow.

**A shape checker:** `tools/check-materials.sh all` verifies the mechanical
things — no leftover placeholder markers, each instructor plan's timing table
contiguous from `0:00` to `1:30` and summing to 90 minutes, each step-cards
file having exactly four milestones each with a "Check it works" and a
"Stuck?" box. It also prints an advisory count of numbered steps per
milestone, which is the quickest way to spot a milestone that has quietly
grown. **It says nothing at all about whether the material teaches well, is
correct about Scratch, or fits in 90 minutes.** A passing run is not a
substitute for the checklist above. Run it from anywhere: `./tools/check-materials.sh all`.

## The three lessons

| | New idea | Take-home game |
|---|---|---|
| **Lesson 1 — Fly the ship** | `forever` loop + `if key pressed` | A ship you can fly around space |
| **Lesson 2 — Shoot and survive** | Clones | An arcade shooter with score and lives |
| **Lesson 3 — Enemies and polish** | Broadcasts + variables driving difficulty | An enemy ship that flies across the top and shoots back |

**What Lesson 3 actually delivers, so nobody over-promises at 0:05.**
Everyone gets the enemy: Milestones 1 and 2, an enemy that glides across the
top, takes laser hits for 5 points, and fires bolts back at the ship. That is
Lesson 3's floor and it is a visibly better game than the one they took home
from Lesson 2. The difficulty ramp (Milestone 3) and the game-over screen
plus sound effects (Milestone 4) are named optional targets, reached inside
the same build slot by kids who get there — and on the step counts, most
won't. Describe the enemy as "today's game" and the other two as extra.
Lesson 3's instructor plan says the same thing at more length; read it.

Each lesson has an `instructor-plan.md` (minute-by-minute timing, what to
demo, sticking points, "make it yours" prompts) and a `step-cards.md`
(numbered, one-action-per-step instructions to print and hand to each kid).

## Running a session

Every lesson follows the same 90-minute shape, on purpose — kids learn the
rhythm:

- **~10 min** — recap and demo of the game they'll have by the end of today
- **~60 min** — hands-on, working from their step cards, instructor(s) circulating
- **~10 min** — "make it yours" (a few pre-planned personalisation prompts, in each instructor plan)
- **~10 min** — play each other's games, save, wrap up

### Orientation, if you're new to teaching Scratch

The step cards refer to the **code area** (the middle panel where you drag
blocks to build a script) and the **palette** (the panel of coloured block
categories you drag blocks *from*, on the left of the code area). If a kid
asks "where's the code area?", that's the one they mean. Each step-cards
file now opens with a short glossary of these words for the kid, so you are
not the only copy of that information in the room.

### Saving, every week

The whole course is one cloud project growing across three weeks, so a kid
who closes the tab without saving loses the week and cannot follow the next
lesson's cards. Each step-cards file ends with a numbered **Before you log
off** save step, and Lessons 1 and 2 end with a volunteer instruction to
walk the room and confirm every project actually saved. Do that — it is the
single cheapest thing you can do to protect the next session.

## What to print

- **Step cards** — one copy per kid, per lesson.
- **`reference/block-cheat-sheet.md`** — one copy per table. Every block
  used across all three lessons, grouped by palette colour, with a
  one-line plain-English meaning.

## What kids need

- Their own scratch.mit.edu account, logged in.
- A keyboard (the game is keyboard-only; no tablet/mobile support).
- Sound (Lesson 3's optional Milestone 4 adds sound effects).

## Staffing

Roughly **one volunteer per six kids** during hands-on time. The step cards
are written to be self-serve — each milestone has a "Check it works" box and
a "Stuck?" box covering the two or three most likely failures — but fewer
volunteers means those boxes carry more of the weight.

## Finished early?

Fast kids go *wider*, not *ahead* — point them at
`reference/extra-challenges.md` for optional, purely cosmetic/tuning
challenges per lesson, ranked by difficulty.

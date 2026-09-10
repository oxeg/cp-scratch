# Scratch Space Shooter — a 3-lesson course

A three-lesson course that teaches programming basics to total-beginner
~12-year-olds by building one Scratch project: a top-down space shooter. One
cloud project, one scratch.mit.edu account per kid, growing across three
90-minute sessions. Every lesson ends with a playable game the kid can show a
parent.

## The three lessons

| | New idea | Take-home game |
|---|---|---|
| **Lesson 1 — Fly the ship** | `forever` loop + `if key pressed` | A ship you can fly around space |
| **Lesson 2 — Shoot and survive** | Clones | An arcade shooter with score and lives |
| **Lesson 3 — Enemies and polish** | Broadcasts + variables driving difficulty | The finished game: enemies, sound, a game-over screen |

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
asks "where's the code area?", that's the one they mean.

## What to print

- **Step cards** — one copy per kid, per lesson.
- **`reference/block-cheat-sheet.md`** — one copy per table. Every block
  used across all three lessons, grouped by palette colour, with a
  one-line plain-English meaning.

## What kids need

- Their own scratch.mit.edu account, logged in.
- A keyboard (the game is keyboard-only; no tablet/mobile support).
- Sound (Lesson 3 adds sound effects).

## Staffing

Roughly **one volunteer per six kids** during hands-on time. The step cards
are written to be self-serve — each milestone has a "Check it works" box and
a "Stuck?" box covering the two or three most likely failures — but fewer
volunteers means those boxes carry more of the weight.

## Before you teach this

**This is the most important section in this README. Read it before you run
a session, not after something breaks in front of the kids.**

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
- [ ] A suitable enemy sprite — exact name
- [ ] The space backdrop — exact name
- [ ] Sound names used (`pop`, laser and crash sounds) — exact names

**Scripts to build and run — confirm each behaves as described:**

- [ ] L1 movement: smooth, diagonals work, ship stays visible
- [ ] L2 laser clones fire, travel up, disappear at the top
- [ ] L2 asteroid clones spawn across the full stage width and disappear at the bottom
- [ ] L2 `touching Laser` reliably registers with the drawn laser size
- [ ] L2 game over triggers at exactly 0 lives (not skipped past into negatives)
- [ ] L3 enemy respawns correctly when shot
- [ ] L3 `EnemyLaser` appears at the enemy's actual position
- [ ] L3 spawn gap ramp stays playable at high scores
- [ ] L3 backdrop resets to space on a second play-through

**Timing:** the per-lesson timing tables are estimates, not measurements.
Note actual times on your first run and adjust. The likeliest overrun is
Lesson 2, milestone 2.

## Finished early?

Fast kids go *wider*, not *ahead* — point them at
`reference/extra-challenges.md` for optional, purely cosmetic/tuning
challenges per lesson, ranked by difficulty.

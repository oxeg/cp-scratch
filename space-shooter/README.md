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

### Checking the shape by hand

There is no script for this any more. A reviewer confirms three things by
hand:

- Each `step-cards.md` has exactly four `## Milestone` headings, each
  followed by a `**Check it works**` line and a `**Stuck?**` line.
- Each `instructor-plan.md`'s timing table is contiguous, starts at `0:00`,
  ends at `1:30`, and sums to 90 minutes.
- No `TODO`, `TBD`, `FIXME` or `XXX` anywhere.

Set `$F` to one of this course's documents — for example
`F=space-shooter/lesson-1-fly-the-ship/step-cards.md` for a `step-cards.md`,
or `F=space-shooter/lesson-1-fly-the-ship/instructor-plan.md` for an
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

## Sharing the slides with GitHub Pages

Each lesson has a deck — four slides, one per milestone, showing the
finished script as real Scratch blocks. Drive it on the projector; hand the
link to kids who run ahead so they have it in a second tab.

**The decks live under `s/` at the repo root, not beside their step
cards.** That's deliberate, not a leftover — see cookie-clicker's README,
under the same heading, for the full reasoning (GitHub Pages has no
server-side rewriting, so a short URL with no redirect bounce means the
content has to actually live there). Every deck in the repository, both
courses, links the one shared stylesheet at `s/slides.css` the same way
(`../slides.css`).

**Turning it on** is a repo setting, done once: **Settings → Pages → Build
and deployment → Deploy from a branch**, then pick `main` and the
`/ (root)` folder. On a free plan the repo must be **public** for Pages to
serve it — which it needs to be anyway, so a kid can open the link without a
GitHub account. (If cookie-clicker's Pages site is already turned on, this
course is served from the same setting — nothing more to do.)

**This repo is served from its own domain, `cp.oxeg.dev`**, not the default
`oxeg.github.io/cp-scratch` — the root-level `CNAME` file plus DNS and the
Pages custom-domain setting cover the whole repo at once. Full details and
the DNS record are in cookie-clicker's README, under the same heading;
nothing course-specific to redo here.

Give it a minute after the first push, then the lesson decks are at:

```
https://cp.oxeg.dev/s/space_l1          Lesson 1 — Fly the Ship
https://cp.oxeg.dev/s/space_l2          Lesson 2 — Shoot and Survive
https://cp.oxeg.dev/s/space_l3          Lesson 3 — Enemies and Polish
```

and the two reference decks — the block cheat sheet drawn as real Scratch
blocks, and the extra challenges as hints rather than step cards — are at:

```
https://cp.oxeg.dev/s/space_cheatsheet  Reference — block cheat sheet
https://cp.oxeg.dev/s/space_extra       Reference — extra challenges
```

Slugs don't carry a `cp_` prefix — the `cp.oxeg.dev` domain already says
that. Those links are worth putting somewhere a volunteer can find in a
hurry — the club's chat, or written on the board at the start of a session.
Each lesson deck also has **"← Lesson N / Lesson N →" links**, appearing in
its top bar once you reach the last milestone, so clicking on to the next
lesson doesn't depend on knowing its slug.

This course has no `bonus-ideas.md` and so no deck for one — that document
is a cookie-clicker-specific extension.

**The `.nojekyll` file in the repo root is deliberate — don't delete it.**
Without it, GitHub runs the pages through Jekyll before serving them, which
adds a processing step these files don't need and don't benefit from. The
empty file switches that off, so every file is served exactly as committed.

**The one thing that catches people out:** Pages serves what has been
*pushed*, not what is on your laptop. A deck you edited this morning and
haven't pushed is not the deck the kids are looking at. If a change doesn't
show up, check `git status` before you go looking for anything cleverer —
and remember a browser will happily show you a cached copy of the old one.

### Keeping the reference decks and their documents in step

`s/space_cheatsheet` and `s/space_extra` are screen versions of
`space-shooter/reference/block-cheat-sheet.md` and
`space-shooter/reference/extra-challenges.md` — the Markdown stays
authoritative on every word, so an edit to either half needs the other in
the same commit. The deck no longer sits beside its document (see "Sharing
the slides" above), so these checks name it by its `s/` path. Run them from
the repository root after changing any of the four files:

```bash
# every block named in the cheat sheet appears in its deck, and vice versa
diff <(grep -oE '^\| `[^`]+`' space-shooter/reference/block-cheat-sheet.md | sed 's/^| `//; s/`$//' | sort) \
     <(grep -o 'data-block="[^"]*"' s/space_cheatsheet/index.html | cut -d'"' -f2 | sort)

# 12 challenges in both
grep -c '^### ' space-shooter/reference/extra-challenges.md  # 12
grep -c 'class="entry"' s/space_extra/index.html               # 12
```

Empty output on the first check and matching counts on the second mean the
two are in step. Like cookie-clicker's cheat sheet, `sed` (not `tr -d`)
strips the pipe and backticks, since block names contain spaces.

All five decks in this course, and all six in cookie-clicker, link the one
shared `s/slides.css` — see cookie-clicker's README, under "Sharing the
slides", for where the palette lives and why no deck carries its own copy.

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

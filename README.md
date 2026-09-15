# Scratch courses

Teaching materials for Scratch courses aimed at total-beginner ~12-year-olds,
written to be run by volunteers at a coding club.

## Courses

| Course | Lessons | What the kids build |
|---|---|---|
| [**space-shooter**](space-shooter/) | 3 × 90 min | A top-down space shooter — fly a ship, shoot asteroids, fight an enemy |
| [**cookie-clicker**](cookie-clicker/) | 3 × 90 min | An idle cookie-clicker game — click a cookie, buy helpers who bake for you, catch golden cookies for a bonus |

Each course directory has its own README covering what that course delivers
and what to check before teaching it. **Start there, not here.**

## How a course is laid out

```
<course>/
  README.md                     what the course delivers, and what to verify first
  lesson-N-<name>/
    instructor-plan.md          minute-by-minute timing, what to demo, sticking points
    step-cards.md               numbered instructions to print and hand to each kid
    slides.html                 the same milestones as a deck, for the projector
    *.png                       editor screenshots, referenced from the step cards
  reference/
    block-cheat-sheet.md        every block the course uses, by palette colour
    extra-challenges.md         optional challenges for kids who finish early
    bonus-ideas.md              unbounded directions for kids who exhaust those
    *.html                      the reference documents as decks
    slides.css                  one stylesheet, shared by that course's decks
```

Not every course has every file. `cookie-clicker/` has the full set;
`space-shooter/` has the Markdown but no decks yet.

## Slide decks

Each lesson's milestones also exist as an HTML deck — driven on a projector
while the room follows, and opened in a second tab by kids who run ahead.
The scripts are drawn as real Scratch blocks in the editor's own colours,
which a Markdown table cannot do.

**[SLIDE-DECKS.md](SLIDE-DECKS.md) is the handover**: how to build a deck for
a lesson that does not have one, including the block shapes, the frozen
palette, the conventions and the checks. Written to be followed by someone —
or something — that has never seen this repository.

The decks are served over GitHub Pages; each course README lists its URLs.

## Checking the materials

Each course README documents that course's own conventions and the checks
that verify them. Read that README's "Checking the shape by hand" section
for the exact commands to run before you teach or edit anything in it.

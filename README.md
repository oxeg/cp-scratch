# Scratch courses

Teaching materials for Scratch courses aimed at total-beginner ~12-year-olds,
written to be run by volunteers at a coding club.

## Courses

| Course | Lessons | What the kids build |
|---|---|---|
| [**space-shooter**](space-shooter/) | 3 × 90 min | A top-down space shooter — fly a ship, shoot asteroids, fight an enemy |
| **cookie-clicker** | — | Not written yet |

Each course directory has its own README covering what that course delivers
and what to check before teaching it. **Start there, not here.**

## How a course is laid out

```
<course>/
  README.md                     what the course delivers, and what to verify first
  lesson-N-<name>/
    instructor-plan.md          minute-by-minute timing, what to demo, sticking points
    step-cards.md               numbered instructions to print and hand to each kid
    *.png                       editor screenshots, referenced from the step cards
  reference/
    block-cheat-sheet.md        every block the course uses, by palette colour
    extra-challenges.md         optional challenges for kids who finish early
```

## Checking the materials

```bash
./tools/check-materials.sh all              # every course
./tools/check-materials.sh space-shooter    # one course
```

It verifies structure only — no leftover placeholder markers, timing tables
that add up, the milestone and "Stuck?" scaffolding being present — and prints
an advisory count of numbered steps per milestone. It says nothing about
whether the material is correct about Scratch or fits in the time allowed.
Each course README explains what that actually takes.

The file list is currently hardcoded to space-shooter's nine documents.
It needs generalising once a second course exists.

# Lesson 1 - Fly the ship: instructor plan

**New idea this week:** a `forever` loop containing `if key pressed` checks.
**Milestone (everyone must reach):** fly a ship around space with the arrow keys.
**Stretch goals:** clamp the ship to the screen edges, add a thruster sound,
add a second ship costume.

## Timing

| Time | Activity |
|---|---|
| 0:00-0:10 | Welcome, demo today's game, quick peek at the finished Lesson 3 game to sell the course |
| 0:10-0:25 | Setup |
| 0:25-0:35 | First script: green flag + starting position |
| 0:35-0:45 | The *bad* movement version - feel the problem |
| 0:45-1:05 | The *good* movement version - forever + four `if`s |
| 1:05-1:15 | Make it yours |
| 1:15-1:25 | Stretch goals and play each other's games |
| 1:25-1:30 | Save, wrap up, tease Lesson 2 |

## What to demo

- A quick peek at the finished Lesson 3 game, to sell the course - this is
  where they're headed over the three weeks.
- Today's milestone: a ship you can fly around space with the arrow keys.
  Show it moving smoothly in all four directions, including diagonally.

## Blocks introduced today

- *Yellow* Events: `when green flag clicked`, `when [key] key pressed`
- *Blue* Motion: `go to x: () y: ()`, `change x by ()`, `change y by ()`
- *Amber* Control: `forever`, `if <> then`
- *Pale blue* Sensing: `key [key] pressed?`

## The deliberate detour

This is the pedagogical point of the week, and a volunteer who doesn't
understand it will skip it by "helping" a kid past the bad part too fast.

Kids build movement the obvious way first: four separate
`when [key] key pressed` scripts, one per arrow key, each with a matching
`change x by` or `change y by` block. It works, but it feels bad - there's a
short pause before the ship starts moving each time a key is pressed, and it
can't move diagonally (holding two arrow keys only does one of them).

**Let them notice.** Ask "what's wrong with this?" before explaining anything.
Kids who play games can usually feel it even if they can't name it. Don't
rush to the fix - the discomfort is what makes the fix land.

Once they've named the problem (or given up trying), delete all four scripts
and build the real thing: one `if` inside a `forever` loop, then right-click
→ **Duplicate** it three times, changing only the key and the number each
time. Say the phrase "right-click, Duplicate" out loud and have them repeat
the action themselves rather than watching you do it - they'll use Duplicate
constantly for the rest of the course.

## Sticking points and fixes

- Blocks dropped *near* a script rather than snapped into it. Look for the
  white drop-shadow line when dragging a block close to another; if there's
  no shadow, it isn't attached and won't run.
- The four `if` blocks placed *below* the `forever` loop instead of nested
  *inside* it. Have them drag each `if` so it sits between the top and
  bottom of the `forever` block, not underneath the whole thing.
- `change x by` confused with `set x to`. `change` adds to wherever the
  sprite already is; `set` jumps to an exact position, ignoring that.
- Forgetting to click the green flag before testing, then assuming the
  script is broken when actually it just hasn't been started.

## Stretch goals

Scratch already stops a sprite from leaving the stage completely, so edge
clamping below is polish, not a bug fix - don't let it become a must-do for
kids who are still catching up.

- Clamp the ship to the screen edges:
  `if <(x position) > (220)> then set x to (220)`, and three more like it for
  the other three edges.
- Add a thruster sound.
- Add a second ship costume.

## "Make it yours" prompts to read out

- "What speed feels right for your ship? Try a different number in the
  `change x by` and `change y by` blocks."
- "What colour should your ship be?"
- "How big or small should your ship be?"

## Notes for next week

Lesson 2 needs the `Ship` sprite named exactly that, and starting at
`x: 0 y: -120` via its green-flag script - both are relied on going forward,
so don't let anyone rename or reposition it differently.

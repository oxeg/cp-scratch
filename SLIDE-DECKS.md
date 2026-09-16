# Building a slide deck for a lesson

A handover document. It tells you how to turn a lesson's step cards into an
HTML slide deck like the eleven already in `s/` (six for `cookie-clicker/`,
five for `space-shooter/`), in enough detail that you can do it without
having seen this repository before.

**Decks live under `s/` at the repository root, not beside the course they
belong to.** `s/<slug>/index.html` is both the deck's real location and its
short URL — see "Where a deck lives" below before you go looking for one in
a lesson folder.

**Read `cookie-clicker/README.md` first** for what a course is and how a
lesson is shaped. This document covers only the decks.

## What a deck is for

Two audiences, one file:

- **The volunteer** drives it on a projector while the room follows along.
- **A kid who runs ahead** opens the same URL in a second tab.

A deck is a *visual summary*, not a replacement for anything. The step cards
stay the detailed, numbered, printed instructions; the deck shows where a
milestone lands. **Never move content out of the cards into a deck**, and
never let building a deck change a step, a step count or a timing table.

One slide per milestone. A lesson has exactly four milestones, so a lesson
deck has four slides. The reference decks depart from that because their
documents are shaped differently — six slides for the cheat sheet, four for
extra-challenges, six for bonus-ideas.

## Start by copying, not by writing

Two files already do all of this correctly. Begin from them:

- **`s/slides.css`** — the stylesheet, shared by every deck in the
  repository. Copy it whole.
- **`s/cookie_l3/index.html`** — the richest deck: C-blocks, cap blocks,
  booleans, multiple scripts on one slide, a fallback script, and edits to
  scripts from earlier weeks. Copy its structure and its `<script>` block
  verbatim; replace the slides.

Do not reconstruct the CSS or the navigation script from this document. They
are long, they have been through several rounds of review, and a subtle
retyping error in the block geometry is exactly the kind of defect nobody
notices until it is on a projector.

## Where a deck lives

**Every deck's real file is at `s/<slug>/index.html`**, at the repository
root, not inside the course or lesson it belongs to. This is what makes
`https://cp.oxeg.dev/s/<slug>` a short URL with no redirect bounce — GitHub
Pages has no server-side rewriting, so the only way for the address bar to
show that URL with no jump is for the content to actually be there.

Pick a `slug` following the existing pattern: `<course-short-name>_l<N>` for
a lesson deck (`cookie_l1`, `space_l2`), `<course-short-name>_<name>` for a
reference deck (`cookie_cheatsheet`, `space_extra`). No `cp_` prefix — the
site's own domain already says that.

## Where the stylesheet goes

**One `slides.css` for the whole repository**, at `s/slides.css` — a
sibling of every deck, since every deck lives at `s/<slug>/index.html`.
Every deck, lesson or reference, either course, links it the same way:

```html
<link rel="stylesheet" href="../slides.css">
```

Nothing inlines its own copy. That used to be true of cookie-clicker's three
lesson decks specifically, back when decks lived beside their step cards and
a shared file would have meant reaching out of the lesson directory for it —
once every deck moved into `s/`, the inlining stopped buying anything and
was retired.

## The shape of a slide

Four things, in this order, and nothing else:

1. **An eyebrow** — which milestone this is, the sprite it happens on, and
   any tier label the cards use.
2. **A goal** — the milestone's own title, and one sentence under it.
3. **What is new**, as chips: the blocks this milestone introduces. If it
   introduces none, say so in words rather than showing an empty strip.
4. **The finished script**, drawn as real Scratch blocks.
5. **One line on how you know it worked**, taken from the cards'
   `**Check it works**` box. It sits at the foot of the card, pinned there.

Then a small **"Go further"** note pointing at
`reference/extra-challenges.md`. Keep it subordinate to the check line —
smaller, `var(--ink-faint)`, no border or fill.

```html
<section class="slide on" data-i="0">
  <div class="eyebrow">
    <span>Milestone 1 of 4</span>
    <span class="tag">sprite: Cookie</span>
  </div>
  <h2>Paint your cookie and make it count</h2>
  <p class="sub">Draw a cookie, make a variable, and make clicking it count.</p>
  <div class="cols">
    <div>
      <p class="label">New blocks</p>
      <div class="chips">…</div>
    </div>
    <div>
      <p class="label">Your script ends up like this</p>
      <div class="stack">…</div>
    </div>
  </div>
  <div class="check"><div class="mark">&check;</div><p>…</p></div>
  <p class="further">Go further: …</p>
</section>
```

`.further` must be **inside** the slide's flex column, after `.check`. Put it
outside and the equal-height behaviour breaks.

## The block vocabulary

This is the part that makes a deck worth building. The step cards can only
write `set size to () %` as text; a deck draws the shape, and shape is how a
kid finds a block in the palette.

| Markup | Draws |
|---|---|
| `<div class="stack">…</div>` | a script: blocks that interlock vertically |
| `<div class="blk" data-cat="looks">` | a stack block — notch on top, tab below |
| `<div class="blk hat" data-cat="events">` | a hat block — domed top, tab below |
| `<div class="blk cap" data-cat="control">` | a cap block — flat bottom, **no tab** |
| `<div class="c" data-cat="control">` | a C-block: needs `.cbar`, `.cmouth`, `.cfoot` inside |
| `<div class="cbar">` | the C-block's top bar, carrying its label |
| `<div class="cmouth">` | the mouth; put the blocks it holds in here |
| `<div class="cfoot"></div>` | the C-block's foot, with a tab (`if <> then`) |
| `<div class="cfoot cap"></div>` | the foot with **no** tab (`forever`) |
| `<span class="num">5</span>` | a number slot — white oval |
| `<span class="txt">Hello</span>` | a text slot — white rounded rectangle |
| `<span class="drop">myself</span>` | a dropdown — darker shade, with a caret |
| `<span class="rep">cookies</span>` | a variable reporter — orange oval |
| `<span class="bool"><span>…</span></span>` | a boolean — green hexagon |
| `<span class="bool empty"><span></span></span>` | an empty boolean slot — a recess |
| `<span class="op">…</span>` | an arithmetic operator — green oval |

`data-cat` is one of `events`, `control`, `motion`, `looks`, `sound`,
`sensing`, `operators`, `variables`. It sets both the fill and the stroke.

A worked C-block, `forever` holding two blocks:

```html
<div class="c short" data-cat="control">
  <div class="cbar">forever</div>
  <div class="cmouth">
    <div class="blk" data-cat="control">wait <span class="num">1</span> seconds</div>
    <div class="blk" data-cat="variables">change <span class="drop">cookies</span> by <span class="rep">per second</span></div>
  </div>
  <div class="cfoot cap"></div>
</div>
```

`.c.short` keeps the bar and foot at their own width rather than stretching
to the mouth, which is what Scratch does.

## Getting the shapes right

Wrong shapes are the most expensive error you can make here, because the
whole room sees them at once. Work from this table, not from memory:

| Block | Shape |
|---|---|
| `when green flag clicked`, `when this sprite clicked`, `when I receive`, `when I start as a clone` | **hat** |
| `forever` | **C-block with a cap foot** — a mouth *and* a flat bottom |
| `if <> then` | **C-block with a tabbed foot** |
| `delete this clone` | **cap** — flat bottom, nothing attaches below |
| `() < ()`, `() > ()`, `not <>`, `<> and <>`, `touching [mouse-pointer]?`, `mouse down?` | **hexagon** (`.bool`) |
| `() - ()`, `() * ()`, `pick random () to ()` | **oval** (`.op`) |
| `cookies`, `per second`, `bonus`, any variable | **oval** (`.rep`) |
| everything else | **stack block** |

**Three traps, each of which has caused a real defect in this repo:**

**`forever` is a cap block.** It has no bump on its bottom edge, so nothing
can ever attach below it. Never draw a block beneath a `forever`, and never
write a caption saying blocks are "stranded below" one — that state does not
exist.

**Comparisons are hexagons; arithmetic is an oval.** `() > ()` is a
`.bool`. `() - ()` is an `.op`. They are different shapes in Scratch and a
kid uses that difference to know what fits where.

**An empty mouth collapses.** On a cheat sheet, where you draw `forever` with
nothing inside it, the mouth has no height and the block stops reading as a
C-block at all — which hides the only thing that makes it one. Give it a
floor, scoped so it cannot affect a real script:

```css
.rows .cmouth:empty{min-height:22px}
```

## The palette, and why it is frozen

The eight category colours are the real Scratch 3 values, fill and stroke:

```
events    #ffbf00 / #cc9900      control    #ffab19 / #cf8b17
variables #ff8c1a / #db6e00      motion     #4c97ff / #3373cc
looks     #9966ff / #774dcb      sensing    #5cb1d6 / #2e8eb8
sound     #cf63cf / #bd42bd      operators  #59c059 / #389438
```

A kid compares a slide to their screen, so these must match the editor
exactly. **Never edit them.**

They live inside three delimited regions in `s/slides.css` — `BEGIN`/`END
scratch palette`, `scratch blocks` and `scratch c-blocks` — marked off by
convention, not because anything else needs to match them: every deck links
this one file, so there's no second copy for a change here to drift out of
step with. **Add your own components outside the regions**, never inside
them; a component only reference decks use (cheat sheet rows, challenge
cards, bonus-idea prose) is fine anywhere in the file, it just isn't part
of what these three regions promise to hold.

## House conventions

- **Scripts are copied verbatim from the step cards**, block for block, in
  the same order, on the same sprite. Read the cards; do not reconstruct a
  script from memory or from another deck. A script that disagrees with the
  cards is wrong in front of the whole room.
- **Milestone titles, tier labels and sprite names come from the cards too.**
  "Stretch" is a reserved word in this repo meaning optional cosmetic tuning —
  use whatever wording the cards use ("everyone should reach", "further
  target") rather than a paraphrase.
- **Never assert a Scratch library asset name as fact.** Where the cards
  hedge a sound or backdrop name, hedge it the same way. Where the cards say
  "pick any sprite you like", do not name one.
- **Write non-ASCII as HTML entities** — `&mdash;`, `&#9733;`, `&rsquo;`. A
  deck is opened from disk as often as over HTTP, and an entity needs no
  charset guessing. Files should contain zero non-ASCII bytes.
- **When a milestone edits a script from an earlier week rather than building
  a new one, make that visually obvious.** A kid who rebuilds from scratch
  instead of editing ends up with a broken game. `.script.edit` gives the
  accent rule the cookie-clicker decks use.
- **A lesson deck (not a reference deck) links its course's adjacent
  lessons**, in a `.lessonnav` element in the top bar, between `.pips` and
  `.toggle`: `<a class="lessonlink" href="https://cp.oxeg.dev/s/cookie_l2/">
  Lesson 2 &rarr;</a>`. The href is the deck's full short URL, trailing
  slash, no `index.html` — not a relative path — since it has to resolve the
  same way whether the page is opened from `cp.oxeg.dev` or from disk. Omit
  the link a lesson doesn't have (Lesson 1 has no "&larr; Lesson 0") rather
  than showing it disabled. This is separate from `.toggle`/`.nav`, which
  move between this deck's own milestones — a kid should be able to tell
  "next lesson" from "next milestone" at a glance, which is why
  `.lessonlink` is a link styled like `.toggle`, not a button.
- **`.lessonnav` only shows on a lesson deck's last slide.** It's meant for
  "I've finished this lesson, what's next", not a permanent fixture of the
  bar — showing it throughout would compete with the milestone stepper for
  attention on every slide. `.lessonnav{display:none}` by default,
  `.lessonnav.show{display:flex}` toggled in `render()`:
  `lessonnav.classList.toggle('show', i === slides.length - 1)`, the same
  `classList.toggle` idiom the rest of the script already uses for
  `.slide.on` and `.deck.all`/`.deck.one`. `lessonnav` is looked up once
  with `document.querySelector('.lessonnav')` near the script's other
  element references.

## The document wrapper

Every deck is a complete standalone document:

```html
<!doctype html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width,initial-scale=1">
<title>…</title>
```

This is not boilerplate. Without the doctype the browser renders in quirks
mode. Without the viewport meta a phone lays the page out at a fake 980px and
zooms out, which defeats every responsive width the CSS defines — and "open
it in a second tab" is half of what a deck is for. The cookie-clicker decks
shipped without these and had to be repaired.

## Equal heights, and the check strip

Every slide sits in the same CSS grid cell:

```css
.deck.one{display:grid}
.deck.one .slide{grid-area:1/1;visibility:hidden;pointer-events:none}
.deck.one .slide.on{visibility:visible;pointer-events:auto}
```

So the deck is always as tall as its tallest slide and the controls never
jump when you advance. The check strip is pushed to the foot with
`.check{margin-top:auto}`, so "how you know it worked" lands in the same
place on every slide.

Shorter slides gain trailing space. That is the intended trade — dead space
beats controls that move under the volunteer's mouse.

## Projector reality

A 1080p screen in fullscreen gives roughly **1040px** of usable height once
the browser's own chrome is gone. A slide taller than that puts the check
strip below the fold, and because heights equalise it does so on *every*
slide, including short ones that look finished.

Measure it. If a deck does not fit:

1. Look for whitespace before you look at content — page padding, bar
   margins, the gap under the title.
2. If content is genuinely the cause, find out which column sets the row
   height before trimming anything. On Lesson 3 the left column was 481px and
   the script column 931px; trimming prose could never have helped.
3. If it still does not fit, **say so in the instructor plan** rather than
   letting the volunteer discover it mid-lesson. Tell them to scroll to the
   foot before reading the check line out, on every milestone including the
   ones that look complete, and give the browser-zoom alternative with the
   real number of steps — measure it, do not guess.

## Verifying a deck

```bash
F=s/<slug>/index.html
grep -c 'class="slide' "$F"                      # one per milestone
grep -c 'Go further' "$F"                        # one per slide
grep -o '#4c97ff\|#9966ff\|#cf63cf\|#ffbf00\|#ffab19\|#5cb1d6\|#59c059\|#ff8c1a' "$F" | sort -u | wc -l   # 8
head -1 "$F" | grep -ci doctype                  # 1
grep -c 'name="viewport"' "$F"                   # 1
grep -nE 'TODO|TBD|FIXME|XXX' "$F" || echo clean
python3 -c "d=open('$F',encoding='utf-8').read();print('non-ascii:',sum(1 for c in d if ord(c)>127))"
```

**`grep -c` counts matching lines, not occurrences.** Put each `class="slide"`
and each counted element on its own line, or these silently undercount.

Then confirm the lesson documents did not move. From the repository root:

```bash
for F in <course>/lesson-*/step-cards.md; do
  printf '%-24s M=%s C=%s S=%s  steps=' "$(basename $(dirname $F))" \
    "$(grep -c '^## Milestone' "$F")" "$(grep -c '^\*\*Check it works' "$F")" "$(grep -c '^\*\*Stuck?' "$F")"
  awk '/^## Milestone/{c=0} /^[0-9]+\./{c++} /^\*\*Check it works/{printf "%s ", c} END{print ""}' "$F"
done
```

Every number must be identical to before you started. Building a deck reads
the cards; it never edits them.

If you have a headless browser, measure rather than assert: slide heights
equal per deck, no horizontal overflow at 360/400/470px, and the check strip's
bottom edge against 1040px.

## Publishing

Decks are served by GitHub Pages straight from the repository, from its own
domain: `https://cp.oxeg.dev/s/<slug>`, not the default
`oxeg.github.io/cp-scratch`. The root-level `CNAME` file is what makes that
work — do not delete or rename it. See either course README, under "Sharing
the slides with GitHub Pages", for the DNS record and Pages setting this
also depends on. The empty `.nojekyll` file at the root makes Pages serve
every file exactly as committed — do not delete it either.

**A new deck goes straight into `s/<slug>/index.html`.** Add its short URL
to its course README, written out in full rather than as a placeholder a
volunteer has to assemble. There's no redirect-stub convention live in this
repo — if a deck's slug or location ever needs to change, the old URL just
stops resolving; decide then whether that specific move is worth a stub.

**Pages serves what has been pushed**, not what is on your laptop. That is
the thing that catches people out.

Decks with a shared local stylesheet **cannot be published as Claude
artifacts** — that platform's CSP admits stylesheets only from Google Fonts,
so the stylesheet silently fails to load. Pages is their only home.

## What not to do

- Do not edit a step card, a step count or a timing table.
- Do not edit anything inside a frozen palette region.
- Do not invent a Scratch block shape. Check the table above.
- Do not paraphrase a script, a milestone title or a tier label.
- Do not name a Scratch library asset the cards were careful to hedge.
- Do not put the whole lesson on the slides. The cards are the lesson.

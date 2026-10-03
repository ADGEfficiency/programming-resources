---
id: semantic-compression
aliases: []
tags:
  - casey-muratori
  - object-oriented-programming
  - programming
---

[Semantic Compression](https://caseymuratori.com/blog_0015)

The original Witness UI code by Jon Blow is praised, not condemned
- It is a flat sequence of steps that reads like instructions to a human: figure out the title bar, draw it, draw the button below, handle the press
- Anyone could read it and intuit how to add a button without reading anything else
- Commentary: worth noting because it undercuts the assumption that the article is anti-simple-code. The target is premature structure, not the absence of structure
- The flaw is only that layout arithmetic is done by hand inline, which gets onerous in the four-buttons-on-one-row case with its x0/x1/x2/x3 and repeated colour plumbing

Programming has two parts, and the second one is where the time goes
- Part one: figuring out what the processor needs to do
- Part two: expressing that in the language coherently so it doesn't collapse under its own weight
- Increasingly it is part two that dominates

Efficiency means development efficiency, measured holistically over the code's whole lifetime
- Not runtime optimization
- Includes time to type, debug, modify, adapt, and any work done to other code to accommodate this code

The core proposal: program as if you were a dictionary compressor running on your own code
- Literally imagine PKZip running continuously over the source looking for reductions
- Semantically smaller, meaning less duplicated or similar code, not physically smaller as in less text, though these usually correlate

Coincidental-duplication problem
- Two pieces of code that look identical today for unrelated reasons will be fused and then have to be torn apart when one changes. This is the

Never reuse until there are at least two instances; make code usable before reusable
- Writing "reusable" code up front is called one of the biggest mistakes available
- Type out exactly what you want in each specific case, ignoring correctness and abstraction, and get it working
- Pull out the shared part only on the second occurrence

He prefers "compress" to "abstract" as the term of art
- Compress means something concrete; abstract doesn't imply anything useful
- "Who cares if code is abstract?"

Decide between using as-is, modifying, or adding a layer

Compressed code is claimed to be readable, maintainable, and extensible as a side effect
- Readable because there is less of it
- The semantics come to mirror the real language of the problem, because frequently expressed things get names, as in a natural language
- Maintainable because identical behaviour goes through identical paths
- Unique code stays unique rather than being needlessly separated from its use
- Extensible because the pieces are already recomposable
- Counterpoint: readability from brevity is not monotonic. Compression introduces indirection, and each hop costs the reader something. He acknowledges this nowhere

Architecture should be arrived at, not conceived
- Every methodology claims these benefits abstractly and fails, because the hard part of code is the details
- Starting where the details don't exist guarantees you overlook something that breaks the plan

Objects should be discovered after the fact; this is the correct way to give birth to them
- Panel_Layout and its members are a real, usable bundle of code and data that fits perfectly and was trivial to design
- Contrasted with CRC index cards and Visio box-and-line diagrams, which can leave you more confused than when you started
- He claims to spend exactly zero time thinking about objects or what goes where

Code is procedurally oriented, and objects are just constructs that let procedures be reused
- The fallacy of OOP is the premise that code is object-oriented at all
- Letting objects emerge instead of forcing the process backwards makes programming more pleasant

---

# Witness UI code, ported to Go

## The four-button row (direct port)

```go
{
	y0 -= categoryHeight

	w := p.width / 4
	x1 := x0 + w
	x2 := x1 + w
	x3 := x2 + w

	fill, bright, text := p.buttonProperties(p.motionMaskX)
	xPressed := p.drawBigTextButtonColored(x0, y0, w, categoryHeight, "X", fill, bright, text)

	fill, bright, text = p.buttonProperties(p.motionMaskY)
	yPressed := p.drawBigTextButtonColored(x1, y0, w, categoryHeight, "Y", fill, bright, text)

	fill, bright, text = p.buttonProperties(p.motionMaskZ)
	zPressed := p.drawBigTextButtonColored(x2, y0, w, categoryHeight, "Z", fill, bright, text)

	fill, bright, text = p.buttonProperties(p.motionLocal)
	localPressed := p.drawBigTextButtonColored(x3, y0, w, categoryHeight, "Local", fill, bright, text)

	if xPressed {
		p.motionMaskX = !p.motionMaskX
	}
	if yPressed {
		p.motionMaskY = !p.motionMaskY
	}
	if zPressed {
		p.motionMaskZ = !p.motionMaskZ
	}
	if localPressed {
		p.motionLocal = !p.motionLocal
	}
}
```

The three `unsigned long` out-params become three returns, which deletes the four-line declaration block at the top and the `&` noise at every call. That's a free win Go gives you before any compression happens.

## Panel_Layout

```go
type PanelLayout struct {
	panel     *Panel
	width     float32
	rowHeight float32
	atX       float32
	atY       float32
	topY      float32
}

func newPanelLayout(panel *Panel, leftX, topY, width float32) PanelLayout {
	return PanelLayout{
		panel:     panel,
		width:     width,
		rowHeight: panel.ypad + 1.2*panel.bodyFont.characterHeight,
		atX:       leftX,
		atY:       topY,
		topY:      topY,
	}
}

func (l *PanelLayout) row() {
	l.atY -= l.rowHeight
}

func (l *PanelLayout) windowTitle(title string) {
	l.atY -= l.panel.drawTitle(l.atX, l.atY, title)
}

func (l *PanelLayout) pushButton(text string) bool {
	return l.panel.drawBigTextButton(l.atX, l.atY, l.width, l.rowHeight, text)
}

func (l *PanelLayout) complete() {
	l.panel.height = l.topY - l.atY
}
```

Returning a value rather than `*PanelLayout` keeps it on the stack; the pointer receivers still work because `layout` is an addressable local.

## The compressed call site

```go
func (p *Panel) drawMovementPanel(x, y float32, title string) {
	layout := newPanelLayout(p, x, y, p.width)
	layout.windowTitle(title)

	layout.row()
	if layout.pushButton("Auto Snap") {
		p.doAutoSnap()
	}

	layout.row()
	if layout.pushButton("Reset Orientation") {
		// ...
	}

	// ...
	layout.complete()
}
```

## Compressing the four-button row too

The article defers this to the next post. Here's where it lands:

```go
type Toggle struct {
	Label string
	On    *bool
}

func (l *PanelLayout) toggleRow(toggles ...Toggle) {
	l.row()

	w := l.width / float32(len(toggles))
	x := l.atX
	for _, t := range toggles {
		fill, bright, text := l.panel.buttonProperties(*t.On)
		if l.panel.drawBigTextButtonColored(x, l.atY, w, l.rowHeight, t.Label, fill, bright, text) {
			*t.On = !*t.On
		}
		x += w
	}
}
```

```go
layout.toggleRow(
	Toggle{"X", &p.motionMaskX},
	Toggle{"Y", &p.motionMaskY},
	Toggle{"Z", &p.motionMaskZ},
	Toggle{"Local", &p.motionLocal},
)
```

Four lines instead of twenty-five, and the row now works for any number of columns.

## Bugs in the article's code that the port has to resolve

- The C++ constructor takes `width` and never assigns it. `at_y`/`at_x` get set, `width` doesn't. Go won't let you not notice this once `width` is a struct field you read in `pushButton`.
- `complete()` reads `top_y` and `push_button()` reads `panel`, but neither is in the declared struct. He mentions going back to add `top_y`; `panel` is just missing. I added both.
- `complete(Panel *panel)` takes a panel it doesn't need, since the layout already holds one. I dropped the parameter.
- Intermediate snippets flip between `layout.width` and `layout.my_width`, and one still says `category_height` after the rename. Copy-paste drift in the article, not real code.

## Behaviour changes to be aware of

- `toggleRow` flips each flag inside the loop; the original computes all four presses first and applies all four toggles after. Equivalent here, because each button's colours depend only on its own flag. It stops being equivalent the moment `buttonProperties` reads more than one flag — e.g. if `Local` greyed out when no axis is set. If that's on the roadmap, split it into a press-collection pass and an apply pass.
- The `int category_height` truncation from the earlier port still applies to every snippet above.

## Pushback: the closure version

Everything above exists because C++ functions can't share locals. Go's can:

```go
func (p *Panel) drawMovementPanel(x, y float32, title string) {
	atY := y
	rowHeight := p.ypad + 1.2*p.bodyFont.characterHeight

	button := func(text string) bool {
		atY -= rowHeight
		return p.drawBigTextButton(x, atY, p.width, rowHeight, text)
	}

	atY -= p.drawTitle(x, atY, title)

	if button("Auto Snap") {
		p.doAutoSnap()
	}
	if button("Reset Orientation") {
		// ...
	}

	p.height = y - atY
}
```

No struct, no constructor, no `complete()`, and `row()` folds into `button()` because in practice they're always called in pairs. The trade is that this doesn't leave the function — the other Witness panels can't share it, and sharing across panels was Muratori's actual motivation. So the struct wins if you have five panels, the closure wins if you have one. Worth deciding which you're in before porting the whole shape over.

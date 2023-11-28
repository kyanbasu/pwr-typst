#import "@local/polylux:0.3.1": logic

#let pwr-author = state("pwr-author", none)
#let pwr-date = state("pwr-date", none)
#let pwr-footer = state("pwr-footer", [])

#let pwr-theme(
  aspect-ratio: "4-3",
  footer: [],
  author: none,
  date: none,
  background: white,
  foreground: black,
  body
) = {
  set page(
    paper: "presentation-" + aspect-ratio,
    margin: 2em,
    header: none,
    footer: none,
    fill: background,
  )
  set text(fill: foreground, size: 25pt)
  show footnote.entry: set text(size: .6em)
  show heading.where(level: 2): set block(below: 2em)
  set outline(target: heading.where(level: 1), title: none, fill: none)
  show outline.entry: it => it.body
  show outline: it => block(inset: (x: 1em), it)

  pwr-footer.update(footer)
  pwr-author.update(author)
  pwr-date.update(date)

  body
}

#let title-slide(title: "", subtitle: none) = {
  logic.polylux-slide({
    place(dx:-7.5%, dy:-10%, image("images/image1_p2_pl.png", fit: "stretch", width: 120%, height: 120%))
    set text(fill: black)
    v(15%)
    align(
      center,
      box(inset: (x: 2em), text(size: 46pt, fill: gradient.linear(red, red.darken(60%)), weight: 600, title)),
    )
    if (subtitle != none) {
      align(
        center,
        box(inset: (x: 2em), text(size: 30pt, subtitle)),
      )
    }
    align(
      center,
      box(inset: (x: 2em), text(size: 24pt, pwr-author.display())),
    )
    align(
      center,
      box(inset: (x: 2em), text(size: 22pt, pwr-date.display())),
    )
  })
}

#let centered-slide(body) = {
  
  let deco-format(it) = text(size: .6em, fill: gray, it)
  set page(
    footer: deco-format({
      pwr-footer.display(); h(1fr); logic.logical-slide.display()
    }),
    footer-descent: 1em,
    header-ascent: 1em,
  )
  logic.polylux-slide({place(dx:-7.5%, dy:-10%, image("images/image1_p2_pl.png", fit: "stretch", width: 120%, height: 120%)); align(center + horizon, body)})
}

#let slide(body) = {
  let body = pad(x: 3em, y: .1em, body)
  let deco-format(it) = text(size: .6em, fill: gray, it)
  set page(
    footer: deco-format({
      pwr-footer.display(); h(1fr); logic.logical-slide.display()
    }),
    footer-descent: 1em,
    header-ascent: 1em,
  )
  logic.polylux-slide({place(dx:-7.5%, dy:-10%, image("images/image1_p2_pl.png", fit: "stretch", width: 120%, height: 120%)); body})
}

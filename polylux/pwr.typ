#import "@local/polylux:0.3.1": logic

#let pwr-author = state("pwr-author", none)
#let pwr-date = state("pwr-date", none)
#let pwr-footer = state("pwr-footer", [])
#let pwr-lang = state("pwr-lang", none)

#let title_bg = "images/image1_p2_pl.png"
#let secondary_bg = "images/image2_p2_pl.png"

#let pwr-theme(
  footer: [\u{0}],
  author: none,
  date: none,
  lang: "pl",
  background: white,
  foreground: black,
  body
) = {
  set page(
    paper: "presentation-4-3",
    margin: 2em,
    header: none,
    footer: none,
    fill: background,
  )
  set text(fill: foreground, size: 25pt)
  set text(lang: lang)
  show footnote.entry: set text(size: .6em)
  show heading.where(level: 2): set block(below: 2em)
  set outline(target: heading.where(level: 1), title: none, fill: none)
  show outline.entry: it => it.body
  show outline: it => block(inset: (x: 1em), it)
  show heading: it => [
    #set text(fill: gradient.linear(red, red.darken(50%)))
    #block(it.body)
  ]
  //description above figure is polish thing
  show figure.where(
    kind: table
  ): set figure.caption(position: top)

  pwr-footer.update(footer)
  pwr-author.update(author)
  pwr-date.update(date)
  pwr-lang.update(lang)

  body
}

#let title-slide(title: "", subtitle: none) = {
  logic.polylux-slide({
    place(dx:-7.5%, dy:-10%, image(title_bg, fit: "stretch", width: 120%, height: 120%))
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
      place(bottom + left, dy: -20pt, dx: -30pt, logic.logical-slide.display()); place(bottom + center, dy: -20pt, pwr-footer.display());
    }),
    footer-descent: 1em,
    header-ascent: 1em,
  )
  logic.polylux-slide({place(dx:-7.5%, dy:-10%, image(secondary_bg, fit: "stretch", width: 120%, height: 120%)); align(center + horizon, body)})
}

#let slide(body) = {
  let body = pad(x: 1em, y: .1em, body)
  let deco-format(it) = text(size: .6em, fill: gray, it)
  set page(
    footer: deco-format({
      place(bottom + left, dy: -20pt, dx: -30pt, logic.logical-slide.display()); place(bottom + center, dy: -20pt, pwr-footer.display());
    }),
    footer-descent: 1em,
    header-ascent: 1em,
  )
  logic.polylux-slide({place(dx:-7.5%, dy:-10%, image(secondary_bg, fit: "stretch", width: 120%, height: 120%)); body})
}

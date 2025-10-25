// Typst 0.14.0
// Plik z przydatnymi funkcjami i konfiguracjami
#let ustawienia(doc) = {
  set text(lang: "pl", font: "Exo 2")
  set page("a4")
  
  set figure(supplement: "Rys.")
  
  show figure.where(
    kind: table
  ): set figure.caption(position: top)
  
  show figure.where(
    kind: table
  ): set figure(supplement: "Tab.")

  show figure.where(
    kind: "code"
  ): set figure(supplement: "Kod.")

  show figure.where(
    kind: "plot"
  ): set figure(supplement: "Wyk.")

  set outline.entry(fill: line(length: 100%))

  set highlight(fill: red.lighten(80%))
  show link: highlight
  
  // nagłówki
  set heading(numbering: "1.1")
  show heading: set text(red.darken(60%))
  show heading.where(level: 1): set text(red.darken(30%))
  
  // paragraf
  set par(
    justify: true,
    leading: 0.52em
  )

  // ustawienie justyfikacji kazdego znaku (nowe w typst 0.14, w poprzednich wersjach nie działa - odkomentować)
  set par(justification-limits: (spacing: (min: 40%, max: 500%), tracking: (min: -0.01em, max: 0.2em)))

  // wylaczenie justyfikacji w tabelach
  show table: set par(justify: false)
  
  doc
}

#let cent(body) = [#align(center, body)]

#let naglowekPoczatkowy(nazwa_kursu, temat, nr, autorzy, data, grupa) = [
  #set par(justify: false)
  #grid(
    columns: (1fr, 1fr),
    inset: 8pt,
    //stroke: 1pt, // cala obramowka - pionowe linie
    grid.hline(y: 0), grid.hline(y: 1), grid.hline(y: 3), grid.hline(y: 4), 
    grid.cell(colspan: 2, inset: 16pt, cent[#text(size: 26pt, [*#nazwa_kursu #nr*])]),
    grid.cell(rowspan: 2, cent[
      #text(size: 12pt, [*Nazwisko imię*])\
      #text(size: 20pt, [*
      #{
        for autor in autorzy {
          autor + linebreak()
        }
      }
      *])
    ]),
    cent[#text(size: 18pt, [Grupa: *#grupa*])],
    cent[#text(size: 18pt, [Data: *#data*])],
    grid.cell(colspan: 2, text(size: 18pt, [*Temat: #temat*]))
  )
  #set par(justify: true)
]
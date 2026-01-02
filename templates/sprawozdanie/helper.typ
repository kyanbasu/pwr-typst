// Typst 0.14.2

// Plik z przydatnymi funkcjami i konfiguracjami
#let zastosujUstawienia(doc) = {
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
  
  // inline codeblock background
  show raw.where(block: false): it => {
    highlight(fill: luma(220), top-edge: 0.9em, radius: 4pt, it)
  }

  doc
}

//////// Dodatkowe funkcje ////////

#let cent(body) = [#align(center, body)]

// figure ale z opisem dla kodu
#let code(body, caption: none) = {
  figure(
  body, kind: "code", caption: caption)
}


//////// Strony tytulowe ////////
#let stronaTytulowaLaboratorium(nazwa_kursu: [], temat: [], nr: [], autorzy: [], data: datetime.today(), grupa: []) = [
  #cent[
    #grid(
      columns: 2,
      column-gutter: 40pt,
      image("logo_pwr.png", height: 18%),
      [#image("logo_wit.png", height: 12.3%)
        #move(dy: -1pt, text(size: 14pt, [Wydział Informatyki\ i Telekomunikacji]))],
    )
  ]

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
      #autorzy
      *])
    ]),
    cent[#text(size: 18pt, [Grupa: *#grupa*])],
    cent[#text(size: 18pt, [Data: *#{data.display("[day].[month].[year]")}*])],
    grid.cell(colspan: 2, text(size: 18pt, [*Temat: #temat*]))
  )
  #set par(justify: true)
]

#let stronaTytulowaProjekt(tytul: [], nazwa_kursu: [], autorzy: [], grupa: [], data: datetime.today()) = {
  cent[
    #grid(
      columns: 2,
      column-gutter: 40pt,
      image("logo_pwr.png", height: 18%),
      [#image("logo_wit.png", height: 12.3%)
        #move(dy: -1pt, text(size: 14pt, [Wydział Informatyki\ i Telekomunikacji]))],
    )
  ]

  v(60pt)
  line(length: 100%)
  cent[#text(size: 26pt, fill: red.darken(40%), [*#tytul*])]
  
  v(60pt)
  cent(text(size: 20pt, autorzy))
  line(length: 100%)
  cent(text(size: 14pt, 
    [ #nazwa_kursu #{if grupa != [] [#grupa]}\ #data.display("[day].[month].[year]")]
  ))
}
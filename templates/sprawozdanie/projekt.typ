// Typst 0.14.2
#import "helper.typ": cent, zastosujUstawienia, stronaTytulowaProjekt

#show: doc => zastosujUstawienia(doc)

#cent[
  #grid(
    columns: 2,
    column-gutter: 40pt,
    image("logo PWr kolor pion  bez tla.png", height: 18%),
    [#image("logo_wit_przezroczyste.png", height: 12.3%)
      #move(dy: -1pt, text(size: 14pt, [Wydział Informatyki\ i Telekomunikacji]))],
  )
]

#stronaTytulowaProjekt(
  tytul: [Opracowanie lokalnej sieci\ komputerowej],
  autorzy: [
    abx 123456\
    xyz 654321
  ],
  data: datetime.today(),
)

#pagebreak()

#set page(number-align: left, numbering: "1")
#outline()
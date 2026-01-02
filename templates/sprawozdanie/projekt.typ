// Typst 0.14.2
#import "helper.typ": cent, zastosujUstawienia, stronaTytulowaProjekt

#show: doc => zastosujUstawienia(doc)

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
// Typst 0.14.2
#import "helper.typ": cent, zastosujUstawienia, stronaTytulowaLaboratorium

#show: doc => zastosujUstawienia(doc)

#let temat = [temat]
#let nr_lab = [1]

#stronaTytulowaLaboratorium(
  nazwa_kursu: [Układy cyfrowe i systemy wbudowane - Laboratorium],
  temat: temat,
  nr: nr_lab,
  autorzy: [
    abx 123456\
    xyz 654321
  ],
  grupa: [1],
  data: datetime.today(),
)

#outline(depth: 2)

#set page(number-align: right, numbering: "1")
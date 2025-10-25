// Typst 0.14.0
#import "helper.typ": ustawienia, naglowekPoczatkowy, cent
#show: doc => ustawienia(doc)

#cent[#image("logo PWr kolor pion  bez tla.png", width: 18%)]

#let kurs = [Układy cyfrowe i systemy wbudowane - Laboratorium]
#let temat = [temat]
#let nr_lab = [1]
#let autorzy = ("abc", "xyz")

#naglowekPoczatkowy(kurs, temat, nr_lab, autorzy, datetime.today().display(), [1])

#outline(depth: 2)

#set page(number-align: right, numbering: "1")

= Cel laboratorium


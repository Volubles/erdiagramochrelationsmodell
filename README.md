# Benjamin Kullman - yh25


## Entiteter och attribut

Kund  
(KundID PK, Namn, Epost, Telefon, Adress)

Bok  
(ISBN PK, Titel, Författare, Pris, Lagerstatus)

Beställning  
(OrderID PK, KundID FK, Datum, Totalbelopp)

Orderrad  
(OrderID PK FK, ISBN PK FK, Antal)

## Jag valde dessa primärnycklar då varje kund, bok och beställnng behöver sitt egna unika id. 
## Orderrad har en kombinerad primärnykel då samma bok bara ska komma en gång per beställning,

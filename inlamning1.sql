-- Benjamin Kullman Y25

CREATE DATABASE bokhandel;
USE bokhandel;

CREATE TABLE Kund (
    KundID INT AUTO_INCREMENT PRIMARY KEY,
    Namn VARCHAR(100),
    Epost VARCHAR(100),
    Telefon VARCHAR(20),
    Adress VARCHAR(200)
);

CREATE TABLE Bok (
    ISBN VARCHAR(20) PRIMARY KEY,
    Titel VARCHAR(200),
    Forfattare VARCHAR(100),
    Pris DECIMAL(10,2),
    Lagerstatus INT
);

CREATE TABLE Bestallning (
    OrderID INT AUTO_INCREMENT PRIMARY KEY,
    KundID INT,
    Datum DATE,
    Totalbelopp DECIMAL(10,2),
    FOREIGN KEY (KundID) REFERENCES Kund(KundID)
);

CREATE TABLE Orderrad (
    OrderID INT,
    ISBN VARCHAR(20),
    Antal INT,
    PRIMARY KEY (OrderID, ISBN),
    FOREIGN KEY (OrderID) REFERENCES Bestallning(OrderID),
    FOREIGN KEY (ISBN) REFERENCES Bok(ISBN)
);

INSERT INTO Kund (Namn, Epost, Telefon, Adress) VALUES
('Benjamin Kullman', 'admin@admin.com', '393993939', 'Rotebrunnsvägen 15'),
('Bruce Wayne', 'thedark@knight.com', '666666666', 'Arkham Asylum');

INSERT INTO Bok (ISBN, Titel, Forfattare, Pris, Lagerstatus) VALUES
('666-1', 'Journal 3', 'Dipper Pines', 199.00, 12);

INSERT INTO Bestallning (KundID, Datum, Totalbelopp) VALUES
(1, '2025-01-03', 199.00);

INSERT INTO Orderrad (OrderID, ISBN, Antal) VALUES
(1, '666-1', 1);

SELECT * FROM Kund;

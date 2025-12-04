-- Skapar databasen
CREATE DATABASE bokhandel;
USE bokhandel;

-- Kundtabell
CREATE TABLE Kund (
    KundID INT AUTO_INCREMENT PRIMARY KEY,  -- Unikt ID som ökar automatiskt
    Namn VARCHAR(100),
    Epost VARCHAR(100),
    Telefon VARCHAR(20),
    Adress VARCHAR(200)
);

-- Boktabell
CREATE TABLE Bok (
    ISBN VARCHAR(20) PRIMARY KEY,         -- Primärnyckel: varje bok har en unik ISBN
    Titel VARCHAR(200),
    Forfattare VARCHAR(100),
    Pris DECIMAL(10,2),
    Lagerstatus INT
);

-- Beställningar
CREATE TABLE Bestallning (
    OrderID INT AUTO_INCREMENT PRIMARY KEY, -- Primärnyckel för beställningar
    KundID INT,                        -- Kund som gjort beställningen
    Datum DATE,
    Totalbelopp DECIMAL(10,2),
    
    -- FOREIGN KEY: KundID måste finnas i Kund-tabellen.
    -- Skapar koppling mellan Beställning till Kund
    FOREIGN KEY (KundID) REFERENCES Kund(KundID)
);

-- Orderrader (vilka böcker som ingår i en order)
CREATE TABLE Orderrad (
    OrderID INT,                             -- Vilken beställning raden tillhör
    ISBN VARCHAR(20),                  -- Vilken bok det gäller
    Antal INT,
    
    -- Sammansatt primärnyckel: en order kan inte ha samma bok två gånger
    PRIMARY KEY (OrderID, ISBN),

    -- Koppling Orderrad till Bestallning
    -- OrderID måste matcha ett OrderID i Bestallning
    FOREIGN KEY (OrderID) REFERENCES Bestallning(OrderID),

    -- Koppling Orderrad till Bok
    -- ISBN måste finnas i Bok-tabellen
    FOREIGN KEY (ISBN) REFERENCES Bok(ISBN)
);

-- Exempeldata i Kund
INSERT INTO Kund (Namn, Epost, Telefon, Adress) VALUES
('Benjamin Kullman', 'admin@admin.com', '393993939', 'Rotebrunnsvägen 15'),
('Bruce Wayne', 'thedark@knight.com', '666666666', 'Arkham Asylum');

-- Lägger in en bok
INSERT INTO Bok (ISBN, Titel, Forfattare, Pris, Lagerstatus) VALUES
('666-1', 'Journal 3', 'Dipper Pines', 199.00, 12);

-- Skapar en beställning för kund med ID 1
INSERT INTO Bestallning (KundID, Datum, Totalbelopp) VALUES
(1, '2025-01-03', 199.00);

-- Lägger till en orderrad i beställning 1
INSERT INTO Orderrad (OrderID, ISBN, Antal) VALUES
(1, '666-1', 1);

-- Visar alla kunder
SELECT * FROM Kund;

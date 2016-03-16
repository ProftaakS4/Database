CREATE TABLE FotograafType (ID integer GENERATED BY DEFAULT AS IDENTITY (START WITH 1), Type varchar(255) NOT NULL, PRIMARY KEY (ID), CONSTRAINT fotograafType_typeCheck CHECK (CHECK(Type IN('Schoolfotograaf',Portretfotograaf')));
CREATE TABLE USER (ID integer GENERATED BY DEFAULT AS IDENTITY (START WITH 1), Type varchar(255) NOT NULL, Voornaam varchar(255) NOT NULL, Achternaam varchar(255) NOT NULL, Straatnaam varchar(255), Huisnummer varchar(255), Postcode varchar(255), Plaatsnaam varchar(255), Telefoonnummer varchar(255) NOT NULL, IBAN varchar(255) NOT NULL UNIQUE, Emailadres varchar(255) NOT NULL UNIQUE, Wachtwoord varchar(255) NOT NULL, PRIMARY KEY (ID), CONSTRAINT Check_WachtwoordLength CHECK (Check (LENGTH (Wachtwoord) > 8)), CONSTRAINT Check_Fotograaf_Type CHECK (CHECK(Type IN('Schoolfotograaf','Portretfotograaf','School- Portretfotograaf','Klant','Financiele Administratie','Admin'))));
CREATE TABLE Product (ID integer GENERATED BY DEFAULT AS IDENTITY (START WITH 1), Type varchar(255) NOT NULL, Materiaal varchar(255) NOT NULL, Omschrijving varchar(255), Afbeelding varchar(255), Aantal integer NOT NULL, PRIMARY KEY (ID), CONSTRAINT Check_Product_Type CHECK (CHECK(Type IN('muismatten','tassen', 'T-shirts', 'mokken', 'canvas', 'dibond'))));
CREATE TABLE "DVD-R" (ID integer GENERATED BY DEFAULT AS IDENTITY (START WITH 1), UserID integer NOT NULL, Datum varchar(255) NOT NULL, PRIMARY KEY (ID));
CREATE TABLE Fotograaf_Product (UserID integer NOT NULL, Product_ID integer NOT NULL, Prijs varchar(255) NOT NULL, PRIMARY KEY (UserID, Product_ID));
CREATE TABLE Foto (ID integer GENERATED BY DEFAULT AS IDENTITY (START WITH 1), UserID integer NOT NULL, DVD_ID integer NOT NULL, LoginID varchar(255) NOT NULL, Type varchar(255) NOT NULL, Afbeelding varchar(255) NOT NULL, Resolutie varchar(255), Omschrijving varchar(255), PRIMARY KEY (ID), CONSTRAINT Check_Type CHECK (CHECK (Type IN ('Portret','School','Groep))));
CREATE TABLE Bestelling (ID integer GENERATED BY DEFAULT AS IDENTITY (START WITH 1), UserID integer NOT NULL, Datum varchar(255) NOT NULL, Betaalstatus varchar(255) NOT NULL, BestelregelBestelling_ID integer NOT NULL, BestelregelFoto_ID integer NOT NULL, PRIMARY KEY (ID), CONSTRAINT Check_Betaald CHECK (CHECK (Betaald IN ('Betaald','Niet betaald'))));
CREATE TABLE BestelregelProduct (Bestelling_ID integer NOT NULL, Product_ID integer NOT NULL, Foto_ID integer NOT NULL, FilterType varchar(255) NOT NULL, Aantal integer NOT NULL, BestellingKlant_ID integer NOT NULL, FotoFotograaf_Id integer NOT NULL, FotoDVD_ID integer NOT NULL, PRIMARY KEY (Bestelling_ID, Product_ID, Foto_ID), CONSTRAINT Check_BestelRegelProduct_Filter CHECK (CHECK (FilterType IN ('Kleur','Sepia','Zwart/Wit'))));
CREATE TABLE Transactie (ID integer GENERATED BY DEFAULT AS IDENTITY (START WITH 1), BestellingID integer NOT NULL, Datum integer NOT NULL, SoortBetaling varchar(255) NOT NULL, Rekeningnummer varchar(255) NOT NULL, Bedrag varchar(255) NOT NULL, PRIMARY KEY (ID), CONSTRAINT Check_Soort_Betaling CHECK (Check (SoortBetaling IN ('iDeal','PayPal','Google-Checkout','Ogone'))));
CREATE TABLE Printopdracht (ID integer GENERATED BY DEFAULT AS IDENTITY (START WITH 1), Transactie_ID integer NOT NULL, Klant_ID integer NOT NULL, Datum varchar(255) NOT NULL, "AantalFoto's" integer NOT NULL, PRIMARY KEY (ID));
ALTER TABLE Foto ADD CONSTRAINT FKFoto952941 FOREIGN KEY (DVD_ID) REFERENCES "DVD-R" (ID);
ALTER TABLE BestelregelProduct ADD CONSTRAINT FKBestelrege486977 FOREIGN KEY (Product_ID) REFERENCES Product (ID);
ALTER TABLE BestelregelProduct ADD CONSTRAINT FKBestelrege298316 FOREIGN KEY (Bestelling_ID) REFERENCES Bestelling (ID);
ALTER TABLE Fotograaf_Product ADD CONSTRAINT FKFotograaf_185474 FOREIGN KEY (Product_ID) REFERENCES Product (ID);
ALTER TABLE Printopdracht ADD CONSTRAINT FKPrintopdra939932 FOREIGN KEY (Transactie_ID) REFERENCES Transactie (ID);
ALTER TABLE BestelregelProduct ADD CONSTRAINT FKBestelrege862696 FOREIGN KEY (Foto_ID) REFERENCES Foto (ID);
ALTER TABLE Transactie ADD CONSTRAINT FKTransactie139453 FOREIGN KEY (BestellingID) REFERENCES Bestelling (ID);
ALTER TABLE Transactie ADD CONSTRAINT FKTransactie298475 FOREIGN KEY () REFERENCES Bestelling ();
ALTER TABLE Bestelling ADD CONSTRAINT FKBestelling733670 FOREIGN KEY (UserID) REFERENCES "User" (ID);
ALTER TABLE Fotograaf_Product ADD CONSTRAINT FKFotograaf_952227 FOREIGN KEY (UserID) REFERENCES "User" (ID);
ALTER TABLE Foto ADD CONSTRAINT FKFoto321443 FOREIGN KEY (UserID) REFERENCES "User" (ID);
ALTER TABLE "DVD-R" ADD CONSTRAINT "FKDVD-R88849" FOREIGN KEY (UserID) REFERENCES "User" (ID);
ALTER TABLE Transactie ADD CONSTRAINT FKTransactie139454 FOREIGN KEY (BestellingID) REFERENCES Bestelling (ID);
PRAGMA foreign_keys = OFF;

DROP TABLE IF EXISTS Szczegoly_wizyty;
DROP TABLE IF EXISTS Wizyty;
DROP TABLE IF EXISTS Pacjenci;
DROP TABLE IF EXISTS Uslugi;
DROP TABLE IF EXISTS Magazyn;
DROP TABLE IF EXISTS Pracownicy;
DROP TABLE IF EXISTS Wlasciciele;

CREATE TABLE Wlasciciele (
    id_wlasciciela INTEGER PRIMARY KEY AUTOINCREMENT,
    imie TEXT,
    nazwisko TEXT,
    numer_telefonu TEXT,
    email TEXT,
    adres_zamieszkania TEXT
);

CREATE TABLE Pracownicy (
    id_pracownika INTEGER PRIMARY KEY AUTOINCREMENT,
    imie TEXT,
    nazwisko TEXT,
    rola TEXT,
    numer_pwz TEXT,
    specjalizacja TEXT,
    numer_telefonu TEXT,
    email TEXT,
    numer_stanowiska INTEGER,
    poziom_uprawnien TEXT,
    praca_pon TEXT, praca_wt TEXT, praca_śr TEXT, praca_czw TEXT, praca_pt TEXT, praca_sob TEXT, praca_ndz TEXT
);

CREATE TABLE Uslugi (
    id_uslugi INTEGER PRIMARY KEY AUTOINCREMENT,
    nazwa_uslugi TEXT,
    cena_uslugi REAL,
    opis_uslugi TEXT
);

CREATE TABLE Magazyn (
    id_zasobu INTEGER PRIMARY KEY AUTOINCREMENT,
    nazwa_zasobu TEXT,
    ilosc_dostepna INTEGER,
    jednostka TEXT,
    cena_jednostkowa REAL,
    typ_zasobu TEXT
);

CREATE TABLE Pacjenci (
    id_pacjenta INTEGER PRIMARY KEY AUTOINCREMENT,
    imie TEXT,
    gatunek TEXT,
    rasa TEXT,
    wiek INTEGER,
    plec TEXT,
    waga REAL,
    alergie TEXT,
    historia_wizyt TEXT,
    kastracja TEXT,
    id_wlasciciela INTEGER,
    FOREIGN KEY(id_wlasciciela) REFERENCES Wlasciciele(id_wlasciciela)
);

CREATE TABLE Wizyty (
    id_wizyty INTEGER PRIMARY KEY AUTOINCREMENT,
    data TEXT,
    godzina TEXT,
    status_wizyty TEXT,
    opis_wywiadu TEXT,
    diagnoza TEXT,
    zalecenie TEXT,
    id_pracownika INTEGER,
    id_pacjenta INTEGER,
    FOREIGN KEY(id_pracownika) REFERENCES Pracownicy(id_pracownika),
    FOREIGN KEY(id_pacjenta) REFERENCES Pacjenci(id_pacjenta)
);

CREATE TABLE Szczegoly_wizyty (
    id_szczegoly INTEGER PRIMARY KEY AUTOINCREMENT,
    id_wizyty INTEGER,
    id_uslugi INTEGER,
    cena_koncowa REAL,
    metoda_platnosci TEXT,
    FOREIGN KEY(id_wizyty) REFERENCES Wizyty(id_wizyty),
    FOREIGN KEY(id_uslugi) REFERENCES Uslugi(id_uslugi)
);

INSERT INTO Wlasciciele (imie, nazwisko, numer_telefonu, email, adres_zamieszkania) VALUES 
('Adam','Mickiewicz','500100200','adam@mickiewicz.pl','ul. Literacka 1, Warszawa'),
('Olga','Tokarczuk','600200300','olga@nobel.pl','ul. Książęca 12, Wrocław'),
('Robert','Lewandowski','700300400','rob@lewy.pl','ul. Sportowa 9, Monachium'),
('Wisława','Szymborska','500400500','wis@szym.pl','ul. Poezji 5, Kraków'),
('Henryk','Sienkiewicz','600500600','henryk@quovadis.pl','ul. Trylogii 3, Kielce'),
('Maria','Skłodowska','700600700','maria@curie.pl','ul. Radu 8, Paryż'),
('Fryderyk','Chopin','500700800','fryderyk@piano.pl','ul. Fortepianowa 1, Żelazowa Wola'),
('Mikołaj','Kopernik','600800900','niko@sun.pl','ul. Astronomów 4, Toruń'),
('Jan','Matejko','700900100','jan@polska.pl','ul. Malarska 2, Kraków'),
('Czesław','Miłosz','500111222','czeslaw@milosz.pl','ul. Literacka 10, Berkeley'),
('Andrzej','Sapkowski','600222333','geralt@rivia.pl','ul. Wiedźmińska 1, Łódź'),
('Krzysztof','Penderecki','700333444','kris@muzyka.pl','ul. Symfoniczna 5, Lusławice'),
('Tamara','Łempicka','500444555','tamara@art.pl','ul. Stylowa 7, Paryż'),
('Stanisław','Lem','600555666','stan@solaris.pl','ul. Kosmiczna 1, Kraków'),
('Magda','Abakanowicz','700666777','magda@art.pl','ul. Rzeźbiarska 3, Warszawa'),
('Władysław','Reymont','500777888','wlad@ziemia.pl','ul. Wiejska 4, Lipce'),
('Ignacy','Paderewski','600888999','ig@piano.pl','ul. Rządowa 1, Warszawa'),
('Witold','Gombrowicz','700999000','witold@gombro.pl','ul. Ferdydurke 2, Vence'),
('Bruno','Schulz','500123456','bruno@schulz.pl','ul. Krokodyli 1, Drohobycz'),
('Tadeusz','Kantor','600234567','tadeusz@teatr.pl','ul. Wielopole 4, Kraków'),
('Jan','Kochanowski','700345678','jan@fraszki.pl','ul. Lipowa 1, Czarnolas'),
('Julian','Tuwim','500456789','julian@lokomotywa.pl','ul. Dziecięca 3, Łódź'),
('Zbigniew','Herbert','600567890','pan@cogito.pl','ul. Etyczna 5, Lwów'),
('Krzysztof','Baczyński','700678901','kris@powstanie.pl','ul. Bojowa 1, Warszawa'),
('Bolesław','Prus','500789012','boleslaw@lalka.pl','ul. Krakowskie Przedmieście 1, Warszawa'),
('Stefan','Żeromski','600890123','stefan@zeromski.pl','ul. Szklana 4, Nałęczów'),
('Zofia','Nałkowska','700901234','zofia@medaliony.pl','ul. Graniczna 2, Warszawa'),
('Eliza','Orzeszkowa','500012345','eliza@niemien.pl','ul. Wiejska 10, Grodno'),
('Juliusz','Słowacki','600123456','julek@kordian.pl','ul. Romantyczna 7, Paryż'),
('Cyprian','Norwid','700234567','cyprian@norwid.pl','ul. Biedna 3, Londyn');


INSERT INTO Pracownicy (imie, nazwisko, rola, numer_pwz, specjalizacja, numer_telefonu, email, numer_stanowiska, poziom_uprawnien, praca_pon, praca_wt, praca_śr, praca_czw, praca_pt, praca_sob, praca_ndz) VALUES 
('Jan','Kowalski','Lekarz','PWZ001','Chirurg','555111222','jan.k@vet.pl',NULL,NULL,'11:00-16:00',NULL,'08:00-14:00','09:00-15:00',NULL,'11:00-16:00',NULL),
('Marek','Zieliński','Lekarz','PWZ002','Kardiolog','555222333','marek.z@vet.pl',NULL,NULL,'09:00-15:00',NULL,NULL,NULL,'12:00-17:00','09:00-15:00','10:00-13:00'),
('Zofia','Piotrowska','Lekarz','PWZ003','Dermatolog','555333444','zofia.p@vet.pl',NULL,NULL,'10:00-15:00',NULL,'8:00-14:00','10:00-15:00','08:00-15:00','09:00-15:00',NULL),
('Adam','Nowak','Lekarz','PWZ004','Internista','555444555','adam.n@vet.pl',NULL,NULL,'11:00-16:00',NULL,'10:00-15:00','11:00-16:00','10:00-15:00','11:00-16:00',NULL),
('Katarzyna','Wójcik','Lekarz','PWZ005','Okulista','555555666','kasia.w@vet.pl',NULL,NULL,'10:00-15:00','08:00-14:00',NULL,NULL,'09:00-15:00',NULL,'11:00-14:00'),
('Tadeusz','Lewandowski','Lekarz','PWZ006','Ortopeda','555666777','tadek.l@vet.pl',NULL,NULL,NULL,'10:00-15:00','10:00-15:00','10:00-15:00',NULL,NULL,'10:00-16:00'),
('Monika','Kaczmarek','Lekarz','PWZ007','Stomatolog','555777888','monika.k@vet.pl',NULL,NULL,NULL,NULL,'09:00-15:00','11:00-16:00','08:00-14:00','09:00-15:00',NULL),
('Robert','Mazur','Lekarz','PWZ008','Onkolog','555888999','robert.m@vet.pl',NULL,NULL,NULL,'12:00-16:00',NULL,'08:00-14:00','11:00-16:00',NULL,'10:00-14:00'),
('Karol','Wiśniewski','Lekarz','PWZ009','Internista','555999000','karol.w@vet.pl',NULL,NULL,'11:00-15:00',NULL,NULL,'12:00-16:00','08:00-14:00','09:00-15:00','08:00-12:00'),
('Anna','Dąbrowska','Recepcjonista',NULL,NULL,'555999000','anna.d@recepcja.pl',1,NULL,'14:00-19:00','08:00-14:00','08:00-14:00','08:00-14:00','14:00-19:00','14:00-19:00','08:00-12:00'),
('Beata','Kwiatkowska','Recepcjonista',NULL,NULL,'555000111','beata.k@recepcja.pl',2,NULL,'08:00-14:00','14:00-19:00','14:00-19:00','14:00-19:00','08:00-14:00','08:00-14:00','12:00-16:00'),
('Piotr','Wiśniewski','Manager',NULL,NULL,'555121314','piotr.w@manager.pl',NULL,'Admin','11:00-15:00','12:00-16:00',NULL,NULL,'08:00-14:00',NULL,'13:00-15:00'),
('Igor','Zając','Manager',NULL,NULL,'555151617','igor.z@manager.pl',NULL,'SuperUser',NULL,NULL,'11:00-14:00','12:00-15:00','09:00-13:00','09:00-13:00',NULL);


INSERT INTO Uslugi (id_uslugi, nazwa_uslugi, cena_uslugi, opis_uslugi) VALUES 
(1,'Konsultacja',100,'Podstawowa konsultacja weterynaryjna'),
(2,'Szczepienie',60,'Szczepienie przeciw wściekliźnie i chorobom zakaźnym'),
(3,'Badania krwi',150,'Pełna morfologia i biochemia krwi'),
(4,'RTG',180,'Badanie rentgenowskie klatki piersiowej lub kończyn'),
(5,'USG',200,'Badanie ultrasonograficzne jamy brzusznej'),
(6,'Sterylizacja',450,'Zabieg chirurgiczny sterylizacji pod narkozą'),
(7,'Badanie zębów',300,'Sanacja jamy ustnej i usuwanie kamienia'),
(8,'Paszport',100,'Wystawienie paszportu dla zwierzęcia'),
(9,'Odrobaczanie',40,'Podanie preparatu przeciwpasożytniczego'),
(10,'Obcinanie pazurów',30,'Profesjonalne przycięcie pazurów'),
(11,'Kroplówka',120,'Nawodnienie dożylne pacjenta'),
(12,'Kardiologia',250,'Specjalistyczna konsultacja kardiologiczna'),
(13,'Eutanazja',200,'Humanitarne uśpienie zwierzęcia'),
(14,'Badanie moczu',50,'Badanie laboratoryjne moczu'),
(15,'Ortopedia',250,'Konsultacja u lekarza ortopedy'),
(16,'Kontrola',70,'Ogólny przegląd stanu zdrowia');

INSERT INTO Magazyn (nazwa_zasobu, ilosc_dostepna, jednostka, cena_jednostkowa, typ_zasobu) VALUES 
-- Produkty medyczne / Leki
('Szczepionka', 50, 'szt.', 45.00, 'Leki'),
('Preparat przeciwpasozytniczy', 100, 'tabl.', 12.00, 'Leki'),
('Narkoza', 15, 'fiolka', 110.00, 'Leki specjalistyczne'),
('Preparat do eutanazji', 10, 'fiolka', 80.00, 'Leki specjalistyczne'),
('Antybiotyk', 20, 'ml', 4.50, 'Leki'),
-- Sprzęt i materiały jednorazowe
('Microchip', 40, 'szt.', 25.00, 'Inne'),
('Probowki morfologiczne', 200, 'szt.', 1.50, 'Diagnostyka'),
('Pojemnik na mocz', 50, 'szt.', 2.00, 'Diagnostyka'),
('Zestaw do kroplowek (plyn + igla)', 60, 'komplet', 15.00, 'Materialy pomocnicze'),
('Zel do USG', 10, 'tubka', 20.00, 'Materialy pomocnicze'),
('Zel stomatologiczny', 12, 'szt.', 35.00, 'Pielegnacja'),
-- Materialy operacyjne i higieniczne
('Nici chirurgiczne', 50, 'szt.', 12.50, 'Materialy operacyjne'),
('Gaza jalowa (pakiet)', 150, 'szt.', 2.00, 'Materialy opatrunkowe'),
('Rekawiczki lateksowe (box)', 20, 'opak.', 40.00, 'Higiena'),
('Podklady higieniczne', 100, 'szt.', 1.80, 'Higiena');

INSERT INTO Pacjenci (imie, gatunek, rasa, wiek, plec, waga, alergie, historia_wizyt, kastracja, id_wlasciciela) VALUES 
('Filemon','Kot','Maine Coon',2,'Samiec',4.9,NULL,'2023-10-10: Kontrola; 2023-11-01: Kaszel','Tak',1),
('Luna','Pies','Labrador',5,'Samica',30.5,'Kurczak','2023-09-01: Szczepienie; 2023-11-04: Alergia','Tak',2),
('Burek','Pies','Mieszaniec',8,'Samiec',12.0,NULL,'2023-09-18: Badanie pęcherza','Tak',3),
('Mruczek','Kot','Pers',4,'Samiec',5.5,NULL,'2023-10-01: Badanie zębów','Nie',4),
('Azor','Pies','Owczarek',6,'Samiec',35.0,NULL,'2023-08-10: Badanie uszu; 2023-11-19: Zapalenie ucha','Nie',5),
('Pusia','Kot','Syjamski',3,'Samica',3.8,'Ryba','2023-10-03: Kontrola po operacji','Nie',6),
('Reksio','Pies','Terier',10,'Samiec',8.5,'Pyłki','2023-09-02: Kulawizna','Tak',7),
('Bella','Pies','Beagle',2,'Samica',11.2,NULL,'2023-10-04: Badanie serca','Tak',8),
('Fafik','Pies','Mops',4,'Samiec',9.0,NULL,'2023-10-05: Badanie oczu','Tak',9),
('Kropka','Kot','Brytyjczyk',1,'Samica',3.2,NULL,'2023-08-02: Wymioty','Tak',10),
('Saba','Pies','Dalmatyńczyk',7,'Samica',25.0,NULL,'2023-09-07: Guz na skórze','Nie',11),
('Misia','Chomik','Syryjski',1,'Samica',0.2,NULL,'2023-09-06: Kontrola','Tak',12),
('Leon','Kot','Maine Coon',5,'Samiec',8.5,NULL,'2023-10-20: Paszport','Tak',13),
('Dolar','Koń','Arab',4,'Samiec',450.0,'Trawa','2023-08-14: Słabe kopyta','Tak',14),
('Bibi','Królik','Miniaturka',2,'Samica',1.5,NULL,'2023-09-08: Ból brzucha','Nie',15),
('Tofik','Pies','York',3,'Samiec',3.1,NULL,'2023-10-10: Obcinanie pazurów','Nie',16),
('Daisy','Pies','Maltańczyk',4,'Samica',4.0,NULL,'2023-10-21: Kontrola ciąży','Nie',17),
('Simba','Kot','Bengalski',2,'Samiec',6.0,NULL,'2023-10-09: Badanie dziąseł','Tak',18),
('Nala','Kot','Pers',3,'Samica',5.5,NULL,'2023-10-12: Katar','Tak',19),
('Rico','Papuga','Ara',15,'Samiec',1.1,'Orzechy','2023-08-17: Wypadanie piór','Nie',20),
('Stefan','Żółw','Stepowy',20,'Samiec',0.8,NULL,'2023-09-20: Pęknięty pancerz','Nie',21),
('Gucio','Świnka','Gładka',2,'Samiec',1.0,NULL,'2023-09-01: Kontrola','Nie',22),
('Lola','Pies','Boxer',5,'Samica',28.0,NULL,'2023-09-10: Szczepienie','Tak',23),
('Bruno','Pies','Buldog',3,'Samiec',13.5,NULL,'2023-05-10: Szczepienie','Nie',24),
('Kaja','Kot','Sfinks',4,'Samica',4.5,NULL,'2023-10-11: Brak chęci do zabawy','Tak',25),
('Pikuś','Pies','Ratler',12,'Samiec',2.5,NULL,'2023-07-07: Kontrola','Tak',26),
('Cezar','Pies','Rottweiler',5,'Samiec',45.0,NULL,'2023-08-08: Odrobaczanie','Tak',27),
('Fiona','Kot','Norweski',6,'Samica',7.2,NULL,'2023-08-12: Katar','Tak',28),
('Tygrys','Kot','Europejski',5,'Samiec',4.8,NULL,'2023-10-10: Kontrola','Tak',29),
('Puszek','Królik','Baran',1,'Samiec',2.0,'Kurz','2023-07-13: Trudności w oddychaniu','Nie',30),
('Kajtek','Pies','Spaniel',8,'Samiec',14.0,NULL,'2023-09-01: Kaszel','Tak',1),
('Lilo','Pies','Golden',4,'Samica',32.0,NULL,'2023-09-15: Drgawki','Tak',2),
('Badi','Pies','Beagle',2,'Samiec',11.0,NULL,'2023-09-27: Nadwaga','Tak',3),
('Gacek','Nietoperz','Domowy',1,'Samiec',0.1,NULL,'2023-08-16: Krwawienie','Nie',4),
('Fred','Fretka','Domowa',2,'Samiec',1.2,NULL,'2023-09-01: Kontrola','Nie',5),
('Maja','Pies','Shih Tzu',3,'Samica',10.5,NULL,'2023-07-21: Ciąża','Nie',6),
('Oskar','Kot','Ragdoll',5,'Samiec',6.5,NULL,'2023-06-22: Tarczyca','Tak',7),
('Borys','Pies','Akita',6,'Samiec',40.0,NULL,'2023-08-23: Ból kręgosłupa','Tak',8),
('Chrupka','Szynszyla','Beżowa',2,'Samica',0.6,NULL,'2023-07-24: Przerost zębów','Nie',9),
('Elvis','Pies','Pudel',7,'Samiec',7.5,NULL,'2023-07-25: Szczepienie','Tak',10);

INSERT INTO Wizyty (data, godzina, status_wizyty, opis_wywiadu, diagnoza, zalecenie, id_pracownika, id_pacjenta) VALUES 
('2026-01-07','08:00','Zakończona','Kaszel','Przeziębienie','Antybiotyk 5 dni',1,1),
('2026-01-07','08:30','Zakończona','Drapanie się','Alergia skórna','Zmiana karmy na hypoalergeniczną',3,2),
('2026-01-08','14:00','Zakończona','Nietrzymanie moczu','Zapalenie pęcherza','Syrop przeciwzapalny',4,3),
('2026-01-09','09:00','Zakończona','Zwierzę nie je','Problemy z zębami','Usunięcie kamienia',7,4),
('2026-01-09','15:00','Zakończona','Ból ucha','Zapalenie ucha zewnętrznego','Czyszczenie i krople',3,5),
('2026-01-10','12:00','Zakończona','Kontrola po operacji','Rana goi się dobrze','Zdjęcie szwów za tydzień',1,6),
('2026-01-11','10:00','Zakończona','Kulawizna','Uraz łapy','Odpoczynek i okłady',6,7),
('2026-01-12','09:30','Zakończona','Problemy z sercem','Szmery w sercu','Leki nasercowe na stałe',2,8),
('2026-01-12','10:30','Zakończona','Łzawienie oczu','Zapalenie spojówek','Krоple 3x dziennie',5,9),
('2026-01-12','11:00','Zakończona','Wymioty','Zatrucie pokarmowe','Głodówka 24h, nawodnienie',9,10),
('2026-01-13','13:00','Zakończona','Guz na skórзе','Tłuszczak','Obserwacja',8,11),
('2026-01-14','11:30','Zakończona','Przegląd ogólny','Pacjent zdrowy','Szczepienie przypominające',4,12),
('2026-01-15','09:00','Zakończona','Konsultacja chirurgiczna','Guz łagodny','Obserwacja',1,13),
('2026-01-15','10:00','Zakończona','Słabe kopyta','Niedobór wapnia','Suplementacja',6,14),
('2026-01-16','09:00','Zakończona','Ból brzucha','Zapalenie żołądka','Leki osłonowe',9,15),
('2026-01-16','10:00','Zakończona','Wizyta kontrolna','Zwierzę zdrowe',NULL,4,16),
('2026-01-17','09:00','Zakończona','Wizyta kontrolna','Zwierzę zdrowe',NULL,9,17),
('2026-01-17','10:00','Zakończona','Narośl na dziąśle','Zapalenie dziąseł','Maść do pyszczka',7,18),
('2026-01-17','11:30','Zakończona','Wizyta kontrolna','Zwierzę zdrowe',NULL,4,19),
('2026-01-18','08:30','Zakończona','Wypadanie piór','Stres','Wzbogacenie środowiska',9,20),
('2026-01-18','16:00','Zakończona','Pęknięty pancerz','Uraz mechaniczny','Klejenie pancerza',6,21),
('2026-01-19','11:00','Zakończona','Katar i zaropiałe oczy','Koci katar','Leki i krople do oczu',3,22),
('2026-01-20','11:00','Zakończona','Problemy z chodzeniem','Dysplazja stawów','Suplementy na stawy',6,23),
('2026-01-21','09:30','Zakończona','Narośl na dziąśle','Zapalenie dziąseł','Maść do pyszczka',7,24),
('2026-01-21','12:00','Zakończona','Brak chęci do zabawy','Anemia','Witaminy i zmiana diety',4,25),
('2026-01-22','13:00','Zakończona','Wizyta kontrolna','Zwierzę zdrowe',NULL,4,26),
('2026-01-22','14:00','Zakończona','Wizyta kontrolna','Zwierzę zdrowe',NULL,9,27),
('2026-01-23','08:00','Zakończona','Katar','Infekcja wirusowa','Inhalacje',3,28),
('2026-01-23','09:30','Zakończona','Ciąża','Prawidłowy rozwój płodów','Kontrola za 2 tygodnie',5,29),
('2026-01-24','09:00','Zakończona','Trudności w oddychaniu','Alergia na kurz','Oczyszczanie nosa',3,30),
('2026-01-25','09:00','Zakończona','Wizyta kontrolna','Zwierzę zdrowe',NULL,9,31),
('2026-01-25','11:00','Zakończona','Napady drgawek','Epilepsja','Leki przeciwpadaczkowe',2,32),
('2026-01-26','10:00','Zakończona','Szybkie męczenie się','Nadwaga','Rygorystyczna dieta',2,33),
('2026-01-26','12:00','Zakończona','Krwawienie z nosa','Uraz mechaniczny','Oczyszczenie rany',1,34),
('2026-01-26','12:30','Zakończona','Wizyta kontrolna','Zwierzę zdrowe',NULL,4,35),
('2026-01-27','09:00','Zakończona','Ciąża','Prawidłowy rozwój płodów','Kontrola za 2 tygodnie',5,36),
('2026-01-28','10:00','Zaplanowana','Utrata wagi',NULL, NULL,4,37),
('2026-01-28','11:00','Zaplanowana','Agresywne zachowanie',NULL, NULL,6,38),
('2026-01-29','12:00','Zaplanowana','Problemy z jedzeniem siana',NULL,NULL,7,39),
('2026-01-30','08:00','Zaplanowana','Szczepienie coroczne',NULL ,NULL,9,40);

INSERT INTO Szczegoly_wizyty (id_wizyty, id_uslugi, cena_koncowa, metoda_platnosci) VALUES 
(1,1,100,'Karta'),
(2,7,300,'Gotówka'),
(3,15,250,'BLIK'),
(4,1,100,'Karta'),
(5,1,100,'Gotówka'),
(6,1,100,'BLIK'),
(6,10,30,'BLIK'), 
(7,12,250,'Karta'),
(8,1,100,'Gotówka'),
(9,2,60,'BLIK'),
(10,5,200,'Karta'),
(10,3,150,'Karta'),
(11,1,100,'Gotówka'),
(12,7,300,'BLIK'),
(13,15,250,'Karta'),
(14,3,150,'Gotówka'),
(15,1,100,'BLIK'),
(16,16,80,'Karta'),
(16,10,30,'Karta'),
(17,16,80,'Gotówka'),
(18,1,100,'BLIK'),
(19,16,80,'Karta'),
(20,1,100,'Gotówka'),
(21,14,50,'BLIK'),
(22,16,80,'Karta'),
(23,4,180,'Gotówka'),
(23,1,100,'Gotówka'),
(24,16,80,'BLIK'),
(25,3,150,'Karta'),
(26,16,80,'Gotówka'),
(27,7,300,'BLIK'),
(28,16,80,'Karta'),
(29,16,80,'Gotówka'),
(30,1,100,'BLIK'),
(31,16,80,'Karta'),
(31,7,300,'Karta'),
(32,1,100,'Karta'),
(33,1,100,'BLIK'),
(34,4,180,'BLIK'),
(35,16,80,'BLIK'),
(36,5,200,'Gotówka'),
(37,3,NULL, NULL),
(38,1, NULL, NULL),
(39,7, NULL, NULL),
(40,2,NULL,NULL);

PRAGMA foreign_keys = ON;

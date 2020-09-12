CREATE SCHEMA Project;
USE Project;
CREATE TABLE OWNERINFO (
  OwnerNum INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  FirstName VARCHAR(45) NOT NULL,
  LastName VARCHAR(45) NOT NULL,
  Phone CHAR(12) NOT NULL,
  Email VARCHAR(45) NOT NULL);
CREATE TABLE GUEST (
  GuestNum INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  FirstName VARCHAR(45) NOT NULL,
  LastName VARCHAR(45) NOT NULL,
  Address VARCHAR(45) NOT NULL,
  City VARCHAR(45) NOT NULL,
  Country VARCHAR(45) NOT NULL,
  ZIP CHAR(5) NOT NULL,
  Phone CHAR(12) NOT NULL,
  Email VARCHAR(45) NOT NULL,
  NumOfAdults INT NOT NULL,
  NumOfChildren INT NOT NULL);
CREATE TABLE RENTALPROPERTIES (
  LocNum INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  Address VARCHAR(45) NOT NULL,
  City VARCHAR(45) NOT NULL,
  State CHAR(2) NOT NULL,
  ZIP CHAR(5) NOT NULL,
  Country VARCHAR(45) NOT NULL,
  TypeOfProp VARCHAR(45) NOT NULL,
  BedroomNum VARCHAR(45) NOT NULL,
  SafetyInfo VARCHAR(250) NOT NULL,
  PricePerNight DECIMAL(8,2) NOT NULL,
  OwnerNum INT NOT NULL,
  CONSTRAINT fk_RENTALPROPERTIES_Owner1
    FOREIGN KEY (OwnerNum)
    REFERENCES OWNERINFO (OwnerNum)
    ON UPDATE CASCADE);
CREATE TABLE PICKYOURCOMFORT (
  LocNum INT NOT NULL,
  PYCNum INT NOT NULL AUTO_INCREMENT,
  Amenities VARCHAR(250) NOT NULL,
  Activites VARCHAR(250) NOT NULL,
  PRIMARY KEY (PYCNum,LocNum),
    FOREIGN KEY (LocNum)
    REFERENCES RENTALPROPERTIES (LocNum)
    ON UPDATE CASCADE);
CREATE TABLE CHECKIN_OUT (
  LocNum INT NOT NULL,
  GuestNum INT NOT NULL,
  DateIn DATE NOT NULL,
  DateOut DATE NOT NULL,
  NumberOfDays INT NOT NULL,
  TotalPrice DECIMAL(8,2) NOT NULL,
  PRIMARY KEY (LocNum, GuestNum),
  CONSTRAINT fk_table1_has_table2_table1
    FOREIGN KEY (LocNum)
    REFERENCES RENTALPROPERTIES (LocNum)
    ON UPDATE CASCADE,
  CONSTRAINT fk_table1_has_table2_table21
    FOREIGN KEY (GuestNum)
    REFERENCES GUEST (GuestNum)
    ON UPDATE CASCADE);
/* Insert Owner statements */
INSERT INTO ownerinfo (FirstName, LastName, Phone, Email) VALUES ('Bob', 'Smith', '123-456-4567', 'bsmith@mail.com');
INSERT INTO ownerinfo (FirstName, LastName, Phone, Email) VALUES ('John', 'Robinson', '123-456-4787', 'jrobinson@mail.com');
INSERT INTO ownerinfo (FirstName, LastName, Phone, Email) VALUES ('Karen', 'Hernandez', '123-998-4567', 'khernandez@mail.com');
INSERT INTO ownerinfo (FirstName, LastName, Phone, Email) VALUES ('Seren', 'Acosta', '404-456-4567', 'sacosta@mail.com');
INSERT INTO ownerinfo (FirstName, LastName, Phone, Email) VALUES ('Ashley', 'Vance', '656-789-0011', 'avance@mail.com');
INSERT INTO ownerinfo (FirstName, LastName, Phone, Email) VALUES ('Lisandro', 'Martinez', '327-558-1470', 'lmartinez@mail.com');
INSERT INTO ownerinfo (FirstName, LastName, Phone, Email) VALUES ('Josef', 'Martinez', '777-777-7777', 'jmartinez@mail.com');
/* Insert Guest statements */
INSERT INTO guest (FirstName, LastName, Address, City, Country, ZIP, Phone, Email, NumOfAdults, NumOfChildren) VALUES ('Brad', 'Guzan', '123 United Way', 'Atlanta', 'United States', '01470', '876-543-0110', 'bguzan@mail.com', 2, 1);
INSERT INTO guest (FirstName, LastName, Address, City, Country, ZIP, Phone, Email, NumOfAdults, NumOfChildren) VALUES ('Lorenzo', 'Fabian', '45 Matador Lane', 'Barcelona', 'Spain', '34988', '441-908-3234', 'lfabian@mail.com', 1, 0);
INSERT INTO guest (FirstName, LastName, Address, City, Country, ZIP, Phone, Email, NumOfAdults, NumOfChildren) VALUES ('Francisca', 'Alves', '77 Streetside Street', 'London', 'United Kingdom', '33454', '900-721-4710', 'falves@mail.com', 2, 2);
INSERT INTO guest (FirstName, LastName, Address, City, Country, ZIP, Phone, Email, NumOfAdults, NumOfChildren) VALUES ('Rafael', 'Marquez', '4 Captain Lane', 'Mexico City', 'Mexico', '78904', '765-567-6675', 'rmarquez@mail.com', 4, 0);
INSERT INTO guest (FirstName, LastName, Address, City, Country, ZIP, Phone, Email, NumOfAdults, NumOfChildren) VALUES ('Samantha', 'Gray', '215 United Way', 'Atlanta', 'United States', '01470', '876-885-3247', 'sgray@mail.com', 3, 3);
INSERT INTO guest (FirstName, LastName, Address, City, Country, ZIP, Phone, Email, NumOfAdults, NumOfChildren) VALUES ('Andres', 'Iniesta', '433 Treble Street', 'Tokyo', 'Japan', '99443', '800-433-4222', 'ainiesta@mail.com', 2, 0);
INSERT INTO guest (FirstName, LastName, Address, City, Country, ZIP, Phone, Email, NumOfAdults, NumOfChildren) VALUES ('Carson', 'King', '8 Ball Lane', 'Los Angeles', 'United States', '90456', '787-800-1008', 'cking@mail.com', 1, 0);
/* Insert Rental Property statements */
INSERT INTO rentalproperties (Address, City, State, ZIP, Country, TypeOfProp, BedroomNum, SafetyInfo, PricePerNight, OwnerNum) VALUES ('123 Happy Street', 'New York City', 'NY', '45687', 'United States', 'Apartment', '5', 'Wheelchair accessible and elevator', 90.00, 1);
INSERT INTO rentalproperties (Address, City, State, ZIP, Country, TypeOfProp, BedroomNum, SafetyInfo, PricePerNight, OwnerNum) VALUES ('123 Happy Street', 'New York City', 'NY', '45687', 'United States', 'Apartment', '2', 'Wheelchair accessible and elevator', 45.00, 1);
INSERT INTO rentalproperties (Address, City, State, ZIP, Country, TypeOfProp, BedroomNum, SafetyInfo, PricePerNight, OwnerNum) VALUES ('47 ProEra Avenue', 'Brooklyn', 'NY', '45625', 'United States', 'House', '3', 'Not Wheelchair accessible', 60.00, 2);
INSERT INTO rentalproperties (Address, City, State, ZIP, Country, TypeOfProp, BedroomNum, SafetyInfo, PricePerNight, OwnerNum) VALUES ('234 Seaside Street', 'Chula Vista', 'CA', '90124', 'United States', 'House', '6', 'Wheelchair accessible and carbon monoxide detector', 110.00, 3);
INSERT INTO rentalproperties (Address, City, State, ZIP, Country, TypeOfProp, BedroomNum, SafetyInfo, PricePerNight, OwnerNum) VALUES ('78 Jimmy Carter Boulevard', 'Norcross', 'GA', '30125', 'United States', 'House', '3', 'Wheelchair accessible', 40.00, 4);
INSERT INTO rentalproperties (Address, City, State, ZIP, Country, TypeOfProp, BedroomNum, SafetyInfo, PricePerNight, OwnerNum) VALUES ('213 Oceanview Lane', 'Panama City', 'FL', '10789', 'United States', 'Condo', '5', 'Wheelchair accessible, elevator, and carbon monoxide detector', 150.00, 5);
INSERT INTO rentalproperties (Address, City, State, ZIP, Country, TypeOfProp, BedroomNum, SafetyInfo, PricePerNight, OwnerNum) VALUES ('15 Bohemia Lane', 'Graham', 'NC', '27253', 'United States', 'Apartment', '1', 'Elevator', 30.00, 6);
INSERT INTO rentalproperties (Address, City, State, ZIP, Country, TypeOfProp, BedroomNum, SafetyInfo, PricePerNight, OwnerNum) VALUES ('7063 West Cleveland Street', 'Cocoa', 'FL', '32927', 'United States', 'Condo', '4', 'Wheelchair accessible and elevator', 85.00, 7);
/* Insert Pick Your Comfort statements */
INSERT INTO pickyourcomfort (LocNum, Amenities, Activites) VALUES (1, 'Pool, Air Conditioning, and Outdoor Grill', 'Shopping');
INSERT INTO pickyourcomfort (LocNum, Amenities, Activites) VALUES (2, 'Air Conditioning and TV', 'Shopping');
INSERT INTO pickyourcomfort (LocNum, Amenities, Activites) VALUES (3, 'Air Conditioning and Kitchen', 'Shopping');
INSERT INTO pickyourcomfort (LocNum, Amenities, Activites) VALUES (4, 'Pool, Outdoor Grill, Hot Tub', 'Watersports');
INSERT INTO pickyourcomfort (LocNum, Amenities, Activites) VALUES (5, 'Air Conditioning', 'Shopping');
INSERT INTO pickyourcomfort (LocNum, Amenities, Activites) VALUES (6, 'Hot Tub, Outdoor Grill and Kitchen', 'Fishing, Watersports, Shopping');
INSERT INTO pickyourcomfort (LocNum, Amenities, Activites) VALUES (7, 'Air Conditioning', 'Shopping');
INSERT INTO pickyourcomfort (LocNum, Amenities, Activites) VALUES (8, 'Outdoor Grill and Kitchen', 'Watersports');
ALTER TABLE pickyourcomfort MODIFY Location VARCHAR(45);
UPDATE pickyourcomfort set Location = 'Waterfront' where LocNum = 4;
UPDATE pickyourcomfort set Location = 'Beach' where LocNum = 6;
UPDATE pickyourcomfort set Location = 'Beachfront' where LocNum = 8;
/* Insert Check In and Out statements */
INSERT INTO checkin_out VALUES (2, 1, '2019-10-15', '2019-10-20', 5, 225.00);
INSERT INTO checkin_out VALUES (1, 2, '2019-10-16', '2019-10-18', 2, 180.00);
INSERT INTO checkin_out VALUES (5, 3, '2019-11-20', '2019-11-23', 3, 120.00);
INSERT INTO checkin_out VALUES (4, 4, '2019-11-21', '2019-11-30', 9, 440.00);
INSERT INTO checkin_out VALUES (3, 3, '2019-12-02', '2019-12-05', 3, 180.00);
INSERT INTO checkin_out VALUES (8, 5, '2019-12-03', '2019-12-05', 2, 170.00);
INSERT INTO checkin_out VALUES (6, 7, '2019-12-15', '2019-12-31', 16, 2400.00);
INSERT INTO checkin_out VALUES (7, 6, '2020-01-01', '2020-01-05', 4, 120.00);
/* Queries */
SELECT Address, City, State, ZIP, Country, TypeOfProp, PricePerNight from rentalproperties 
where SafetyInfo LIKE 'Wheelchair accessible%' AND PricePerNight <= 90.00;
SELECT FirstName, LastName, Phone, Email FROM guest 
where GuestNum IN 
(SELECT DISTINCT GuestNum from checkin_out where DateIn LIKE '2019-%' AND DateOut LIKE '2019-%');
SELECT FirstName, LastName, Phone, Email, LocNum FROM ownerinfo 
inner join rentalproperties on ownerinfo.OwnerNum = rentalproperties.OwnerNum where BedroomNum >= 3;
SELECT rentalproperties.LocNum, Address, City, State, ZIP, PricePerNight, DateIn, DateOut from rentalproperties
left join checkin_out on rentalproperties.LocNum = checkin_out.LocNum AND DateIn LIKE '2020%' ORDER BY DateIn DESC;
CREATE VIEW Customers_2019 AS
SELECT guest.GuestNum, FirstName, LastName, Address, City, Country, ZIP, Phone, Email, NumOfAdults, NumOfChildren, DateIn, DateOut from guest 
join checkin_out on guest.GuestNum = checkin_out.GuestNum WHERE DateIn LIKE '2019%';
SELECT Country ,count(Country) as GuestFromEachCountry from guest GROUP BY Country;
SELECT *, (PricePerNight*7) as PriceForSpringBreak from rentalproperties;
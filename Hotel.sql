Create Database Hotel;
Go
Create table Guestes(
GuestId int primary key identity,
FullName varchar(100) not null,
Nationality varchar(20) not null,
PassportNumber varchar(20) not null,
DateOfBirth Date,
)
Go
Create Table Guest_Contact_Details(
GuestId int not null References Guestes(GuestId),
Detail varchar(20) primary key,

)
Go
Create Table Reservations(
ReservId int primary key,
BookingDate Date not null,
ChechInDate Date,
ChechOutDate Date,
ReservationStatus varchar(20) not null,
TotalPrice Decimal,
NumberOfAdults int not null,
NumberOfCildrin int not null,
)
Go
Create Table REservations_Guest(
ReservId int not null unique references Reservations(ReservId),
GuestId int not null unique references Guestes(GuestId),
REservations_Guest int primary key(ReservId,GuestId),
)
Go
Create Table payments(
PaymentId int primary Key,
Method Varchar(20) not null,
PaymentDate Date ,
Amount int ,
ConfigrationNumber int not null,
)
Go 
Create Table Reservation_payments(
PaymentId int not null references payments(PaymentId),
ReservId int not null references Reservations(ReservId),
 Reservation_payments int primary key (PaymentId,ReservId),
)
Go
Create table Hotel(
HotelId int primary key,
Name varchar(10) not null,
Address varchar(50) not null,
City varchar (20),
StarRating VArchar(20)not null,
ContactNumber varchar(20),

)
Go
Create table Staffs (
StaffId int primary key identity,
FullName varchar(50) not null,
Position int ,
Salary decimal not null,
HotelIDd int  not null references Hotel(HotelId) unique,
)
Go
Create Table Servaices(
SerId int primary key,
ServaicName varchar(20) not null,
Charge  int ,
RequestDate Date ,
StaffId int not null unique references Staffs(StaffId),
)
Go
Create Table Resevation_servaices(
SerId int not null references Servaices(SerId ),
ReservId int not null references Reservations(ReservId),
Resevation_servaices int primary key (SerId,ReservId),

)
Go
Create Table Roomes(
RoomNumber int primary key,
RoomType varchar (20) not null,
Capacity int,
DaliyRate varchar(20),
Availability varchar (20),
HotelId int not null References Hotel(HotelId),
)
Go
Create Table Amenities(
RoomNumber int not null references Roomes(RoomNumber ) unique,
Amenity int primary key,
)
Go
Create Table Reservation_Rooms(
ReservId int not null References  Reservations(ReservId),
RoomNumber int not null References  Roomes(RoomNumber),
Reservation_Rooms int primary key(ReservId,RoomNumber)
)
Go
ALTER TABLE Hotel
ADD ManagerId INT;

ALTER TABLE Hotel
ADD CONSTRAINT FK_Hotel_Manager
FOREIGN KEY (ManagerId)
REFERENCES Staffs(StaffId);
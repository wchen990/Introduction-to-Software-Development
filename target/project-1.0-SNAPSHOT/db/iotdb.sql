CREATE TABLE Customer (
  Cust_FName varchar(25),
  Cust_LName varchar(25),
  Email varchar(320) NOT NULL,
  Password varchar(256) NOT NULL,
  DOB date,
  Gender varchar(10),
  Cust_streetNo numeric(10),
  Cust_streetName varchar(100),
  Cust_city varchar(100),
  Cust_zipcode numeric(10),
  Cust_country varchar(30),
  CONSTRAINT Cust_PK PRIMARY KEY (Email)
);
CREATE TABLE Staff (
  Staff_FName varchar(25),
  Staff_LName varchar(25),
  Email varchar(320) NOT NULL,
  Password varchar(256) NOT NULL,
  DOB date,
  Gender varchar(10),
  Staff_streetNo numeric(10),
  Staff_streetName varchar(100),
  Staff_city varchar(100),
  Staff_zipcode numeric(10),
  Staff_country varchar(30),
  Roles varchar(50),
  CONSTRAINT Staff_PK PRIMARY KEY (Email)
);
CREATE TABLE IOT_Dev (
  Dev_ID int NOT NULL GENERATED ALWAYS AS IDENTITY,
  Dev_Name varchar(30),
  Dev_price double,
  Quantity numeric(10),
  CONSTRAINT IOTDev_PK PRIMARY KEY (Dev_ID)
);
CREATE TABLE Product_Category (
  Dev_ID int NOT NULL,
  Cat_ID int NOT NULL,
  CONSTRAINT ProdCat_PK PRIMARY KEY (Dev_ID, Cat_ID),
  CONSTRAINT ProdCat_FK1 FOREIGN KEY (Dev_ID) REFERENCES IOT_Dev(Dev_ID),
  CONSTRAINT ProdCat_FK2 FOREIGN KEY (Cat_ID) REFERENCES Category(Cat_ID)
);
CREATE TABLE Category (
  Cat_ID int NOT NULL GENERATED ALWAYS AS IDENTITY,
  Cat_Name varchar(100),
  Sub_Cat int,
  CONSTRAINT Cat_PK PRIMARY KEY (Cat_ID),
  CONSTRAINT Cat_FK FOREIGN KEY (Sub_Cat) REFERENCES Category(Cat_ID)
);
CREATE TABLE Customer_Management (
  Cust_Email varchar(320) NOT NULL,
  Staff_Email varchar(320) NOT NULL,
  CONSTRAINT CustMan_PK PRIMARY KEY (Cust_Email, Staff_Email),
  CONSTRAINT CustMan_FK1 FOREIGN KEY (Cust_Email) REFERENCES Customer(Email),
  CONSTRAINT CustMan_FK2 FOREIGN KEY (Staff_Email) REFERENCES Staff(Email)
);
CREATE TABLE Device_Management (
  Staff_Email varchar(320) NOT NULL,
  Dev_ID int NOT NULL,
  CONSTRAINT DevMan_PK PRIMARY KEY (Staff_Email, Dev_ID),
  CONSTRAINT DevMan_FK1 FOREIGN KEY (Staff_Email) REFERENCES Staff(Email),
  CONSTRAINT DevMan_FK2 FOREIGN KEY (Dev_ID) REFERENCES IOT_Dev(Dev_ID)
);
CREATE TABLE Payment (
  Payment_ID int NOT NULL GENERATED ALWAYS AS IDENTITY,
  Cust_Email varchar(320) NOT NULL,
  Payment_method varchar(10),
  Payment_date date,
  Delivery_time time,
  CONSTRAINT Pay_PK PRIMARY KEY (Payment_ID),
  CONSTRAINT Pay_FK FOREIGN KEY (Cust_Email) REFERENCES Customer(Email)
);
CREATE TABLE Checks (
  Payment_ID int NOT NULL,
  Bank_ID varchar(11),
  Payee_name varchar(100),
  CONSTRAINT Check_PK PRIMARY KEY (Payment_ID),
  CONSTRAINT Check_FK FOREIGN KEY (Payment_ID) REFERENCES Payment(Payment_ID)
);
CREATE TABLE Credit_card (
  Payment_ID int NOT NULL,
  Credit_cardNo numeric(16) NOT NULL,
  Card_type numeric(3),
  Expired_date date,
  CONSTRAINT Card_PK PRIMARY KEY (Payment_ID),
  CONSTRAINT Card_FK FOREIGN KEY (Payment_ID) REFERENCES Payment(Payment_ID)
);
CREATE TABLE Orders (
  Order_ID int NOT NULL GENERATED ALWAYS AS IDENTITY,
  Cust_Email varchar(320) NOT NULL,
  Order_status varchar(30),
  Delivery_date date,
  Delivery_time time,
  CONSTRAINT Order_PK PRIMARY KEY (Order_ID),
  CONSTRAINT Order_FK FOREIGN KEY (Cust_Email) REFERENCES Customer(Email)
);
CREATE TABLE Orderline (
  Order_ID int NOT NULL,
  Dev_ID int NOT NULL,
  Order_quantity numeric(10),
  CONSTRAINT Orderline_PK PRIMARY KEY (Order_ID, Dev_ID),
  CONSTRAINT Orderline_FK1 FOREIGN KEY (Order_ID) REFERENCES Orders(Order_ID),
  CONSTRAINT Orderline_FK2 FOREIGN KEY (Dev_ID) REFERENCES IOT_Dev(Dev_ID)
);

CREATE TABLE Access (
  Email varchar(320) NOT NULL,
  Indate varchar(320),
  Intime varchar(320),
  Outdate varchar(320),
  Outtime varchar(320),
  CONSTRAINT Acc_PK PRIMARY KEY (Email)
);
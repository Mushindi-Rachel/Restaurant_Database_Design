/*
Created: 20/10/2023
Modified: 21/10/2023
Model: MySQL 8.0
Database: MySQL 8.0
*/

-- Create tables section -------------------------------------------------

-- Table Customer

CREATE TABLE `Customer`
(
  `customer_Id` Int UNSIGNED NOT NULL,
  `F_Name` Char(20) NOT NULL,
  `L_Name` Char(20) NOT NULL,
  `City` Char(20) NOT NULL,
  `Phone_Number` Int UNSIGNED NOT NULL
)
;

ALTER TABLE `Customer` ADD PRIMARY KEY (`Phone_Number`)
;

ALTER TABLE `Customer` ADD UNIQUE `Phone_Number` (`Phone_Number`)
;

-- Table Staff

CREATE TABLE `Staff`
(
  `Staff_Number` Int UNSIGNED GENERATED ALWAYS AS (Staff_Number>200) STORED NOT NULL AUTO_INCREMENT,
  `F_Name` Char(20) NOT NULL,
  `L_Name` Char(20) NOT NULL,
  `Gender` Enum("M", "F") NOT NULL,
  `Hired_Date` Date NOT NULL,
  PRIMARY KEY (`Staff_Number`)
)
 AUTO_INCREMENT = 200
;

-- Table Order

CREATE TABLE `Order`
(
  `Order_Id` Int UNSIGNED NOT NULL,
  `Dish_Name` Char(20) NOT NULL,
  `Table_No` Int UNSIGNED NOT NULL,
  `Quantity` Int UNSIGNED NOT NULL,
  `Staff_Number` Int UNSIGNED NOT NULL,
  `Table_Id` Int UNSIGNED,
  `Phone_Number` Int UNSIGNED NOT NULL
)
;

CREATE INDEX `IX_Relationship15` ON `Order` (`Table_Id`)
;

ALTER TABLE `Order` ADD PRIMARY KEY (`Order_Id`, `Staff_Number`, `Phone_Number`)
;


-- Table Booking

CREATE TABLE `Booking`
(
  `Booking_Id` Int UNSIGNED NOT NULL,
  `B_Date` Date NOT NULL,
  `B_Time` Time NOT NULL,
  `No_of_people` Int UNSIGNED NOT NULL,
  `Table_No` Int UNSIGNED NOT NULL,
  `Staff_Number` Int UNSIGNED NOT NULL,
  `End_time` Timestamp NOT NULL DEFAULT 2 hour,
  `Staff_Number` Int UNSIGNED NOT NULL,
  `Phone_Number` Int UNSIGNED
)
;

CREATE INDEX `IX_Relationship5` ON `Booking` (`Phone_Number`)
;

ALTER TABLE `Booking` ADD PRIMARY KEY (`Staff_Number`, `Booking_Id`)
;

delimiter END
CREATE DEFINER =  SET NEW.End_time = DATE_ADD(NEW.B_Time, INTERVAL 2 HOUR) TRIGGER `set_default_end_time`
  BEFORE
  INSERT
  ON `Booking`
  FOR EACH ROW
  
END
delimiter 

-- Table Table

CREATE TABLE `Table`
(
  `Table_Id` Int UNSIGNED NOT NULL,
  `Table_Number` Int UNSIGNED NOT NULL
)
;

ALTER TABLE `Table` ADD PRIMARY KEY (`Table_Id`)
;

-- Table Dish

CREATE TABLE `Dish`
(
  `Dish_Id` Int UNSIGNED NOT NULL,
  `Dish_Name` Char(20) NOT NULL,
  `Price` Varchar(20) NOT NULL,
  `Order_Id` Int UNSIGNED NOT NULL,
  `Staff_Number` Int UNSIGNED NOT NULL,
  `Phone_Number` Int UNSIGNED NOT NULL
)
;

ALTER TABLE `Dish` ADD PRIMARY KEY (`Dish_Id`, `Order_Id`, `Staff_Number`, `Phone_Number`)
;

-- Table Recipe

CREATE TABLE `Recipe`
(
  `Dish_Id` Int UNSIGNED,
  `Order_Id` Int UNSIGNED,
  `Staff_Number` Int UNSIGNED,
  `Ingridient_id` Int UNSIGNED,
  `Phone_Number` Int UNSIGNED
)
;

CREATE INDEX `IX_Relationship32` ON `Recipe` (`Dish_Id`, `Order_Id`, `Staff_Number`, `Phone_Number`)
;

CREATE INDEX `IX_Relationship33` ON `Recipe` (`Ingridient_id`)
;

-- Table Ingridients

CREATE TABLE `Ingridients`
(
  `Ingridient_id` Int UNSIGNED NOT NULL,
  `Ingridient_Name` Char(20) NOT NULL
)
;

ALTER TABLE `Ingridients` ADD PRIMARY KEY (`Ingridient_id`)
;

-- Create foreign keys (relationships) section -------------------------------------------------

ALTER TABLE `Order` ADD CONSTRAINT `Relationship3` FOREIGN KEY (`Phone_Number`) REFERENCES `Customer` (`Phone_Number`) ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE `Booking` ADD CONSTRAINT `Relationship5` FOREIGN KEY (`Phone_Number`) REFERENCES `Customer` (`Phone_Number`) ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE `Booking` ADD CONSTRAINT `Relationship7` FOREIGN KEY (`Staff_Number`) REFERENCES `Staff` (`Staff_Number`) ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE `Dish` ADD CONSTRAINT `Relationship8` FOREIGN KEY (`Order_Id`, `Staff_Number`, `Phone_Number`) REFERENCES `Order` (`Order_Id`, `Staff_Number`, `Phone_Number`) ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE `Order` ADD CONSTRAINT `Relationship9` FOREIGN KEY (`Staff_Number`) REFERENCES `Staff` (`Staff_Number`) ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE `Order` ADD CONSTRAINT `Relationship15` FOREIGN KEY (`Table_Id`) REFERENCES `Table` (`Table_Id`) ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE `Recipe` ADD CONSTRAINT `Relationship32` FOREIGN KEY (`Dish_Id`, `Order_Id`, `Staff_Number`, `Phone_Number`) REFERENCES `Dish` (`Dish_Id`, `Order_Id`, `Staff_Number`, `Phone_Number`) ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE `Recipe` ADD CONSTRAINT `Relationship33` FOREIGN KEY (`Ingridient_id`) REFERENCES `Ingridients` (`Ingridient_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
;


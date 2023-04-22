-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema littlelemondb
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema littlelemondb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `littlelemondb` DEFAULT CHARACTER SET utf8 ;
USE `littlelemondb` ;

-- -----------------------------------------------------
-- Table `littlelemondb`.`Customers`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `littlelemondb`.`Customers` ;

CREATE TABLE IF NOT EXISTS `littlelemondb`.`Customers` (
  `CustomerID` INT NOT NULL,
  `FullName` VARCHAR(255) NULL,
  `ContactNumber` INT NULL,
  `Email` VARCHAR(255) NULL,
  PRIMARY KEY (`CustomerID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `littlelemondb`.`Bookings`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `littlelemondb`.`Bookings` ;

CREATE TABLE IF NOT EXISTS `littlelemondb`.`Bookings` (
  `BookingID` INT NOT NULL,
  `BookingDate` DATE NULL,
  `TableNumber` INT NULL,
  `CustomerID` INT NULL,
  PRIMARY KEY (`BookingID`),
  INDEX `CustomerID_idx` (`CustomerID` ASC) VISIBLE,
  CONSTRAINT `CustomerID`
    FOREIGN KEY (`CustomerID`)
    REFERENCES `littlelemondb`.`Customers` (`CustomerID`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `littlelemondb`.`Staff`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `littlelemondb`.`Staff` ;

CREATE TABLE IF NOT EXISTS `littlelemondb`.`Staff` (
  `StaffID` INT NOT NULL,
  `StaffName` VARCHAR(255) NULL,
  `StaffRole` VARCHAR(255) NULL,
  `Salary` INT NULL,
  PRIMARY KEY (`StaffID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `littlelemondb`.`MenuItems`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `littlelemondb`.`MenuItems` ;

CREATE TABLE IF NOT EXISTS `littlelemondb`.`MenuItems` (
  `MenuItemID` INT NOT NULL,
  `Starters` VARCHAR(255) NULL,
  `Courses` VARCHAR(255) NULL,
  `Desserts` VARCHAR(255) NULL,
  PRIMARY KEY (`MenuItemID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `littlelemondb`.`Menus`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `littlelemondb`.`Menus` ;

CREATE TABLE IF NOT EXISTS `littlelemondb`.`Menus` (
  `MenuID` INT NOT NULL,
  `MenuName` VARCHAR(255) NULL,
  `Cuisine` VARCHAR(255) NULL,
  `MenuItemID` INT NULL,
  PRIMARY KEY (`MenuID`),
  INDEX `MenuItemID_idx` (`MenuItemID` ASC) VISIBLE,
  CONSTRAINT `MenuItemID`
    FOREIGN KEY (`MenuItemID`)
    REFERENCES `littlelemondb`.`MenuItems` (`MenuItemID`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `littlelemondb`.`Orders`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `littlelemondb`.`Orders` ;

CREATE TABLE IF NOT EXISTS `littlelemondb`.`Orders` (
  `OrderID` INT NOT NULL,
  `OrderDate` DATE NULL,
  `CustomerID` INT NULL,
  `MenuID` INT NULL,
  `Quantity` INT NULL,
  `TotalCost` DECIMAL(10,2) NULL,
  `StaffID` INT NULL,
  PRIMARY KEY (`OrderID`),
  INDEX `CustomerID_idx` (`CustomerID` ASC) VISIBLE,
  INDEX `StaffID_idx` (`StaffID` ASC) VISIBLE,
  INDEX `MenuId_idx` (`MenuID` ASC) VISIBLE,
  CONSTRAINT `CustomerID2`
    FOREIGN KEY (`CustomerID`)
    REFERENCES `littlelemondb`.`Customers` (`CustomerID`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `StaffID`
    FOREIGN KEY (`StaffID`)
    REFERENCES `littlelemondb`.`Staff` (`StaffID`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `MenuId`
    FOREIGN KEY (`MenuID`)
    REFERENCES `littlelemondb`.`Menus` (`MenuID`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `littlelemondb`.`DeliveryStatus`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `littlelemondb`.`DeliveryStatus` ;

CREATE TABLE IF NOT EXISTS `littlelemondb`.`DeliveryStatus` (
  `DeliveryID` INT NOT NULL,
  `DeliveryDate` DATE NULL,
  `DeliveryStatus` TINYINT NULL,
  `OrderID` INT NULL,
  PRIMARY KEY (`DeliveryID`),
  INDEX `OrderId_idx` (`OrderID` ASC) VISIBLE,
  CONSTRAINT `OrderId`
    FOREIGN KEY (`OrderID`)
    REFERENCES `littlelemondb`.`Orders` (`OrderID`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

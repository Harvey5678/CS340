-- Project Step 2 Draft SQL Code
-- This code is adopted from workbench's generated code. I added commands, CASCADE, and INSERT to meet assignment requirements.

SET FOREIGN_KEY_CHECKS=0;
SET AUTOCOMMIT = 0;


-- -----------------------------------------------------
-- Table `Locations`
-- -----------------------------------------------------
--create the locations table
DROP TABLE IF EXISTS `Locations`;
CREATE TABLE IF NOT EXISTS `Locations` (
  `id_location` INT NOT NULL AUTO_INCREMENT,
  `address` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`id_location`))
ENGINE = InnoDB;

--insert values into locations table
LOCK TABLES `Locations` WRITE;
INSERT INTO `Locations` VALUES (1,'83523 NE Some St'),(2,'32643 NW Here Ct'),(3,'65923 NE There Ave');
UNLOCK TABLES;


-- -----------------------------------------------------
-- Table `Wheel_Types`
-- -----------------------------------------------------
--create wheel_types table
DROP TABLE IF EXISTS `Wheels`;
CREATE TABLE IF NOT EXISTS `Wheels` (
  `id_wheel` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id_wheel`))
ENGINE = InnoDB;

--insert values into wheel_types table
LOCK TABLES `Wheels` WRITE;
INSERT INTO `Wheels` VALUES (1,'RPF1'),(2,'TE37'),(3,'57CR');
UNLOCK TABLES;


-- -----------------------------------------------------
-- Table `Customers`
-- -----------------------------------------------------
--create customers table
DROP TABLE IF EXISTS `Customers`;
CREATE TABLE IF NOT EXISTS `Customers` (
  `id_customer` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  `email` VARCHAR(225) NULL,
  PRIMARY KEY (`id_customer`))
ENGINE = InnoDB;

--insert values into customers table
LOCK TABLES `Customers` WRITE;
INSERT INTO `Customers` VALUES (1,'Tom','tom@gmail.com'),(2,'Jeff','jeff@gmail.com'),(3,'Harry','harry@gmail.com');
UNLOCK TABLES;


-- -----------------------------------------------------
-- Table `Employees`
-- -----------------------------------------------------
--create enployees table
DROP TABLE IF EXISTS `Employees`;
CREATE TABLE IF NOT EXISTS `Employees` (
  `id_employee` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  `email` VARCHAR(225) NOT NULL,
  PRIMARY KEY (`id_employee`))
ENGINE = InnoDB;

--insert value into employees table
LOCK TABLES `Employees` WRITE;
INSERT INTO `Employees` VALUES (1,'Amy','amy@gmail.com'),(2,'Jack','jack@gmail.com'),(3,'Lisa','lisa@gmail.com');
UNLOCK TABLES;


-- -----------------------------------------------------
-- Table `Orders`
-- -----------------------------------------------------
--create orders table
DROP TABLE IF EXISTS `Orders`;
CREATE TABLE IF NOT EXISTS `Orders` (
  `id_order` INT NOT NULL AUTO_INCREMENT,
  `date` DATE NULL,
  `id_location` INT NOT NULL,
  `id_customer` INT NOT NULL,
  `id_employee` INT NULL,
  PRIMARY KEY (`id_order`),
  INDEX `fk_SalesOrders_Locations_idx` (`id_location` ASC) VISIBLE,
  INDEX `fk_SalesOrders_Customers1_idx` (`id_customer` ASC) VISIBLE,
  INDEX `fk_SalesOrders_Employees1_idx` (`id_employee` ASC) VISIBLE,
  CONSTRAINT `fk_SalesOrders_Locations`
    FOREIGN KEY (`id_location`)
    REFERENCES `Locations` (`id_location`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_SalesOrders_Customers1`
    FOREIGN KEY (`id_customer`)
    REFERENCES `Customers` (`id_customer`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_SalesOrders_Employees1`
    FOREIGN KEY (`id_employee`)
    REFERENCES `Employees` (`id_employee`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;

--insert values into orders table
LOCK TABLES `Orders` WRITE;
INSERT INTO `Orders` VALUES (1, '2023-2-9', 3, 1, 2),(2, '2022-4-9', 1, 3, 1),(3, '2020-2-16', 2, 2, 3);
UNLOCK TABLES;


-- -----------------------------------------------------
-- Table `Orders_Wheels_Intersections`
-- -----------------------------------------------------
--create intersection table for M:M relationship
DROP TABLE IF EXISTS `Orders_Wheels_Intersections`;
CREATE TABLE IF NOT EXISTS `Orders_Wheels_Intersections` (
  `id_intersection` INT NOT NULL AUTO_INCREMENT,
  `id_order` INT ,
  `id_wheel` INT NOT NULL,
  `order_quantity` INT NULL,
  `transaction_price_per_wheel` FLOAT NULL,
  PRIMARY KEY (`id_intersection`),
  INDEX `fk_SalesOrders_has_Wheels_Wheels1_idx` (`id_wheel` ASC) VISIBLE,
  INDEX `fk_SalesOrders_has_Wheels_SalesOrders1_idx` (`id_order` ASC) VISIBLE,
  CONSTRAINT `fk_SalesOrders_has_Wheels_SalesOrders1`
    FOREIGN KEY (`id_order`)
    REFERENCES `Orders` (`id_order`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_SalesOrders_has_Wheels_Wheels1`
    FOREIGN KEY (`id_wheel`)
    REFERENCES `Wheels` (`id_wheel`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;

--populate the intersection table
LOCK TABLES `Orders_Wheels_Intersections` WRITE;
INSERT INTO `Orders_Wheels_Intersections` VALUES (1, 1, 3, 4, 217),(2, 2, 1, 4, 436),(3, 3, 2, 4, 386);
UNLOCK TABLES;


SET FOREIGN_KEY_CHECKS=1;
COMMIT;
--Those are all the queries used to implement our website

--operation to employee table
--colon : character being used to denote the variables that will have data from the backend programming language
SELECT * FROM Employees;
INSERT INTO Employees (name, email)
	VALUES (:name,:email);
DELETE FROM Employees WHERE id_employee = :id;
UPDATE Employees SET name = :name, email = :email WHERE id_employee = :id;

--operation to customers table
--colon : character being used to denote the variables that will have data from the backend programming language
SELECT * FROM Customers;
INSERT INTO Customers (name, email)
	VALUES (:name,:email);
DELETE FROM Employees WHERE id_employee = :id;
UPDATE Employees SET name = :name, email = :email WHERE id_customer = :id;

--operation to Orders table
--colon : character being used to denote the variables that will have data from the backend programming language
SELECT * FROM Orders;
INSERT INTO Orders (date, id_location, id_customer, id_employee)
	VALUES (:date,:location, :customer, :employee);
DELETE FROM Orders WHERE id_order = :id;
UPDATE Orders SET date = :date, id_location = :location, id_customer = :customer, id_employee = :employee WHERE id_order = :id;

--operation to Orders_Wheels_Intersections table
--colon : character being used to denote the variables that will have data from the backend programming language
SELECT id_intersection AS ID, id_wheel, Wheels.name, id_order, order_quantity, transaction_price_per_wheel FROM Orders_Wheels_Intersections
INNER JOIN Wheels 
on Orders_Wheels_Intersections.id_wheel = Wheels.id_wheel;
INSERT INTO Orders_Wheels_Intersections (id_order, id_wheel, order_quantity, transaction_price_per_wheel)
	VALUES (:id_order,:id_wheel, :order_quantity, :transaction_price_per_wheel);
DELETE FROM Orders_Wheels_Intersections WHERE id_intersection = :id;
UPDATE Orders_Wheels_Intersections SET id_order = :id_order, id_wheel = :id_wheel, order_quantity = :order_quantity, transaction_price_per_wheel= :transaction_price_per_wheel WHERE id_intersection = :id;

--operation to Locations table
--colon : character being used to denote the variables that will have data from the backend programming language
SELECT * FROM Locations;
INSERT INTO Locations (address)
	VALUES (:address);
DELETE FROM Locations WHERE id_location = :id;
UPDATE Locations SET address = :address WHERE id_location = :id;

--operation to Wheel_Types table
--colon : character being used to denote the variables that will have data from the backend programming language
SELECT * FROM Wheels;
SELECT * FROM Wheels WHERE name = :name;
INSERT INTO Wheels (name)
	VALUES (:name);
DELETE FROM Wheels WHERE id_wheel = :id;
UPDATE Wheels SET name = :name WHERE id_wheel = :id_wheel;


--query for the Orders page
SELECT * FROM Orders;
INSERT INTO Orders (date, id_location, id_customer, id_employee)
	VALUES (:date, :id_location, :id_customer, id_employee);
DELETE FROM Orders WHERE id_order = :id;
UPDATE Orders SET date = :date, id_location = :id_location, id_customer = :id_customer, id_employee = :id_employee WHERE id_order = :id_order;












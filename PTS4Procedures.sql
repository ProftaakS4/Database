--Note to self add 'p_'
DELIMITER $$
CREATE PROCEDURE insertUser(IN p_type varchar(255),
							IN p_firstname varchar(255),
							IN p_lastname varchar(255),
							IN p_streetname varchar(255),
							IN p_housenumber varchar(255),
							IN p_zipcode varchar(255),
							IN p_city varchar(255),
							IN p_phonenumber varchar(255),
							IN p_iban varchar(255),
							IN p_emailaddress varchar(255),
							IN p_password varchar(255))
	BEGIN
	INSERT INTO USER (Type, Firstname, Lastname, Streetname, Housenumber, Zipcode, City, Phonenumber, IBAN, Emailaddress, Password)
	VALUES(p_type,p_firstName,p_lastName,p_streetname,p_housenumber,p_zipcode,p_city,p_phonenumber,p_iban,p_emailaddress,p_password);
	END //
DELIMITER ;

DELIMITER $$
CREATE PROCEDURE insertProduct(IN p_type varchar(255),
								IN p_material varchar(255),
								IN p_description varchar(255),
								IN p_image varchar(255),
								IN p_stock Integer(10))
	BEGIN
	INSERT INTO PRODUCT (Type, Material, Description, Image, Stock)
	VALUES(p_type, p_material, p_description, p_image, p_stock)
	END //
DELIMITER ;

DELIMITER $$
CREATE PROCEDURE insertDVD(IN p_user_id int,
                            OUT p_dvdid integer(11))
	BEGIN
	INSERT INTO DVD (PHOTOGRAPHER_ID, `Date`)
	VALUES(p_user_id,CURRENT_DATE());

    set p_dvdid = LAST_INSERT_ID();
	END //
DELIMITER ;

DELIMITER $$
CREATE PROCEDURE insertPhotographer_Product(IN p_user_id int,
											IN p_product_id int,
											IN p_price decimal(19,0))
	BEGIN
	INSERT INTO PHOTOGRAPHER_PRODUCT (USER_ID, PRODUCT_ID, Price)
	VALUES(p_user_id, p_product_id, p_price)
	END //
DELIMITER ;

DELIMITER $$
CREATE PROCEDURE insertPhoto(IN p_user_id int,
								IN p_map_id int,
								IN p_loginID varchar(255),
								IN p_type varchar(255),
								IN p_image varchar(255),
								IN p_resolution varchar(255),
								IN p_description varchar(255))
	BEGIN
	INSERT INTO PHOTO (ACCOUNT_ID, MAP_ID, LoginID, Type, Image, Resolution, Description)
	VALUES (p_user_id, p_map_id, p_loginID, p_type, p_image, p_resolution, p_description)
	END //
DELIMITER ;

DELIMITER $$									--Comment not same as DVD date
CREATE PROCEDURE insertOrder(IN p_user_id int,
								IN p_date date,
								IN p_status varchar(255))
	BEGIN
	INSERT INTO "ORDER" (USER_ID, "DATE", Status)
	VALUES (p_user_id, p_date, p_status)
	END //
DELIMITER ;

DELIMITER $$											--Date DVD
CREATE PROCEDURE insertTransaction(IN p_order_ID int,
									IN p_date date,
									IN p_type varchar(255),
									IN p_iban varchar(255),
									IN p_price decimal(19,0))
	BEGIN
	INSERT INTO "TRANSACTION" (ORDER_ID, "Date", Type, IBAN, Price)
	VALUES (p_order_ID, p_date, p_type, p_iban, p_price)
	END //
DELIMITER ;

DELIMITER $$
CREATE PROCEDURE insertPrintOrder(IN p_transaction_ID int,
									IN p_date date))
	BEGIN
	INSERT INTO PRINTORDER (TRANSACTION_ID, "Date")
	VALUES (p_transaction_ID, p_date)
	END //
DELIMITER ;

DELIMITER $$
CREATE PROCEDURE insertLogincode(IN p_map_id int,
									IN p_superuser_ID int,
									IN p_user_id int,
									IN p_used int,
									IN p_validUntil date)
	BEGIN
	INSERT INTO LOGINCODE (MAP_ID, SUPERUSER_ID, USER_ID, used, ValidUntil) --used should start with U
	VALUES (p_map_id, p_superuser_ID, p_user_id, p_used, p_validUntil)
	END //
DELIMITER ;

DELIMITER $$
CREATE PROCEDURE insertMap(IN p_dvd_ID int,
							IN p_path varchar(255),
                            OUT p_mapid))
	BEGIN
	INSERT INTO MAP (DVD_ID, Path)
	VALUES (p_dvd_ID, p_path);
    set p_mapid = LAST_INSERT_ID();
	END //
DELIMITER ;

--SELECT
DELIMITER $$
CREATE PROCEDURE getUserPassword(IN p_userID int,
								IN p_password varchar(255),
								OUT p_passed varchar(255))
	BEGIN
	DECLARE
	dbpass varchar(255) default null
	SELECT Password
	INTO dbpass
	FROM "USER"
	WHERE ID = p_userID;
	--note
	IF p_password == "" THEN
		SET p_passed = "User not found";
		ELSE IF p_password != dbpass THEN
		SET p_passed = "false";
		ELSE IF p_password == dbpass THEN
		SET p_passed = "true";
		ELSE
		SET p_passed = "null";
	END IF;
	END //
DELIMITER ;

DELIMITER $$
CREATE PROCEDURE getUserInformation(IN p_id int,
									OUT p_firstname varchar(255),
									OUT	p_lastname varchar(255),
									OUT	p_streetname varchar(255),
									OUT	p_housenumber varchar(255),
									OUT	p_zipcode varchar(255),
									OUT	p_city varchar(255),
									OUT	p_phonenumber varchar(255),
									OUT	p_iban varchar(255),
									OUT	p_emailaddress varchar(255),
									OUT	p_password varchar(255))
	BEGIN
	DECLARE
	SELECT Firstname, Lastname, Streetname, Housenumber, Zipcode, City, Phonenumber, IBAN, Emailaddress, Password
	INTO p_firstname, p_lastname, p_streetname, p_housenumber, p_zipcode, p_city, p_phonenumber, p_iban, p_emailaddress, p_password
	FROM "USER"
	WHERE ID = id;
	RETURN
	END //
DELIMITER ;

DELIMITER $$
CREATE PROCEDURE getPhotosUser (IN p_id int,
								OUT p_photos)
	BEGIN
	DECLARE
	photosID varchar(255) default null;
	v_finished int DEFAULT 0;
	DECLARE photo_cursor CURSOR FOR
		SELECT ID
		FROM PHOTO
		WHERE USER_ID = p_id;
	DECLARE CONTINUE HANDLER
		FOR NOT FOUND SET v_finished = 1;
	OPEN photo_cursor;
	get_photos: LOOP
	FETCH photo_cursor INTO photosID;
	
	IF v_finished = 1 THEN
	LEAVE get_photos;
	END IF;
	
	SET p_photos = CONCAT(photosID, ";", photos);
	END LOOP get_photos;
	CLOSE photo_cursor;
	END //
DELIMITER ;

DELIMITER $$
CREATE PROCEDURE getPhotosUserPerType (IN p_id int,
										IN p_type varchar(255),
										OUT p_photos varchar(255))
	BEGIN
	DECLARE
	v_photosID varchar(255) default null;
	v_finished int DEFAULT 0;
	DECLARE photo_cursor CURSOR FOR
		SELECT ID
		FROM PHOTO
		WHERE USER_ID = p_id
		AND Type = p_type;
	DECLARE CONTINUE HANDLER
		FOR NOT FOUND SET v_finished = 1;
	OPEN photo_cursor;
	get_photos: LOOP
	FETCH photo_cursor INTO v_photosID;
	
	IF v_finished = 1 THEN
	LEAVE get_photos;
	END IF;
	
	SET p_photos = CONCAT(v_photosID, ";", photos);
	END LOOP get_photos;
	CLOSE photo_cursor;
	END //
DELIMITER ;

DELIMITER $$
CREATE PROCEDURE getGroupPhotos (OUT p_photos varchar(255))
	BEGIN
	DECLARE
	v_photosID varchar(255) default null;
	v_finished int DEFAULT 0;
	DECLARE photo_cursor CURSOR FOR
		SELECT ID
		FROM PHOTO
		WHERE Type = p_type;
	DECLARE CONTINUE HANDLER
		FOR NOT FOUND SET v_finished = 1;
	OPEN photo_cursor;
	get_photos: LOOP
	FETCH photo_cursor INTO v_photosID;
	
	IF v_finished = 1 THEN
	LEAVE get_photos;
	END IF;
	
	SET p_photos = CONCAT(v_photosID, ";", photos);
	END LOOP get_photos;
	CLOSE photo_cursor;
	END //
DELIMITER ;

DELIMITER $$
CREATE PROCEDURE checkLogincode(IN p_user_id int,
								IN p_logincode int,
								OUT p_passed varchar(255))
	BEGIN
	DECLARE
	v_loginCode int default 0;
	SELECT ID
	INTO v_loginCode
	FROM LOGINCODE
	WHERE USER_ID = p_user_id
	AND ID = p_logincode
	AND ValidUntil >= CURDATE();
	
	IF v_loginCode == logincode THEN
	SET p_passed = "true";
	ELSE IF
	SET p_passed = "false";
	END IF;
	RETURN
	END //
DELIMITER ;
	
DELIMITER $$
CREATE PROCEDURE getOrders(IN p_user_id int,
							OUT p_orders varchar(255))
	BEGIN
	DECLARE
	orderID varchar(255) default null;
	v_finished int DEFAULT 0;
	DECLARE order_cursor CURSOR FOR
		SELECT ID
		FROM "ORDER"
		WHERE USER_ID = p_user_id
		AND Date <= CURDATE();
	DECLARE CONTINUE HANDLER
		FOR NOT FOUND SET v_finished = 1;
	OPEN order_cursor;
	get_orders: LOOP
	FETCH order_cursor INTO orderID;
	
	IF v_finished = 1 THEN
	LEAVE get_orders;
	END IF;
	
	SET p_orders = CONCAT(orderID, ";", p_orderS);
	END LOOP get_orders;
	CLOSE order_cursor;
	END //
DELIMITER ;

DELIMITER $$
CREATE PROCEDURE getOrderDate(IN p_id int,
								OUT p_orderdate date)
	BEGIN
	SELECT "Date" 
	INTO p_orderdate
	FROM "ORDER"
	WHERE ID = p_id;
	END //
DELIMITER ;

DELIMITER $$
CREATE PROCEDURE getStock(IN p_product_id int,
							OUT p_stock int)
	BEGIN
	SELECT Stock
	INTO p_stock
	FROM PRODUCT
	WHERE ID = p_product_id;
	RETURN
	END //
DELIMITER ;

DELIMITER $$
CREATE PROCEDURE addStock(IN p_product_id int,
							IN p_amount int)
	BEGIN
	UPDATE PRODUCT
	SET  Stock = Stock + p_amount
	WHERE ID = p_product_id;
	END //
DELIMITER ;

DELIMITER $$
CREATE PROCEDURE changePassword(IN p_user_id int,
								IN p_newPassword varchar(255))
	BEGIN
	UPDATE "USER"
	SET Password = p_newPassword
	WHERE ID = p_user_id;
	END //
DELIMITER ;

DELIMITER $$
CREATE PROCEDURE changeProfile(IN p_firstname varchar(255),
								IN p_lastName varchar(255), 
								IN p_streetname varchar(255), 
								IN p_housenumber varchar(255), 
								IN p_zipcode varchar(255), 
								IN p_city varchar(255), 
								IN p_phonenumber varchar(255), 
								IN p_iban varchar(255), 
								IN p_emailaddress varchar(255), 
								IN p_password varchar(255))
	BEGIN
	UPDATE "USER"
	SET Firstname = p_firstname,
		Lastname = p_lastname,
		Streetname = p_streetname,
		Housenumber = p_housenumber,
		Zipcode = p_zipcode,
		City = p_city,
		Phonenumber = p_phonenumber,
		IBAN = p_iban,
		Emailaddress = p_emailaddress,
		Password = p_password;
	END //
DELIMITER ;

DELIMITER $$
CREATE PROCEDURE getLoginCodes(IN p_userid int)
	BEGIN
	SELECT lc.ID, u.Firstname, u.Lastname, u.Streetname, u.Housenumber, lc.ValidUntil
	FROM LOGINCODE lc, "USER" u
	WHERE lc.USER_ID = u.ID
	AND lc.SUPERUSER_ID = p_userid; 
	END //
DELIMITER ;

DELIMITER $$
CREATE PROCEDURE changeProductPrice(IN p_userid int, 
									IN p_productid int, 
									IN p_newprice decimal(19,0))
	BEGIN
	UPDATE PHOTOGRAPHER_PRODUCT
	SET Price = p_newPrice
	WHERE USER_ID = p_userid
	AND PRODUCT_ID = p_productid;
	END //
DELIMITER ;

DELIMITER $$
CREATE PROCEDURE changeProductInfo(IN p_id int, 
									IN p_type varchar(255), 
									IN p_material varchar(255), 
									IN p_description varchar(255), 
									IN p_image varchar(255))
	BEGIN
	UPDATE PRODUCT
	SET Type = p_type,
		Material = p_material,
		Description = p_description,
		Image = p_image
	WHERE ID = p_id;
	END //
DELIMITER ;

DELIMITER $$
CREATE PROCEDURE changePhotoDescription(IN p_id int, 
										IN p_newResolution varchar(255), 
										IN p_newDescription varchar(255))
	BEGIN
	UPDATE PHOTO
	SET Description = p_newDescription, Resolution = p_newResolution
	WHERE ID = p_id;
	END //
DELIMITER ;

DELIMITER $$
CREATE PROCEDURE useLogincode(IN p_id int)
	BEGIN
	UPDATE LOGINCODE
	SET used = used + 1;
	WHERE ID = p_id;
	END //
DELIMITER ;

DELIMITER $$
CREATE PROCEDURE getOrders(IN p_userid int)
	BEGIN
	SELECT ID, "Date", Status
	FROM ORDER
	WHERE USER_ID = p_userid;
	END //
DELIMITER ;

DELIMITER $$
CREATE PROCEDURE getTransaction(IN p_orderid int)
	BEGIN
	SELECT ID, "Date", TYpe, IBAN,  Price
	FROM "TRANSACTION"
	WHERE ORDER_ID = p_orderid;
	END //
DELIMITER ;

DELIMITER $$
CREATE PROCEDURE getPrintOrder(IN p_transactionid int)
	BEGIN
	SELECT ID, "Date"
	FROM PRINTORDER
	WHERE TRANSACTION_ID = p_transactionid;
	END //
DELIMITER ;

DELIMITER $$
CREATE PROCEDURE getEmails()
	BEGIN
	SELECT Emailaddress
	FROM "USER";
	END //
DELIMITER ;

DELIMITER $$
CREATE PROCEDURE getIBAN()
	BEGIN
	SELECT IBAN
	FROM "USER";
	END //
DELIMITER ;

DELIMITER $$
CREATE PROCEDURE changeOrderStatus(IN p_orderID int, 
									IN p_newStatus varchar(255))
	BEGIN
	UPDATE "ORDER"
	SET Status = p_newStatus
	WHERE ID = p_orderID;
	END //
DELIMITER ;

DELIMITER $$
CREATE PROCEDURE searchPhoto(IN p_userid int, 
								IN p_searchedText varchar(255))
	BEGIN
	SELECT ID, USER_ID, MAP_ID, LoginID, Type, Image, Resolution, Description
	FROM PHOTO
	WHERE USER_ID = p_userid
	AND Description LIKE CONCAT('%', p_description, '%';
	END //
DELIMITER ;

--DELIMITER $$
--CREATE PROCEDURE --

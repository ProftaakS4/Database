-- INSERT TEST DATA

-- TABLE USER 
INSERT INTO USER (ID, Type, Firstname, Lastname, Streetname, Housenumber, Zipcode, City, Phonenumber, IBAN, Emailaddress, Password) 
VALUES (1, 'School photographer','Jaap', 'Stam','Schoolstraat','24','6161AA','Roermond','06-23657483', 'NL16RABO0223478566',LOWER('J.stam@beer.nl'),'jaapstam');
INSERT INTO USER (ID, Type, Firstname, Lastname, Streetname, Housenumber, Zipcode, City, Phonenumber, IBAN, Emailaddress, Password)
VALUES (2, 'Portrait photographer','Pieter', 'Daemen','Willemstraat','42','6001TY','Sittard','06-78359574', 'NL76ABNA0223478888',LOWER('P.deamen@xs4all.nl'),'pieterdaemen');
INSERT INTO USER (ID, Type, Firstname, Lastname, Streetname, Housenumber, Zipcode, City, Phonenumber, IBAN, Emailaddress, Password)
VALUES (3, 'School- Portraitphotographer','Kevin', 'Meesters','De Singel','114','5467','Venray','06-25369599', 'NL16RABO776589734',LOWER('k.meesters@foto.nl'),'kevinmeesters');
INSERT INTO USER (ID, Type, Firstname, Lastname, Streetname, Housenumber, Zipcode, City, Phonenumber, IBAN, Emailaddress, Password)
VALUES (4, 'Customer','Carli', 'Kleijnen','Het Hoff','1','3267XE','Eindhoven','06-23657483', 'NL16RABO0223478936',LOWER('c.kleijnen@fontys.nl'),'carlikleijnen');
INSERT INTO USER (ID, Type, Firstname, Lastname, Streetname, Housenumber, Zipcode, City, Phonenumber, IBAN, Emailaddress, Password)
VALUES (5, 'Financial Administration','Mirthe', 'Heersen','DeG gildelaan','98','3498UT','Maastricht','0475866453', 'NL16INGB0994832884',LOWER('m.heersen@fotoshop.nl'),'mirtheheersen');
INSERT INTO USER (ID, Type, Firstname, Lastname, Streetname, Housenumber, Zipcode, City, Phonenumber, IBAN, Emailaddress, Password)
VALUES (6, 'Admin','Wilrik', 'DeLoose','Grevelinkhof','43','4583RT','Tilburg','06-12345678', 'NL16SNSB0995476382',LOWER('w.deloose@fontys.nl'),'wilrikdeloose');

-- TABLE DVD
INSERT INTO DVD (ID, USER_ID, Date) 
VALUES (1, 1, '20160410 09:33:09 AM');
INSERT INTO DVD (ID, USER_ID, Date) 
VALUES (2, 2, '20160328 11:44:09 AM');
INSERT INTO DVD (ID, USER_ID, Date) 
VALUES (3, 2, '20160216 07:54:09 AM');

-- TABLE MAP
INSERT INTO MAP (ID, DVD_ID, Path)
VALUES(1,1,'/root/Documents/Pictures/Import/DVD1');
INSERT INTO MAP (ID, DVD_ID, Path)
VALUES(2,2,'/root/Documents/Pictures/Import/DVD2');
INSERT INTO MAP (ID, DVD_ID, Path)
VALUES(3,3,'/root/Documents/Pictures/Import/DVD3');

-- TABLE LOGINCODE
INSERT INTO LOGINCODE(ID, MAP_ID,SUPERUSER_ID,USER_ID,used,ValidUntil)
VALUES(1,1,1,4,0,'20160413 12:03:09 AM');
INSERT INTO LOGINCODE(ID, MAP_ID,SUPERUSER_ID,USER_ID,used,ValidUntil)
VALUES(2,2,2,4,0,'20160609 10:39:09 AM');
INSERT INTO LOGINCODE(ID, MAP_ID,SUPERUSER_ID,USER_ID,used,ValidUntil)
VALUES(3,3,3,4,0,'20160524 09:24:09 AM');

-- TABLE PHOTO
INSERT INTO PRODUCT (ID, USER_ID, MAP_ID, LoginID, Type, Image, Resolution, Description) 
VALUES (1,1,1,1,'Portrait','/root/Documents/Pictures/Import/DVD1/Portret/Map1','1920x1080','Summer 2016');
INSERT INTO PRODUCT (ID, USER_ID, MAP_ID, LoginID, Type, Image, Resolution, Description) 
VALUES (2,2,2,2,'School','/root/Documents/Pictures/Import/DVD2/Portret/Map2','1920x1080','PickNick');
INSERT INTO PRODUCT (ID, USER_ID, MAP_ID, LoginID, Type, Image, Resolution, Description) 
VALUES (3,3,2,2,'Group','/root/Documents/Pictures/Import/DVD2/Portret/Map3','1920x1080','Finally 18+');
INSERT INTO PRODUCT (ID, USER_ID, MAP_ID, LoginID, Type, Image, Resolution, Description) 
VALUES (4,4,3,3,'Portrait','/root/Documents/Pictures/Import/DVD3/Portret/Map6','1920x1080','Only blue');


-- TABLE PRODUCT
INSERT INTO PRODUCT (ID, Type, Material, Description, Image, Stock) 
VALUES (1, 'PHOTO1x2','PAPIER', 'Foto van formaat 1x2.','/Product/1', -1);
INSERT INTO PRODUCT (ID, Type, Material, Description, Image, Stock) 
VALUES (2, 'PHOTO2x4','PAPIER', 'Foto van formaat 2x4.','/Product/2', -1);
INSERT INTO PRODUCT (ID, Type, Material, Description, Image, Stock) 
VALUES (3, 'PHOTO5x8','PAPIER', 'Foto van formaat 5x8.','/Product/3', -1);
INSERT INTO PRODUCT (ID, Type, Material, Description, Image, Stock) 
VALUES (4, 'MUISMAT','RUBBER', 'Foto op een muismat.','/Product/4', 19);
INSERT INTO PRODUCT (ID, Type, Material, Description, Image, Stock) 
VALUES (5, 'TASSEN','KATOEN', 'Foto een stoffen herbruikbare draagtas.','/Product/5', 230);
INSERT INTO PRODUCT (ID, Type, Material, Description, Image, Stock) 
VALUES (6, 'TSHIRT','KATOEN', 'Foto op een shirt.','/Product/6', 10);
INSERT INTO PRODUCT (ID, Type, Material, Description, Image, Stock) 
VALUES (7, 'MOK','KERAMRIEK', 'Foto op een mok.','/Product/7', 22);
INSERT INTO PRODUCT (ID, Type, Material, Description, Image, Stock) 
VALUES (8, 'CANVAS','CANVAS', 'Foto bedrukt op een canvas','/Product/8', 114);
INSERT INTO PRODUCT (ID, Type, Material, Description, Image, Stock) 
VALUES (9, 'DIBOND','METAAL', 'Foto op een bidond.','/Product/9', 8);



-- TABLE PHOTOGRAPHER_PRODUCT
INSERT INTO PHOTOGRAPHER_PRODUCT (USER_ID, PRODUCT_ID, Price) 
VALUES (1, 1, 6.50);
INSERT INTO PHOTOGRAPHER_PRODUCT (USER_ID, PRODUCT_ID, Price) 
VALUES (1, 2, 8.00);
INSERT INTO PHOTOGRAPHER_PRODUCT (USER_ID, PRODUCT_ID, Price) 
VALUES (1, 3, 13.50);
INSERT INTO PHOTOGRAPHER_PRODUCT (USER_ID, PRODUCT_ID, Price) 
VALUES (2, 1, 6.50);
INSERT INTO PHOTOGRAPHER_PRODUCT (USER_ID, PRODUCT_ID, Price) 
VALUES (2, 2, 9.00);
INSERT INTO PHOTOGRAPHER_PRODUCT (USER_ID, PRODUCT_ID, Price) 
VALUES (2, 3, 13.00);



-- TABLE ORDER
INSERT INTO ORDER(ID, USER_ID, Date,Status)
VALUES (1,1,'20160618 10:38:09 AM','Paid'); 
INSERT INTO ORDER(ID, USER_ID, Date,Status)
VALUES (2,1,'20160718 11:35:09 AM','Not paid');
INSERT INTO ORDER(ID, USER_ID, Date,Status)
VALUES (3,1,'20160808 13:39:09 AM','Not paid');
INSERT INTO ORDER(ID, USER_ID, Date,Status)
VALUES (4,1,'20160528 12:36:09 AM','Paid');
INSERT INTO ORDER(ID, USER_ID, Date,Status)
VALUES (5,1,'20160416 09:31:09 AM','Not paid');

-- TABLE ORDER_PRODUCT
INSERT INTO ORDER_PRODUCT(ORDER_ID,PRODUCT_ID,PHOTO_ID,FilterType,Amount)
VALUES(1,1,1,'Sepia',1);
INSERT INTO ORDER_PRODUCT(ORDER_ID,PRODUCT_ID,PHOTO_ID,FilterType,Amount)
VALUES(2,2,2,'Black/White',3);
INSERT INTO ORDER_PRODUCT(ORDER_ID,PRODUCT_ID,PHOTO_ID,FilterType,Amount)
VALUES(3,4,3,'Color',11);
INSERT INTO ORDER_PRODUCT(ORDER_ID,PRODUCT_ID,PHOTO_ID,FilterType,Amount)
VALUES(4,5,4,'Color',5);

-- TABLE TRANSACTION
INSERT INTO TRANSACTION(ID,ORDER_ID,Date,Type,IBAN,Price)
VALUES(1,1,'20160618 10:34:09 AM', 'PayPal','NL16RABO0223478936',19.99);
INSERT INTO TRANSACTION(ID,ORDER_ID,Date,Type,IBAN,Price)
VALUES(2,2,'20160713 17:34:09 AM', 'iDeal','NL16SNSB0995476382',29.99);
INSERT INTO TRANSACTION(ID,ORDER_ID,Date,Type,IBAN,Price)
VALUES(3,3,'20160624 11:34:09 AM', 'Google-Checkout','NL16INGB0994832884',9.99);
INSERT INTO TRANSACTION(ID,ORDER_ID,Date,Type,IBAN,Price)
VALUES(4,4,'20160509 9:34:09 PM', 'Ogine','NL76ABNA0223478888',14.99);

-- TABLE PRINTORDER
INSERT INTO PRINTORDER(ID, TRANSACTION_ID,Date)
VALUES(1,1,'20160618 10:34:09 AM');
INSERT INTO PRINTORDER(ID, TRANSACTION_ID,Date)
VALUES(2,2,'20160713 17:34:09 AM');
INSERT INTO PRINTORDER(ID, TRANSACTION_ID,Date)
VALUES(3,3,'20160624 11:34:09 AM');
INSERT INTO PRINTORDER(ID, TRANSACTION_ID,Date)
VALUES(4,4,'20160509 9:34:09 PM');








